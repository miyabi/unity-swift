//
//  Example.swift
//  Unity-iPhone
//
//  Created by Masayuki Iwai on 7/10/16.
//
//

import Foundation

class Example : NSObject {
    static func callUnityMethod(_ message: String) {
        let uf = UnityFramework()
        // Call a method on a specified GameObject.
        uf.sendMessageToGO(
            withName: "CallbackTarget",
            functionName: "OnCallFromSwift",
            message: message)
    }
    
    @objc static func swiftMethod(_ message: String) {
        print("\(#function) is called with message: \(message)")
        
        self.callUnityMethod("Hello, Unity!")
    }
}
