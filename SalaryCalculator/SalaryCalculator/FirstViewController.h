//
//  FirstViewController.h
//  SalaryCalculator
//
//  Created by Dennis on 8/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtMin;

@property (weak, nonatomic) IBOutlet UITextField *txtMax;

@property (weak, nonatomic) IBOutlet UITextField *txtInterval;

@property (weak, nonatomic) IBOutlet UITextField *txtIncome;

@property (weak, nonatomic) IBOutlet UIButton *btnRefresh;

@property (weak, nonatomic) IBOutlet UIButton *btnCalculate;

@property (weak, nonatomic) IBOutlet UILabel *txtAfterTaxIncome;

@property (weak, nonatomic) IBOutlet UILabel *txtTax;

@property (weak, nonatomic) IBOutlet UILabel *txtPersonalPayment;

@property (weak, nonatomic) IBOutlet UILabel *txtFastCaculationTitle;

@end

