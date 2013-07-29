//
//  ChallengeAnswerViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/07/23.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "ChallengeAnswerViewController.h"

@interface ChallengeAnswerViewController ()

@end

@implementation ChallengeAnswerViewController
@synthesize sum;
@synthesize digit;
@synthesize problem;
@synthesize speed;
@synthesize stg_cnt;
@synthesize delegate;
@synthesize finish_flg;
@synthesize right_cnt;
@synthesize wrong_cnt;
@synthesize point;
@synthesize combo;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    input_lbl.text = @"";
    len = 0;
    // Barの戻る禁止
    [self.navigationItem setHidesBackButton:YES];
    
    //NSLog(@"modal::digit:%d, problem:%d, speed:%d, stg_cnt:%d", digit, problem, speed, stg_cnt);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDidPush:(id)sender {
    
    b = (UIButton *)sender;
    
    if( startInput ){
        // 最初の1桁目が0なら表示しない
        if( b.tag == 0 ) return;
        // 新しく表示する文字列を作成
        input_lbl.text = [NSString stringWithFormat:@"%d", b.tag];
        startInput =  NO;
    } else {
        // すでに表示されている文字列に連結
        input_lbl.text = [NSString stringWithFormat:@"%@%d", input_lbl.text, b.tag];
        input_value = [NSString stringWithFormat:@"%@%d", input_lbl.text, b.tag];
        // 0が連続で押されたら表示しない
        if([input_lbl.text isEqualToString:@"00"]){
            input_lbl.text = @"0";
        }
        // 桁あふれでエラー表示
        len = [input_value length];
        if(len >= 10){
            input_lbl.text = @"0";
            startInput = YES;
        }
    }
}

- (IBAction)btnDidClear:(id)sender {
    input_lbl.text = @"0";
    startInput = YES;
}

- (IBAction)btnDidEnter:(id)sender {
    
    [self startAnimation];
    
    answer_value = [NSString stringWithFormat:@"%d", sum];
    if([input_lbl.text isEqualToString:answer_value]){
        [delegate nextProblem:1];
    }else{
        [delegate nextProblem:2];
    }
}

- (void)startAnimation{
    [UIView beginAnimations:nil context:nil];
    // delegateを自分自身に設定
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    [UIView setAnimationDuration:0.1];
    btn1.alpha=0.0;
    btn2.alpha=0.0;
    btn3.alpha=0.0;
    btn4.alpha=0.0;
    btn5.alpha=0.0;
    btn6.alpha=0.0;
    btn7.alpha=0.0;
    btn8.alpha=0.0;
    btn9.alpha=0.0;
    btn0.alpha=0.0;
    btn_clear.alpha=0.0;
    btn_enter.alpha=0.0;
    input_lbl.alpha=0.0;
    [UIView commitAnimations];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished{
    if([finished boolValue]){
        // アニメーションがキャンセルされずに、完了したら
    }
}





@end
