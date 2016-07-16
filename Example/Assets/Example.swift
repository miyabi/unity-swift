//
//  Example.swift
//  Unity-iPhone
//
//  Created by Masayuki Iwai on 7/10/16.
//
//

import Foundation

class Example : NSObject {
    static func callUnityMethod(_ message: String) -> Void {
        // Call a method on a specified GameObject.
        UnitySwift.sendMessage("CallbackTarget", method: "OnCallFromSwift", message:  message)
    }
    
    static func swiftMethod(_ message: String) -> Void {
        print("\(#function) is called with message: \(message)")
        
        self.callUnityMethod("Hello, Unity!")
    }
}
