# unity-swift

Native plugin to write native code in [Swift](https://swift.org) for [Unity](http://unity3d.com/).

## Downloads

Download unity-swift.unitypackage from link below:

-   [Releases · miyabi/unity-swift](https://github.com/miyabi/unity-swift/releases)

## Installation

1.  Open your project in Unity.
2.  Open the downloaded package by double-click or choose Assets menu > Import Package > Custom Package... to import plugin into your project.
3.  Plugin files are imported into UnitySwift folder.

## Examples

See Example/Assets/Main/Main.unity and [UIController.cs](./Example/Assets/UIController.cs).  
See [miyabi/unity-replay-kit-bridge at swift](https://github.com/miyabi/unity-replay-kit-bridge/tree/swift) for an actual native plugin example.

## Usage

### How to call Unity methods

Functions defined in *UnityInterface.h* are exported as static methods in UnitySwift Objective-C class, so you can use them in your Swift codes.  
(Currentry only some frequently used functions are exported. See the [UnitySwift Class Reference](./reference.md).)

```swift
//  Example.swift

import Foundation

class Example : NSObject {
    static func callUnityMethod(_ message: String) -> Void {
        // Call a method on a specified GameObject.
        UnitySwift.sendMessage("CallbackTarget", method: "OnCallFromSwift", message:  message)
    }
}
```

### How to access Swift classes from Unity

#### Step 1: Create your Swift classes.

```swift
//  Example.swift

import Foundation

class Example : NSObject {
    static func swiftMethod(_ message: String) -> Void {
        print("\(#function) is called with message: \(message)")
    }
}
```

#### Step 2: Include "unityswift-Swift.h" and define C functions to wrap Swift classes in .mm file (Objective-C++).

```objc
//  Example.mm

#import <Foundation/Foundation.h>
#import "unityswift-Swift.h"    // Required
                                // This header file is generated automatically when Xcode build runs.

extern "C" {
    void _ex_callSwiftMethod(const char *message) {
        // You can access Swift classes directly here.
        [Example swiftMethod:[NSString stringWithUTF8String:message]];
    }
}
```

-   "unityswift-Swift.h" file name is defined in "Objective-C Generated Interface Header Name" entry in Build Settings. This setting and other settings about Swift compiler are set automatically by [PostProcesser](./Example/Assets/UnitySwift/Editor/PostProcessor.cs) when the Unity build runs.

#### Step 3: Create interface class to call exported C functions from C&#x23;.

```csharp
// Example.cs

using System.Runtime.InteropServices;

public class Example {
    #if UNITY_IOS && !UNITY_EDITOR
    [DllImport("__Internal")]
    private static extern void _ex_callSwiftMethod(string message);
    #endif

    // You can use this method to call Example.swiftMethod() in Example.swift from other C# classes.
    public static void CallSwiftMethod(string message) {
        #if UNITY_IOS && !UNITY_EDITOR
        _ex_callSwiftMethod(message);
        #endif
    }
}
```

## Requirements

iOS 7 or later

## Compatibility

Unity 5.3.5f1  
Xcode 7.3.1
