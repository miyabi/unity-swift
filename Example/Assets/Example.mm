//
//  Example.mm
//  Unity-iPhone
//
//  Created by Masayuki Iwai on 7/10/16.
//
//

#import <Foundation/Foundation.h>
#import "unityswift-Swift.h"

extern "C" {
    void _ex_callSwiftMethod(const char *message) {
        [Example swiftMethod:[NSString stringWithUTF8String:message]];
    }
}
