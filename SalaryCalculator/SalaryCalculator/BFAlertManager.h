//
//  BFAlertManager.h
//  BFCommon
//
//  Created by Dennis on 8/7/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString * _Nonnull const kOK;
extern NSString * _Nonnull const kCancel;
extern NSString * _Nonnull const kYes;
extern NSString * _Nonnull const kNo;
extern NSString * _Nonnull const kBack;

extern NSString * _Nonnull const kAlertTitleSuccess;
extern NSString * _Nonnull const kAlertTitleFailed;


typedef NS_ENUM(NSUInteger, BFAlertStyle) {
    BFAlertStyleDefault = 0,
    BFAlertStyleSheet // Only available for iOS 8.0 and later
};

#define MIN_OS_VERSION 9000

@interface BFAlertManager : NSObject

+ (nonnull instancetype)sharedInstance;

/**
 * Universal API
 *
 * @param
 * tag: an alert view tag used to indentify the alert in multiple alerts senario. Could be ignored if you do not need it in delegate. (for iOS < 8.0)
 * delegate: the <UIAlertViewDelegate> delegate (for iOS < 8.0)
 *
 * controller: the presenting controller that presents the alert controller (for iOS >= 8.0)
 *
 * @discussion
 * By default: 
 * button1 - action button
 * button2 - cancel button
 * Set button title = nil to remove the button.
 */

- (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
              button1Title:(nullable NSString *)btn1Title
              button2Title:(nullable NSString *)btn2Title
            preferredStyle:(BFAlertStyle)style
                       tag:(NSInteger)tag
                  delegate:(nullable id<UIAlertViewDelegate>)delegate
                  handler1:(void (^ __nullable)(UIAlertAction * __nonnull action))handler1
                  handler2:(void (^ __nullable)(UIAlertAction * __nonnull action))handler2
        fromViewController:(nullable UIViewController *)controller;



// minium deploy target version
#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
// target is lower than iOS 9.0
#if __IPHONE_OS_VERSION_MIN_REQUIRED < MIN_OS_VERSION
- (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
              button1Title:(nullable NSString *)btn1Title
              button2Title:(nullable NSString *)btn2Title
            preferredStyle:(UIAlertViewStyle)style
                       tag:(NSInteger)tag
                  delegate:(__weak nonnull id<UIAlertViewDelegate>)delegate;

// target is at least iOS 9.0
#else
- (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
              button1Title:(nullable NSString *)btn1Title
                  handler1:(void (^ __nullable)(UIAlertAction * __nonnull action))handler1
              button2Title:(nullable NSString *)btn2Title
                  handler2:(void (^ __nullable)( UIAlertAction * __nonnull action))handler2
            preferredStyle:(UIAlertControllerStyle)style
        fromViewController:(nonnull UIViewController *)controller;
#endif
#endif



@end
