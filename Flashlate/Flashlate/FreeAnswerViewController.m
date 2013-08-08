//
//  FreeAnswerViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/07/20.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "FreeAnswerViewController.h"

@interface FreeAnswerViewController ()

@end

@implementation FreeAnswerViewController
@synthesize sum;
@synthesize digit;
@synthesize problem;
@synthesize speed;

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
    
    // iPhone5対応
    if([[UIScreen mainScreen]bounds].size.height==568){
        right_lbl = [[UILabel alloc] initWithFrame:CGRectMake(20,200,280,30)];
        right_lbl.font = [UIFont fontWithName:@"Helvetica" size:30];
        right_lbl.textColor = [UIColor blackColor];
        right_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:right_lbl];
        
        rightAns_lbl = [[UILabel alloc] initWithFrame:CGRectMake(20,250,280,40)];
        rightAns_lbl.font = [UIFont fontWithName:@"Helvetica" size:40];
        rightAns_lbl.textColor = [UIColor blackColor];
        rightAns_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:rightAns_lbl];
        
        // uibutton
        again_btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
        again_btn.frame = CGRectMake(20, 358, 280, 44);
        again_btn.faceColor = RGB(52, 152, 219);
        again_btn.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
        again_btn.radius = 8.0;
        again_btn.margin = 4.0;
        again_btn.depth = 8.0;
        [again_btn setTitle:@"再挑戦" forState:UIControlStateNormal];
        [again_btn addTarget:self action:@selector(btnAgain:)forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:again_btn];
        
        /*
        level_btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
        level_btn.frame = CGRectMake(20, 358, 280, 44);
        level_btn.faceColor = RGB(52, 152, 219);
        level_btn.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
        level_btn.radius = 8.0;
        level_btn.margin = 4.0;
        level_btn.depth = 8.0;
        [level_btn setTitle:@"レベル選択" forState:UIControlStateNormal];
        [level_btn addTarget:self action:@selector(btnLevel:)forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:level_btn];
        */
        
        top_btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
        top_btn.frame = CGRectMake(20, 400, 280, 44);
        top_btn.faceColor = RGB(52, 152, 219);
        top_btn.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
        top_btn.radius = 8.0;
        top_btn.margin = 4.0;
        top_btn.depth = 8.0;
        [top_btn setTitle:@"TOPへ戻る" forState:UIControlStateNormal];
        [top_btn addTarget:self action:@selector(btnTop:)forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:top_btn];
        
    }else{
        right_lbl = [[UILabel alloc] initWithFrame:CGRectMake(20,120,280,30)];
        right_lbl.font = [UIFont fontWithName:@"Helvetica" size:30];
        right_lbl.textColor = [UIColor blackColor];
        right_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:right_lbl];
        
        rightAns_lbl = [[UILabel alloc] initWithFrame:CGRectMake(20,160,280,40)];
        rightAns_lbl.font = [UIFont fontWithName:@"Helvetica" size:40];
        rightAns_lbl.textColor = [UIColor blackColor];
        rightAns_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:rightAns_lbl];
        
        again_btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
        again_btn.frame = CGRectMake(20, 272, 280, 44);
        [again_btn setTitle:@"再挑戦" forState:UIControlStateNormal];
        [again_btn addTarget:self action:@selector(btnAgain:)forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:again_btn];
        
        /*
        level_btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
        level_btn.frame = CGRectMake(20, 272, 280, 44);
        [level_btn setTitle:@"レベル選択" forState:UIControlStateNormal];
        [level_btn addTarget:self action:@selector(btnLevel:)forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:level_btn];
        */
         
        top_btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
        top_btn.frame = CGRectMake(20, 314, 280, 44);
        [top_btn setTitle:@"TOPへ戻る" forState:UIControlStateNormal];
        [top_btn addTarget:self action:@selector(btnTop:)forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:top_btn];
    }
    
    right_lbl.hidden=YES;
    rightAns_lbl.hidden=YES;
    again_btn.hidden=YES;
    level_btn.hidden=YES;
    top_btn.hidden=YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)btnDidPush:(id)sender
{
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
    right_lbl.hidden=NO;
    rightAns_lbl.hidden=NO;
    again_btn.hidden=NO;
    level_btn.hidden=NO;
    top_btn.hidden=NO;
    answer_value = [NSString stringWithFormat:@"%d", sum];
    if([input_lbl.text isEqualToString:answer_value]){
        right_lbl.text = @"正解です。";
    }else{
        right_lbl.text = @"不正解です。";
        rightAns_lbl.text = [NSString stringWithFormat:@"%d", sum];
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
    [UIView commitAnimations];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished{
    if([finished boolValue]){
        // アニメーションがキャンセルされずに、完了したら
    }
}

- (void)btnAgain:(id)sender {
    // delegate
    FreeCalculationViewController *FCalculationViewController = [self.navigationController.viewControllers objectAtIndex:1];
    FCalculationViewController.digit = digit;
    FCalculationViewController.problem = problem;
    FCalculationViewController.speed = speed;
    [FCalculationViewController startDidPush];
    [self.navigationController popToViewController:FCalculationViewController animated:YES];
}

- (void)btnLevel:(id)sender {
    FreeSettingViewController *FSettingViewController = [self.navigationController.viewControllers objectAtIndex:0];
    [self.navigationController popToViewController:FSettingViewController animated:YES];
}


- (void)btnTop:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (IBAction)swipeHandleGesture:(id)sender {
    
    FreeCalculationViewController *FCalculationViewController = [self.navigationController.viewControllers objectAtIndex:1];
    FCalculationViewController.digit = digit;
    FCalculationViewController.problem = problem;
    FCalculationViewController.speed = speed;
    [FCalculationViewController startDidPush];
    [self.navigationController popToViewController:FCalculationViewController animated:YES];
    
}


@end
