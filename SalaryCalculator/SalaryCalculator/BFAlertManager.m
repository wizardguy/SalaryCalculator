//
//  BFAlert.m
//  BFCommon
//
//  Created by Dennis on 8/7/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "BFAlertManager.h"
#import "BFCommonUtil.h"

const NSString * const kOK = @"OK";
const NSString * const kCancel = @"Cancel";
const NSString * const kYes = @"Yes";
const NSString * const kNo = @"No";
const NSString * const kBack = @"Back";

const NSString * const kAlertTitleSuccess = @"Success!";
const NSString * const kAlertTitleFailed = @"Failed!";



@implementation BFAlertManager

static BFAlertManager *gManager = nil;

+ (instancetype)sharedInstance
{
    if (!gManager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            gManager = [[BFAlertManager alloc] init];
        });
    }
    return gManager;
}


- (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
              button1Title:(nullable NSString *)btn1Title
              button2Title:(nullable NSString *)btn2Title
            preferredStyle:(BFAlertStyle)style
                       tag:(NSInteger)tag
                  delegate:(nullable id<UIAlertViewDelegate>)delegate
                  handler1:(void (^ __nullable)(UIAlertAction * __nonnull action))handler1
                  handler2:(void (^ __nullable)(UIAlertAction * __nonnull action))handler2
        fromViewController:(nullable UIViewController *)controller
{
#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
#if __IPHONE_OS_VERSION_MIN_REQUIRED < MIN_OS_VERSION
    [self showAlertWithTitle:title message:message button1Title:btn1Title button2Title:btn2Title preferredStyle:style tag:tag delegate:delegate];
#else
    UIAlertControllerStyle convertStyle = (style == BFAlertStyleDefault) ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet;
    [self showAlertWithTitle:title message:message button1Title:btn1Title handler1:handler1 button2Title:btn2Title handler2:handler2 preferredStyle:convertStyle fromViewController:controller];
#endif
#endif
}





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
                  delegate:(nonnull id<UIAlertViewDelegate>)delegate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:btn2Title otherButtonTitles:btn1Title, nil];
    alert.tag = tag;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [alert show];
    });
    
}



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
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    UIAlertAction *action1 = btn1Title ? [UIAlertAction actionWithTitle:btn1Title style:UIAlertActionStyleDefault handler:handler1] : nil;
    UIAlertAction *action2 = btn2Title ? [UIAlertAction actionWithTitle:btn2Title style:UIAlertActionStyleCancel handler:handler2] : nil;
    if (action1) {
        [alert addAction:action1];
    }
    if (action2) {
        [alert addAction:action2];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [controller presentViewController:alert animated:YES completion:nil];
    });
}
#endif
#endif






@end
