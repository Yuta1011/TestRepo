//
//  FreeAnswerViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/07/20.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreeSettingViewController.h"
#import "FreeCalculationViewController.h"

@interface FreeAnswerViewController : UIViewController
{
    
    IBOutlet UILabel *input_lbl;
    
    UIButton *b;
    BOOL startInput;
    NSString *input_value;
    NSString *answer_value;
    
    int len;
    
    IBOutlet UIButton *btn1;
    IBOutlet UIButton *btn2;
    IBOutlet UIButton *btn3;
    IBOutlet UIButton *btn4;
    IBOutlet UIButton *btn5;
    IBOutlet UIButton *btn6;
    IBOutlet UIButton *btn7;
    IBOutlet UIButton *btn8;
    IBOutlet UIButton *btn9;
    IBOutlet UIButton *btn0;
    IBOutlet UIButton *btn_clear;
    IBOutlet UIButton *btn_enter;
    
    UILabel *right_lbl;
    UILabel *rightAns_lbl;
    
    UIButton *again_btn;
    UIButton *level_btn;
    UIButton *top_btn;
    
}

@property(nonatomic)NSInteger sum;
@property(nonatomic)NSInteger digit;
@property(nonatomic)NSInteger problem;
@property(nonatomic)NSInteger speed;

@end
