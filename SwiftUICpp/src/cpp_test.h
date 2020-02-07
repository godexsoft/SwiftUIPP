//
//  cpp_test.hpp
//  SwiftUICpp
//
//  Created by Alexander Kremer on 06/02/2020.
//  Copyright © 2020 GetSchwifty. All rights reserved.
//

#pragma once
#include <functional>
#include "cb_types.h"

//
// exports for swift/objective-c
//

extern "C" void application_main();
extern "C" void setup_timer_cb(VOID_CB cb);
extern "C" void setup_answer_cb(STR_CB cb);
extern "C" void cpp_action_test(const char* str);
