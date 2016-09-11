//
//  SCalculator.h
//  SalaryCalculator
//
//  Created by Dennis on 8/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSString * const kSCKeyTax;
extern const NSString * const kSCKeyPersonalPayment;
extern const NSString * const kSCKeyAfterTax;


@interface SCalculator : NSObject


@property (readwrite, assign) float taxthreshold;

@property (readwrite, assign) float minSocialInsurance;
@property (readwrite, assign) float maxSocialInsurance;
@property (readwrite, assign) float minAccumulationFund;
@property (readwrite, assign) float maxAccumulationFund;

@property (readwrite, assign) float endowmentRate;
@property (readwrite, assign) float medicalRate;
@property (readwrite, assign) float joblessRate;
@property (readwrite, assign) float accumulationFundRate;


/*
 * Only for Nanjing. Others must use alloc-init.
 */
+ (instancetype)sharedInstance;

/*
 * { "tax": 0.0, "personalPayment": 0.0, "afterTax": 0.0 }
 */
- (NSDictionary *)afterTaxIncomeWithIncome:(float)income;


@end
