//
//  FirstViewController.m
//  SalaryCalculator
//
//  Created by Dennis on 8/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "FirstViewController.h"
#import "DimensDefine.h"
#import "SCSampleItemView.h"
#import "BFAlertManager.h"
#import "SCalculator.h"
#import <Masonry.h>


const NSString * const defaultMaxIncome = @"100000";
const NSString * const defaultMinIncome = @"10000";
const NSString * const defaultInterval = @"2000";

@interface FirstViewController ()

@property (strong, readwrite) NSMutableArray<SCSampleItemView *> *items;

@property (assign, readwrite) float interval;
@property (assign, readwrite) float min;
@property (assign, readwrite) float max;
@property (assign, readwrite) float income;

@property (assign, readwrite) float tax;
@property (assign, readwrite) float personalPayment;

@end


@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.items = [NSMutableArray new];
    
    self.txtMax.text = [defaultMaxIncome copy];
    self.txtMin.text = [defaultMinIncome copy];
    self.txtInterval.text = [defaultInterval copy];
    
    self.txtAfterTaxIncome.text = @"0.0";
    self.txtTax.text = @"0.0";
    self.txtPersonalPayment.text = @"0.0";
    
    [self prepareData];
    [self updateUI];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)prepareData
{
    self.min = [self.txtMin.text floatValue];
    self.max = [self.txtMax.text floatValue];
    self.interval = [self.txtInterval.text floatValue];
    self.income = [self.txtIncome.text floatValue];
}



- (void)updateUI
{
    for (UIView *view in self.items) {
        [view removeFromSuperview];
    }
    [self.items removeAllObjects];
    
    int maxItemNumbersPerLine = ((int)kScreenWidth - 8) / ((int)kDefaultItemWidth + 8);
    int totalItemNumbers = (self.max - self.min) / self.interval;
    
    // create the view
    for (int i = 0; i < totalItemNumbers; i++) {
        SCSampleItemView *newItemView = [self createNewSalaryItemWithIncome:(int)(self.min + i*self.interval)];
        [self.view addSubview:newItemView];
        [self.items addObject:newItemView];
    }
    
    // calculate each view's frame
    
    // the 1st one
    [self.items[0] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.txtFastCaculationTitle).offset(30);
        make.left.equalTo(self.view).offset(8);
        make.width.mas_equalTo(kDefaultItemWidth);
        make.height.mas_equalTo(kDefaultItemHeight);
    }];
    
    UIView *lastView = self.items[0];
    for ( int i = 1; i < totalItemNumbers; i++) {
        // the 1st one in a new line
        if (i % maxItemNumbersPerLine == 0) {
            [self.items[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lastView).offset(kDefaultItemHeight + 8);
                make.left.equalTo(self.view).offset(8);
                make.width.mas_equalTo(kDefaultItemWidth);
                make.height.mas_equalTo(kDefaultItemHeight);
            }];
        }
        // others in the same line
        else {
            [self.items[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lastView);
                make.left.equalTo(lastView).offset(kDefaultItemWidth + 8);
                make.width.mas_equalTo(kDefaultItemWidth);
                make.height.mas_equalTo(kDefaultItemHeight);
            }];
        }
        lastView = self.items[i];
    }
}


- (SCSampleItemView *)createNewSalaryItemWithIncome:(int)income
{
    NSString *text = [NSString stringWithFormat:@"%d", income];
    SCSampleItemView *item = [[SCSampleItemView alloc] initWithText:text];
    return item;
}


- (BOOL)validate
{
    [self prepareData];
    
    if (self.max > 0 && self.min >= 0 && self.interval > 0
        && self.max > self.min && self.interval <= self.max) {
        return YES;
    }
    else {
        return NO;
    }
}


- (BOOL)validateIncome
{
    [self prepareData];
    return self.income > 0 ? YES : NO;
}


- (void)showAlet
{
    [[BFAlertManager sharedInstance] showAlertWithTitle:@"Error!" message:@"Invalid Input! Please check the input value again." button1Title:nil button2Title:kOK preferredStyle:BFAlertStyleDefault tag:1 delegate:nil handler1:nil handler2:nil fromViewController:self];
}


- (IBAction)btnRefreshClicked:(id)sender {
    if ([self validate]) {
        [self updateUI];
    }
    else {
        [self showAlet];
    }
}


- (IBAction)btnCalculateClicked:(id)sender {
    if ([self validateIncome]) {
        NSDictionary *dicResult = [[SCalculator sharedInstance] afterTaxIncomeWithIncome:self.income];
        self.txtAfterTaxIncome.text = [NSString stringWithFormat:@"%@", [dicResult objectForKey:kSCKeyAfterTax]];
        self.txtTax.text = [NSString stringWithFormat:@"%@", [dicResult objectForKey:kSCKeyTax]];
        self.txtPersonalPayment.text = [NSString stringWithFormat:@"%@", [dicResult objectForKey:kSCKeyPersonalPayment]];
    }
    else {
        [self showAlet];
    }
}

@end
