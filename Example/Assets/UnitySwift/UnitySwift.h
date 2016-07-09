//
//  UnitySwift.h
//  Unity-iPhone
//
//  Created by Masayuki Iwai on 2016/06/27.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UnityForwardDecls.h"

@interface UnitySwift : NSObject

#pragma mark - controling player internals

+ (void)sendMessage:(NSString *)target method:(NSString *)method message:(NSString *)message;

#pragma mark - UnityAppController.mm

+ (UIViewController *)getGLViewController;
+ (UIView *)getGLView;
+ (UIWindow *)getMainWindow;
+ (ScreenOrientation)currentOrientation;

#pragma mark - Unity/DisplayManager.mm

+ (float)screenScaleFactor:(UIScreen *)screen;

@end
