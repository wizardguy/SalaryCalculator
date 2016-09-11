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


- (instancetype)initWithText:(NSString *)text
{
    self = [super init];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kDefaultItemWidth, kDefaultItemHeight)];
        _label.text = text;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor grayColor];
        _label.font = [UIFont systemFontOfSize:13.0 weight:1.0];
        
        [self addSubview:_label];
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return self;
}


@end
