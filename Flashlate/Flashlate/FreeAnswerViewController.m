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
    
    // 角丸
    [[input_lbl layer] setCornerRadius:15.0];
    [input_lbl setClipsToBounds:YES];
    
    // btnカスタマイズ
    btn0.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn0.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn0.radius = 15.0;
    btn0.margin = 4.0;
    btn0.depth = 10.0;
    
    btn1.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn1.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn1.radius = 15.0;
    btn1.margin = 4.0;
    btn1.depth = 10.0;
    
    btn2.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn2.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn2.radius = 15.0;
    btn2.margin = 4.0;
    btn2.depth = 10.0;
    
    btn3.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn3.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn3.radius = 15.0;
    btn3.margin = 4.0;
    btn3.depth = 10.0;
    
    btn4.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn4.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn4.radius = 15.0;
    btn4.margin = 4.0;
    btn4.depth = 10.0;
    
    btn5.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn5.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn5.radius = 15.0;
    btn5.margin = 4.0;
    btn5.depth = 10.0;
    
    btn6.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn6.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn6.radius = 15.0;
    btn6.margin = 4.0;
    btn6.depth = 10.0;
    
    btn7.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn7.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn7.radius = 15.0;
    btn7.margin = 4.0;
    btn7.depth = 10.0;
    
    btn8.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn8.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn8.radius = 15.0;
    btn8.margin = 4.0;
    btn8.depth = 10.0;
    
    btn9.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    btn9.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    btn9.radius = 15.0;
    btn9.margin = 4.0;
    btn9.depth = 10.0;
    
    btn_clear.faceColor = RGB(231, 76, 60);
    btn_clear.sideColor = RGB(192, 57, 43);
    btn_clear.radius = 15.0;
    btn_clear.margin = 4.0;
    btn_clear.depth = 10.0;
    
    btn_enter.faceColor = RGB(231, 76, 60);
    btn_enter.sideColor = RGB(192, 57, 43);
    btn_enter.radius = 15.0;
    btn_enter.margin = 4.0;
    btn_enter.depth = 10.0;
    
    // iPhone5対応
    if([[UIScreen mainScreen]bounds].size.height==568){
        
        correct_lbl = [[UILabel alloc] initWithFrame:CGRectMake(20,100,280,40)];
        correct_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:40];
        correct_lbl.textColor = RGB(231, 76, 60);
        correct_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:correct_lbl];
        
        incorrect_lbl = [[UILabel alloc] initWithFrame:CGRectMake(20,100,280,40)];
        incorrect_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:40];
        incorrect_lbl.textColor = RGB(231, 76, 60);
        incorrect_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:incorrect_lbl];
        
        rightAns_lbl = [[UILabel alloc] initWithFrame:CGRectMake(20,220,280,30)];
        rightAns_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:90];
        rightAns_lbl.textColor = [UIColor blackColor];
        rightAns_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:rightAns_lbl];
        
        // uibutton
        again_btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
        again_btn.frame = CGRectMake(20, 340, 280, 50);
        again_btn.faceColor = RGB(52, 152, 219);
        again_btn.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
        again_btn.radius = 15.0;
        again_btn.margin = 4.0;
        again_btn.depth = 10.0;
        [again_btn.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
        [again_btn setTitle:@"Again" forState:UIControlStateNormal];
        [again_btn addTarget:self action:@selector(btnAgain:)forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:again_btn];
        
        top_btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
        top_btn.frame = CGRectMake(20, 388, 280, 50);
        top_btn.faceColor = RGB(52, 152, 219);
        top_btn.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
        top_btn.radius = 15.0;
        top_btn.margin = 4.0;
        top_btn.depth = 10.0;
        [top_btn.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
        [top_btn setTitle:@"Top" forState:UIControlStateNormal];
        [top_btn addTarget:self action:@selector(btnTop:)forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:top_btn];
        
    }else{
        
        judgeRight_lbl = [[UILabel alloc] initWithFrame:CGRectMake(0,0,90,65)];
        judgeRight_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:125];
        judgeRight_lbl.textColor = RGB(231, 76, 60);
        judgeRight_lbl.backgroundColor = [UIColor clearColor];
        judgeRight_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:judgeRight_lbl];
        
        judgeWrong_lbl = [[UILabel alloc] initWithFrame:CGRectMake(0,12,80,67)];
        judgeWrong_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:125];
        judgeWrong_lbl.textColor = RGB(231, 76, 60);
        judgeWrong_lbl.backgroundColor = [UIColor clearColor];
        judgeWrong_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:judgeWrong_lbl];
        
        correct_lbl = [[UILabel alloc] initWithFrame:CGRectMake(20,130,280,60)];
        correct_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:60];
        correct_lbl.textColor = RGB(231, 76, 60);
        correct_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:correct_lbl];
        
        incorrect_lbl = [[UILabel alloc] initWithFrame:CGRectMake(20,90,280,40)];
        incorrect_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:40];
        incorrect_lbl.textColor = RGB(231, 76, 60);
        incorrect_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:incorrect_lbl];
        
        rightAns_lbl = [[UILabel alloc] initWithFrame:CGRectMake(20,160,280,80)];
        rightAns_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:100];
        rightAns_lbl.textColor = [UIColor blackColor];
        rightAns_lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:rightAns_lbl];
        
        again_btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
        again_btn.frame = CGRectMake(20, 252, 280, 50);
        again_btn.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
        again_btn.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
        again_btn.radius = 15.0;
        again_btn.margin = 4.0;
        again_btn.depth = 10.0;
        [again_btn.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
        [again_btn setTitle:@"Again" forState:UIControlStateNormal];
        [again_btn addTarget:self action:@selector(btnAgain:)forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:again_btn];
        
        top_btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
        top_btn.frame = CGRectMake(20, 300, 280, 50);
        top_btn.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
        top_btn.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
        top_btn.radius = 15.0;
        top_btn.margin = 4.0;
        top_btn.depth = 10.0;
        [top_btn.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
        [top_btn setTitle:@"Top" forState:UIControlStateNormal];
        [top_btn addTarget:self action:@selector(btnTop:)forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:top_btn];
    }
    
    judgeRight_lbl.hidden=YES;
    judgeWrong_lbl.hidden=YES;
    correct_lbl.hidden=YES;
    incorrect_lbl.hidden=YES;
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
        if(len >= 7){
            input_lbl.text = @"0";
            startInput = YES;
        }
    }
    [self addBtnMusic];
}

- (IBAction)btnDidClear:(id)sender {
    
    input_lbl.text = @"0";
    startInput = YES;
    [self addBtnMusic];
}
- (IBAction)btnDidEnter:(id)sender {
    
    [self startAnimation];
    again_btn.hidden=NO;
    level_btn.hidden=NO;
    top_btn.hidden=NO;
    answer_value = [NSString stringWithFormat:@"%d", sum];
    if([input_lbl.text isEqualToString:answer_value]){
        correct_lbl.hidden=NO;
        correct_lbl.text = @"Correct!!";
        judgeRight_lbl.hidden=NO;
        judgeRight_lbl.text = @"○";
    }else{
        incorrect_lbl.hidden=NO;
        incorrect_lbl.text = @"Incorrect!!";
        judgeWrong_lbl.text = @"×";
        judgeWrong_lbl.hidden=NO;
        rightAns_lbl.hidden=NO;
        rightAns_lbl.text = [NSString stringWithFormat:@"%d", sum];
    }
    [self addBtnMusic];
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
    [self addBtnMusic];
}

- (void)btnLevel:(id)sender {
    FreeSettingViewController *FSettingViewController = [self.navigationController.viewControllers objectAtIndex:0];
    [self.navigationController popToViewController:FSettingViewController animated:YES];
    [self addBtnMusic];
}

- (void)btnTop:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
    [self addBtnMusic];
}

- (IBAction)swipeHandleGesture:(id)sender {
    
    FreeCalculationViewController *FCalculationViewController = [self.navigationController.viewControllers objectAtIndex:1];
    FCalculationViewController.digit = digit;
    FCalculationViewController.problem = problem;
    FCalculationViewController.speed = speed;
    [FCalculationViewController startDidPush];
    [self.navigationController popToViewController:FCalculationViewController animated:YES];
    
}

- (void)addBtnMusic {
    NSString *bgmPath = [[NSBundle mainBundle]
                         pathForResource:@"btnTap" ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    bgm = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [bgm setNumberOfLoops:0]; // 0なら1回だけ。－1ならエンドレスリピート。
    [bgm play];
}



@end
