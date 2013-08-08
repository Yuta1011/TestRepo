//
//  ChallengeAnswerViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/07/23.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ChallengeCalculationViewController.h"
#import "QBFlatButton.h"
#import "Global.h"

@protocol ChallengeAnswerViewDelegate
- (void)nextProblem:(int)result;

@end

@interface ChallengeAnswerViewController : UIViewController
{
    
    id<ChallengeAnswerViewDelegate> delegate;
    
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
    UILabel *wrong_lbl;
    UILabel *point_lbl;
    
    UIButton *next_btn;
    UIButton *again_btn;
    UIButton *level_btn;
    UIButton *top_btn;
    
}

@property(nonatomic)NSInteger sum;
@property(nonatomic)NSInteger digit;
@property(nonatomic)NSInteger problem;
@property(nonatomic)NSInteger speed;
@property(nonatomic)NSInteger stg_cnt;
@property(nonatomic)NSInteger finish_flg;
@property(nonatomic)int right_cnt; // 1...正解 2...不正解
@property(nonatomic)NSInteger wrong_cnt;
@property(nonatomic)NSInteger point;
@property(nonatomic)NSInteger combo;




@property (nonatomic, strong) id<ChallengeAnswerViewDelegate> delegate;


- (IBAction)btnDidPush:(id)sender;
- (IBAction)btnDidClear:(id)sender;
- (IBAction)btnDidEnter:(id)sender;

@end
