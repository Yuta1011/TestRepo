//
//  FreeCalculationViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/07/20.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "FreeCalculationViewController.h"

@interface FreeCalculationViewController ()

@end

@implementation FreeCalculationViewController
@synthesize num_lbl;
@synthesize digit;
@synthesize problem;
@synthesize speed;
@synthesize count;
@synthesize num;
@synthesize sum;
@synthesize timeflg;
@synthesize chk_num;
@synthesize startInput;


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
	timeflg=FALSE;
    [self startDidPush];
    
    startInput = YES;
    
    // navigationBar戻る禁止
    [self.navigationItem setHidesBackButton:YES];
    
    
    NSLog(@"speed:%d, digit:%d, problem:%d", speed, digit, problem);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startDidPush{
    num_lbl.text = @"";
    [self performSelector:@selector(DidStart) withObject:nil afterDelay:1.0];
}

-(void)DidStart{
    count = 0;
    sum = 0;
    
    if(speed == 20){
        timer = [NSTimer scheduledTimerWithTimeInterval:(2.0)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }else if (speed == 15){
        timer = [NSTimer scheduledTimerWithTimeInterval:(1.5)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }else if (speed == 10){
        timer = [NSTimer scheduledTimerWithTimeInterval:(1.0)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }else if (speed == 5){
        timer = [NSTimer scheduledTimerWithTimeInterval:(0.5)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }else if (speed == 3){
        timer = [NSTimer scheduledTimerWithTimeInterval:(0.3)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }
    NSLog(@"speed:%d", speed);
}

- (void)onTimer:(NSTimer*)timer{
    
    if(digit==1){
        num = arc4random() % 9 + 1;
    }else if(digit==2){
        num = arc4random() % 90 + 10;
    }else if (digit==3){
        num = arc4random() % 900 + 100;
    }else if (digit==4){
        num = arc4random() % 9000 + 1000;
    }
    
    // 重複チェック(値の連続を防ぐ)
    if( startInput ){
        startInput = NO;
    }else{
        if(chk_num == num){
            if(num==9 || num==99 || num == 999 || num == 9999){
                num = num - 1;
            }else{
                num = num + 1;
            }
        }
    }
    chk_num = num;
    num_lbl.text = [NSString stringWithFormat:@"%d",num];
    count++;
    sum += num;
    
    if(count == problem){
        [self timerStop];
    }
}

-(void)timerStop{
    [timer invalidate];
    timeflg = FALSE;
    [self performSelector:@selector(nextViewCotroller) withObject:nil afterDelay:0.5];
}

-(void)nextViewCotroller{
    [self performSegueWithIdentifier:@"Push" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    FreeAnswerViewController *FAnswerViewController = [segue destinationViewController];
    FAnswerViewController.sum = sum;
    FAnswerViewController.digit = digit;
    FAnswerViewController.problem = problem;
    FAnswerViewController.speed = speed;
    
}

@end
