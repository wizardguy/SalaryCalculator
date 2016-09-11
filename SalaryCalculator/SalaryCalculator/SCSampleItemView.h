//
//  SCSampleItemView.h
//  SalaryCalculator
//
//  Created by Dennis on 8/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDefaultItemWidth   150
#define kDefaultItemHeight  80


@protocol SCSampleItemViewDelegate <NSObject>

- (void)tappedItemWithValue:(float)value;

@end


@interface SCSampleItemView : UIView

@property (readwrite, assign) NSString *text;
@property (readwrite, weak) id<SCSampleItemViewDelegate> delegate;

- (instancetype)initWithText:(NSString *)text delegate:(id<SCSampleItemViewDelegate>)delegate;

@end
