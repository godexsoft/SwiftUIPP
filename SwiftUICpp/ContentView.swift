//
//  ContentView.swift
//  SwiftUICpp
//
//  Created by Alexander Kremer on 06/02/2020.
//  Copyright © 2020 GetSchwifty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = "Hello, C++!"
    @EnvironmentObject private var interop: CppInterop
    
    var body: some View {
        VStack {
            Text("SwiftUI++")
                .font(.largeTitle)
                .padding()
            Text("Counter is \(interop.counter)")
            HStack {
                Text("Text to send:").padding()
                TextField("Text", text: $input)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            Text(interop.response)
                .padding()
            Button(action: {
                cpp_action_test(self.input)
            }) {
                Text("Send to C++")
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
