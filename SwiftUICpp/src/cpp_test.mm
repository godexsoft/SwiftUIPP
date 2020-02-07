//
//  cpp_test.cpp
//  SwiftUICpp
//
//  Created by Alexander Kremer on 06/02/2020.
//  Copyright © 2020 GetSchwifty. All rights reserved.
//

#include <chrono>
#include <functional>
#include <iostream>

#include "cpp_test.h"
#include "objc_callback.h"

using namespace std;

// demo callbacks to interact with swift/objc
function<void()> on_timer_cb;

// setter for the callback
void setup_timer_cb(VOID_CB cb)
{
    // this cb would be somewhere inside the cpp core app instead
    on_timer_cb = objc_block<void()>(cb);
}

function<void(const char*)> on_answer_cb;
void setup_answer_cb(STR_CB cb)
{
    on_answer_cb = cb;
}


// global app state (could wrap into some struct)
auto prevtime = chrono::steady_clock::now();

// could run on a thread or like now via runloop timer
void application_main()
{
    auto curtime = chrono::steady_clock::now();

    if (chrono::duration_cast<chrono::seconds>(curtime - prevtime).count() >= 1)
    {
        prevtime = curtime;
        if (on_timer_cb) {
            on_timer_cb();
        }
    }
}

void cpp_action_test(const char* str)
{
    cout << "C++ got string: " << str << endl;
    auto response = string{"C++ heard: "} + str;
    cout << "Returning back: " << response << endl;
    
    if (on_answer_cb) {
        on_answer_cb(response.c_str());
    }
}
