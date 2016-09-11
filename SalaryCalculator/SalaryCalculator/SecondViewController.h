//
//  SecondViewController.h
//  SalaryCalculator
//
//  Created by Dennis on 8/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtThreshold;
@property (weak, nonatomic) IBOutlet UITextField *txtMinInsurance;
@property (weak, nonatomic) IBOutlet UITextField *txtMaxInsurance;
@property (weak, nonatomic) IBOutlet UITextField *txtMinFund;
@property (weak, nonatomic) IBOutlet UITextField *txtMaxFund;
@property (weak, nonatomic) IBOutlet UITextField *txtEndowmentRate;
@property (weak, nonatomic) IBOutlet UITextField *txtMedicalRate;
@property (weak, nonatomic) IBOutlet UITextField *txtFundRate;
@property (weak, nonatomic) IBOutlet UITextField *txtJoblessRate;
@property (weak, nonatomic) IBOutlet UITextField *txtIncome;
@property (weak, nonatomic) IBOutlet UILabel *txtAfterTaxIncome;
@property (weak, nonatomic) IBOutlet UIButton *btnCalculate;

@end

