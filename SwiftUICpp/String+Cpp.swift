//
//  String+Cpp.swift
//  SwiftUICpp
//
//  Created by Alexander Kremer on 07/02/2020.
//  Copyright © 2020 GetSchwifty. All rights reserved.
//

import Foundation

extension UnsafePointer where Pointee == Int8 {
    var str : String {
        return NSString(utf8String: self)! as String
    }
}
