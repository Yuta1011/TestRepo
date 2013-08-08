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
    
    // btnカスタマイズ
    btn0.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn0.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn0.radius = 8.0;
    btn0.margin = 4.0;
    btn0.depth = 8.0;
    
    btn1.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn1.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn1.radius = 8.0;
    btn1.margin = 4.0;
    btn1.depth = 8.0;
    
    btn2.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn2.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn2.radius = 8.0;
    btn2.margin = 4.0;
    btn2.depth = 8.0;
    
    btn3.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn3.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn3.radius = 8.0;
    btn3.margin = 4.0;
    btn3.depth = 8.0;
    
    btn4.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn4.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn4.radius = 8.0;
    btn4.margin = 4.0;
    btn4.depth = 8.0;
    
    btn5.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn5.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn5.radius = 8.0;
    btn5.margin = 4.0;
    btn5.depth = 8.0;
    
    btn6.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn6.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn6.radius = 8.0;
    btn6.margin = 4.0;
    btn6.depth = 8.0;
    
    btn7.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn7.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn7.radius = 8.0;
    btn7.margin = 4.0;
    btn7.depth = 8.0;
    
    btn8.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn8.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn8.radius = 8.0;
    btn8.margin = 4.0;
    btn8.depth = 8.0;
    
    btn9.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn9.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn9.radius = 8.0;
    btn9.margin = 4.0;
    btn9.depth = 8.0;
    
    btn_clear.faceColor = RGB(231, 76, 60);
    btn_clear.sideColor = RGB(192, 57, 43);
    btn_clear.radius = 8.0;
    btn_clear.margin = 4.0;
    btn_clear.depth = 8.0;
    
    btn_enter.faceColor = RGB(231, 76, 60);
    btn_enter.sideColor = RGB(192, 57, 43);
    btn_enter.radius = 8.0;
    btn_enter.margin = 4.0;
    btn_enter.depth = 8.0;
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
