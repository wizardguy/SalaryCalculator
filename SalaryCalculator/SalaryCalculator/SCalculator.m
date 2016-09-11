//
//  SCalculator.m
//  SalaryCalculator
//
//  Created by Dennis on 8/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "SCalculator.h"

@interface SCalculator ()

@end


const NSString * const kSCKeyTax = @"tax";
const NSString * const kSCKeyPersonalPayment = @"personalPayment";
const NSString * const kSCKeyAfterTax = @"afterTax";


@implementation SCalculator

static SCalculator *g_calculator = nil;


+ (instancetype)sharedInstance
{
    if (!g_calculator) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            g_calculator = [[self alloc] init];
        });
    }
    return g_calculator;
}


- (instancetype) init
{
    self = [super init];
    if (self) {
        _taxthreshold = 3500;
        
        _minSocialInsurance = 2181;
        _maxSocialInsurance = 10905;
        _minAccumulationFund = 0;
        _maxAccumulationFund = 10905;
        
        _endowmentRate = 0.08;
        _medicalRate = 0.02;
        _joblessRate = 0.01;
        _accumulationFundRate = 0.08;
    }
    return self;
}



- (NSDictionary *)afterTaxIncomeWithIncome:(float)income
{
    float tax = 0.0, personalPaymentBase = 0.0;
    
    personalPaymentBase = income > _maxSocialInsurance ? _maxSocialInsurance : income;
    personalPaymentBase = income < _minSocialInsurance ? _minSocialInsurance : personalPaymentBase;
    float personalPayment = personalPaymentBase * [self personalPaymentRate];
    
    float taxableIncome = income - personalPayment - self.taxthreshold;
    
    if (taxableIncome <= 1500) {
        tax = taxableIncome * 0.03;
    }
    else if (taxableIncome > 1500 && taxableIncome <= 4500) {
        tax = taxableIncome * 0.1 - 105;
    }
    else if (taxableIncome > 4500 && taxableIncome <= 9000) {
        tax = taxableIncome * 0.2 - 555;
    }
    else if (taxableIncome > 9000 && taxableIncome <= 35000) {
        tax = taxableIncome * 0.25 - 1005;
    }
    else if (taxableIncome > 35000 && taxableIncome <= 55000) {
        tax = taxableIncome * 0.3 - 2755;
    }
    else if (taxableIncome > 55000 && taxableIncome <= 80000) {
        tax = taxableIncome * 0.35 - 5505;
    }
    else{
        tax = taxableIncome * 0.45 - 13505;
    }
    
    float afterTax = income - personalPayment - tax;
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:[NSNumber numberWithFloat:tax] forKey:kSCKeyTax];
    [dic setObject:[NSNumber numberWithFloat:personalPayment] forKey:kSCKeyPersonalPayment];
    [dic setObject:[NSNumber numberWithFloat:afterTax] forKey:kSCKeyAfterTax];
    
    return dic;
}



- (float)personalPaymentRate
{
    return (self.endowmentRate + self.medicalRate + self.joblessRate + self.accumulationFundRate);
}


@end
