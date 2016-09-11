//
//  SCSampleItemView.h
//  SalaryCalculator
//
//  Created by Dennis on 8/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDefaultItemWidth   150
#define kDefaultItemHeight  40


@interface SCSampleItemView : UIView

@property (readwrite, assign) NSString *text;

- (instancetype)initWithText:(NSString *)text;

@end
