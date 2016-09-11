//
//  SecondViewController.m
//  SalaryCalculator
//
//  Created by Dennis on 8/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "SecondViewController.h"
#import "SCalculator.h"
#import "BFAlertManager.h"

@interface SecondViewController ()

@property (readwrite, strong) SCalculator *calculator;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.calculator = [SCalculator new];
    
    self.txtThreshold.text = [NSString stringWithFormat:@"%.2lf", self.calculator.taxthreshold];
    self.txtMinInsurance.text = [NSString stringWithFormat:@"%.2lf", self.calculator.minSocialInsurance];
    self.txtMaxInsurance.text = [NSString stringWithFormat:@"%.2lf", self.calculator.maxSocialInsurance];
    self.txtMinFund.text = [NSString stringWithFormat:@"%.2lf", self.calculator.minAccumulationFund];
    self.txtMaxFund.text = [NSString stringWithFormat:@"%.2lf", self.calculator.maxAccumulationFund];
    self.txtEndowmentRate.text = [NSString stringWithFormat:@"%.2lf", self.calculator.endowmentRate];
    self.txtJoblessRate.text = [NSString stringWithFormat:@"%.2lf", self.calculator.joblessRate];
    self.txtMedicalRate.text = [NSString stringWithFormat:@"%.2lf", self.calculator.medicalRate];
    self.txtFundRate.text = [NSString stringWithFormat:@"%.2lf", self.calculator.accumulationFundRate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnClicked:(id)sender {
    if ([self checkEmptyWithTextField:self.txtThreshold]) {
        self.calculator.taxthreshold = [self.txtThreshold.text floatValue];
    }
    
    if ([self checkEmptyWithTextField:self.txtMinInsurance]) {
        self.calculator.minSocialInsurance = [self.txtMinInsurance.text floatValue];
    }
    
    if ([self checkEmptyWithTextField:self.txtMaxInsurance]) {
        self.calculator.maxSocialInsurance = [self.txtMaxInsurance.text floatValue];
    }
    
    if ([self checkEmptyWithTextField:self.txtMinFund]) {
        self.calculator.minAccumulationFund = [self.txtMinFund.text floatValue];
    }
    
    if ([self checkEmptyWithTextField:self.txtMaxFund]) {
        self.calculator.maxAccumulationFund = [self.txtMaxFund.text floatValue];
    }
    
    if ([self checkEmptyWithTextField:self.txtEndowmentRate]) {
        self.calculator.endowmentRate = [self.txtEndowmentRate.text floatValue];
    }
    
    if ([self checkEmptyWithTextField:self.txtFundRate]) {
        self.calculator.accumulationFundRate = [self.txtFundRate.text floatValue];
    }
    
    if ([self checkEmptyWithTextField:self.txtJoblessRate]) {
        self.calculator.joblessRate = [self.txtJoblessRate.text floatValue];
    }
    
    if ([self checkEmptyWithTextField:self.txtMedicalRate]) {
        self.calculator.medicalRate = [self.txtMedicalRate.text floatValue];
    }
    
    float value = [self.txtIncome.text floatValue];
    
    if (value) {
        NSDictionary *result = [self.calculator afterTaxIncomeWithIncome:value];
        self.txtAfterTaxIncome.text = [NSString stringWithFormat:@"%@", [result objectForKey:kSCKeyAfterTax]];
    }
    else {
        [self showAlet];
    }
    
}

- (void)showAlet
{
    [[BFAlertManager sharedInstance] showAlertWithTitle:@"Error!" message:@"Invalid Input! Please check the input value again." button1Title:nil button2Title:kOK preferredStyle:BFAlertStyleDefault tag:1 delegate:nil handler1:nil handler2:nil fromViewController:self];
}



- (BOOL)checkEmptyWithTextField:(UITextField *)txtField
{
    return [txtField.text length] ? YES : NO;
}


@end
