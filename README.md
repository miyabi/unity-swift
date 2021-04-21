# unity-swift

Native plugin to write native code in [Swift](https://swift.org) for [Unity](http://unity3d.com/).

## Downloads

Download unity-swift.unitypackage from link below:

-   [Releases · richardschembri/unity-swift](https://github.com/richardschembri/unity-swift/releases)

## Installation

1.  Open your project in Unity.
2.  Open the downloaded package by double-click or choose Assets menu > Import Package > Custom Package... to import plugin into your project.
3.  Plugin files are imported into UnitySwift folder.

## Examples

See Example/Assets/Main/Main.unity and [UIController.cs](./Example/Assets/UIController.cs).  
See [unity-replay-kit-bridge/Example/Assets/UnityReplayKitBridge at swift · miyabi/unity-replay-kit-bridge](https://github.com/miyabi/unity-replay-kit-bridge/tree/swift/Example/Assets/UnityReplayKitBridge) for an actual native plugin example.

## Usage

### How to call Unity methods

```swift
//  Example.swift

import Foundation

public class Example : NSObject {
    static func callUnityMethod(_ message: String) {
        let uf = UnityFramework.getInstance()
        // Call a method on a specified GameObject.
        uf?.sendMessageToGO(
            withName: "CallbackTarget",
            functionName: "OnCallFromSwift",
            message: message)
    }
}
```

### How to access Swift classes from Unity

#### Step 1: Create your Swift classes.

```swift
//  Example.swift

import Foundation

public class Example : NSObject {
    @objc public static func swiftMethod(_ message: String) {
        print("\(#function) is called with message: \(message)")
    }
}
```

#### Step 2: Include UnityFramework/UnityFramework-Swift.h and define C functions to wrap Swift classes in .mm file (Objective-C++).

```objc
//  Example.mm

#import <Foundation/Foundation.h>
#import <UnityFramework/UnityFramework-Swift.h>    
// Required
// This header file is generated automatically when Xcode build runs.

extern "C" {
    void _ex_callSwiftMethod(const char *message) {
        // You can access Swift classes directly here.
        [Example swiftMethod:[NSString stringWithUTF8String:message]];
    }
}
```

#### Step 3: Create interface class to call exported C functions from C&#x23;.

```csharp
// Example.cs

using System.Runtime.InteropServices;

public class Example {
    #if UNITY_IOS && !UNITY_EDITOR
    [DllImport("__Internal")]
    private static extern void _ex_callSwiftMethod(string message);
    #endif

    // Use this method to call Example.swiftMethod() in Example.swift
    // from other C# classes.
    public static void CallSwiftMethod(string message) {
        #if UNITY_IOS && !UNITY_EDITOR
        _ex_callSwiftMethod(message);
        #endif
    }
}
```

#### Step 4: Call the method from your C&#x23; code.

```csharp
Example.CallSwiftMethod("Hello, Swift!");
```

## Requirements

iOS 9 or later

## Compatibility

Unity 2019.4.1f1

Xcode 11.5
