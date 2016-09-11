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

+ (instancetype)sharedInstance;

/*
 * { "tax": 0.0, "personalPayment": 0.0, "afterTax": 0.0 }
 */
- (NSDictionary *)afterTaxIncomeWithIncome:(float)income;


@end
