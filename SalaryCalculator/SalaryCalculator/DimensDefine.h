//
//  DimensMacros.h
//
//  Created by jin on 15/6/22.
//  Copyright (c) 2015年 Art. All rights reserved.
//


#ifndef DimensMacros_h
#define DimensMacros_h

#define kSystemVersion              [[UIDevice currentDevice] systemVersion]

#define kScreenBounds               [[UIScreen mainScreen] bounds]

#define kApplicationFrame           [[UIScreen mainScreen] applicationFrame]


#define kScreenScale                ([UIScreen instancesRespondToSelector:@selector(scale)]?[[UIScreen mainScreen] scale]:(1.0f))

#define kScreenNativeScale          (ceilf([UIScreen instancesRespondToSelector:@selector(nativeScale)]?[[UIScreen mainScreen] nativeScale]:(kScreenScale)))

#define kIntegerScreenScale         ((kScreenScale > 1.5f)?(2):(1))



#define kScreenWidth                ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight               ([[UIScreen mainScreen] bounds].size.height)
#define kKeyBoardMaxHeight          252.0f
#define kKeyBoardDefaultHeight      216.0f
#define kStatusBarMaxY              CGRectGetMaxY([[UIApplication sharedApplication] statusBarFrame])
#define kNavigationBarHeight        44.0f
#define kSearchBarHeight            44.0f
#define kStatusBarHeight            CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame])
#define kContentHeight              (kScreenHeight - kNavigationBarHeight - kStatusBarHeight)

#define kUserInterfaceIdiomIsPhone  (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kUserInterfaceIdiomIsPad    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define kUserInterfaceIdiomIsRetina ([[UIScreen mainScreen] scale] >= 2.0)

#define kScreenIs4InchRetina        (kUserInterfaceIdiomIsRetina && ([UIScreen mainScreen].bounds.size.height == 568.0f))
#define kScreenIsnot35              ([[UIScreen mainScreen] bounds].size.height > 480)
#define kScreenIs35Inch             ([[UIScreen mainScreen] bounds].size.height == 480)

#define SCREEN_MAX_LENGTH (MAX(kScreenWidth, kScreenHeight))
#define SCREEN_MIN_LENGTH (MIN(kScreenWidth, kScreenHeight))

#define IS_IPHONE_4_OR_LESS (kUserInterfaceIdiomIsPhone && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (kUserInterfaceIdiomIsPhone && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (kUserInterfaceIdiomIsPhone && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (kUserInterfaceIdiomIsPhone && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_5_OR_AFTER (kUserInterfaceIdiomIsPhone && SCREEN_MAX_LENGTH > 568.0)
#define IS_IPHONE_5_OR_BEFORE (kUserInterfaceIdiomIsPhone && SCREEN_MAX_LENGTH <= 568.0)


#define NSLogRect(rect) NSLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define NSLogSize(size) NSLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)
#define NSLogPoint(point) NSLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)
#define RectScreen [[UIScreen mainScreen] bounds]


#endif