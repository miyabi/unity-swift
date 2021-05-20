//
//  Example.swift
//  Unity-iPhone
//
//  Created by Masayuki Iwai on 7/10/16.
//
//

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
    
    @objc public static func swiftMethod(_ message: String) {
        print("\(#function) is called with message: \(message)")
        
        self.callUnityMethod("Hello, Unity!")
    }
}
