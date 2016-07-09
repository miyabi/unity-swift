//
//  UnitySwift.m
//  Unity-iPhone
//
//  Created by Masayuki Iwai on 2016/06/27.
//
//

#import "UnitySwift.h"

@implementation UnitySwift

#pragma mark - controling player internals

+ (void)sendMessage:(NSString *)target method:(NSString *)method message:(NSString *)message {
    UnitySendMessage(target? target.UTF8String: "",
                     method? method.UTF8String: "",
                     message? message.UTF8String: "");
}

#pragma mark - UnityAppController.mm

+ (UIViewController *)getGLViewController {
    return UnityGetGLViewController();
}

+ (UIView *)getGLView {
    return UnityGetGLView();
}

+ (UIWindow *)getMainWindow {
    return UnityGetMainWindow();
}

+ (ScreenOrientation)currentOrientation {
    return UnityCurrentOrientation();
}

#pragma mark - Unity/DisplayManager.mm

+ (float)screenScaleFactor:(UIScreen *)screen {
    return  UnityScreenScaleFactor(screen);
}

@end
