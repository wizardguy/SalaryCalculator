//
//  SCSampleItemView.m
//  SalaryCalculator
//
//  Created by Dennis on 8/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "SCSampleItemView.h"

@interface SCSampleItemView ()

@property (strong, readwrite) UILabel *label;

@end



@implementation SCSampleItemView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithText:(NSString *)text delegate:(id<SCSampleItemViewDelegate>)delegate
{
    self = [super init];
    if (self) {
        _delegate = delegate;
        _text = text;
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kDefaultItemWidth, kDefaultItemHeight)];
        _label.text = text;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor grayColor];
        _label.font = [UIFont systemFontOfSize:13.0 weight:1.0];
        
        [self addSubview:_label];
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self                 action:@selector(singleTapAction)];
        [self addGestureRecognizer:singleTap];
        [self setUserInteractionEnabled:YES];
    }
    return self;
}



- (void)singleTapAction
{
    [self tappedAnimation];
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(SCSampleItemViewDelegate)]) {
        [self.delegate tappedItemWithValue:[self.text floatValue]];
    }
}



- (void)tappedAnimation
{
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = [UIColor orangeColor];
        self.label.textColor = [UIColor whiteColor];
    } completion:^(BOOL finished) {
        self.backgroundColor = [UIColor whiteColor];
        self.label.textColor = [UIColor grayColor];
    }];
}

@end
