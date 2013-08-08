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
#import "QBFlatButton.h"
#import "Global.h"

@interface FreeAnswerViewController : UIViewController
{
    
    IBOutlet UILabel *input_lbl;
    
    UIButton *b;
    BOOL startInput;
    NSString *input_value;
    NSString *answer_value;
    
    int len;
    
    IBOutlet QBFlatButton *btn1;
    IBOutlet QBFlatButton *btn2;
    IBOutlet QBFlatButton *btn3;
    IBOutlet QBFlatButton *btn4;
    IBOutlet QBFlatButton *btn5;
    IBOutlet QBFlatButton *btn6;
    IBOutlet QBFlatButton *btn7;
    IBOutlet QBFlatButton *btn8;
    IBOutlet QBFlatButton *btn9;
    IBOutlet QBFlatButton *btn0;
    IBOutlet QBFlatButton *btn_clear;
    IBOutlet QBFlatButton *btn_enter;
    
    UILabel *right_lbl;
    UILabel *rightAns_lbl;
    
    QBFlatButton *again_btn;
    QBFlatButton *level_btn;
    QBFlatButton *top_btn;
    
}

@property(nonatomic)NSInteger sum;
@property(nonatomic)NSInteger digit;
@property(nonatomic)NSInteger problem;
@property(nonatomic)NSInteger speed;

@end
