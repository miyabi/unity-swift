# unity-swift

> Forked from [richardschembri/unity-swift](https://github.com/richardschembri/unity-swift)

Native plugin to write native code in [Swift](https://swift.org) for [Unity](http://unity3d.com/).


Unity 2019.4.1f1

Xcode 11.5

## You'll need to edit the Xcode project as it comes out of Unity in order for it to build correctly.

### 1. Add your header file to `UnityFramework.h`.
Import your header file.

<img width="783" alt="スクリーンショット 2020-07-22 18 26 54" src="https://user-images.githubusercontent.com/15327448/88161168-9c4a9080-cc4a-11ea-8c42-f9d2390f193d.png">

### 2. Edit `Unityframework` Build Phases.
Drag your header file.

<img width="831" alt="スクリーンショット 2020-07-22 18 27 26" src="https://user-images.githubusercontent.com/15327448/88161130-8e950b00-cc4a-11ea-9ee6-ea0510b49852.png">

### Do we have to do this every time?
As far as I have been able to find out, yes. If there is a simpler way to do this, I would like to hear about it.

## References
 * [Swift iOS native plugins hurdles](https://forum.unity.com/threads/swift-ios-native-plugins-hurdles.802623/#post-5527207)
 * [Problems Building a native plugin for iOS Library with swift in Unity 2019.3](https://forum.unity.com/threads/problems-building-a-native-plugin-for-ios-library-with-swift-in-unity-2019-3.878392/)

 ## How to use?
 Please refer to the original fork.
 https://github.com/richardschembri/unity-swift/blob/master/README.md
