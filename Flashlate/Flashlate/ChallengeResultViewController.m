//
//  ChallengeResultViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/08/21.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "ChallengeResultViewController.h"

@interface ChallengeResultViewController ()


@property (strong, nonatomic) IBOutlet UILabel *lbl_combo;
@property (strong, nonatomic) IBOutlet UILabel *lbl_point;
@property (strong, nonatomic) IBOutlet UILabel *lbl_right;
@property (strong, nonatomic) IBOutlet UILabel *lbl_wrong;
@property (strong, nonatomic) IBOutlet UILabel *lbl_restTime;

@property (strong, nonatomic) IBOutlet UILabel *lbl_judge;


- (IBAction)btnReturnTop:(id)sender;

- (IBAction)swipeHandleGesture:(id)sender;

@end

@implementation ChallengeResultViewController
@synthesize right_cnt;
@synthesize wrong_cnt;
@synthesize max_combo;
@synthesize point;
@synthesize time_cnt;
@synthesize course_flg;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _lbl_judge.hidden=YES;
    [self.navigationItem setHidesBackButton:YES];
    
    point = point*time_cnt;
    NSLog(@"point:%d", point);
    
    // pointをカンマ区切りに変更
    NSNumber *pointNumber = [[NSNumber alloc] initWithInt:point];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGroupingSeparator:@","];
    [formatter setGroupingSize:3];
    NSString *resultPoint = [formatter stringFromNumber:pointNumber];
    
    _lbl_combo.text = [NSString stringWithFormat:@"%d", max_combo];
    _lbl_point.text = [NSString stringWithFormat:@"%@", resultPoint];
    _lbl_right.text = [NSString stringWithFormat:@"%d", right_cnt];
    _lbl_wrong.text = [NSString stringWithFormat:@"%d", wrong_cnt];
    _lbl_restTime.text = [NSString stringWithFormat:@"%.2f", time_cnt];
    
    // judge判定
    /*
    if(course_flg==1){
        if(point>200000){
            _lbl_judge.text=@"A";
        }else if (point>90000){
            _lbl_judge.text=@"B";
        }else if (point>50000){
            _lbl_judge.text=@"C";
        }else if (point>10000){
            _lbl_judge.text=@"D";
        }else{
            _lbl_judge.text=@"E";
        }
    }else if (course_flg==2){
        if(point>500000){
            _lbl_judge.text=@"A";
        }else if (point>400000){
            _lbl_judge.text=@"B";
        }else if (point>200000){
            _lbl_judge.text=@"C";
        }else if (point>100000){
            _lbl_judge.text=@"D";
        }else{
            _lbl_judge.text=@"E";
        }
    }else{
        if(point>900000){
            _lbl_judge.text=@"A";
        }else if (point>400000){
            _lbl_judge.text=@"B";
        }else if (point>200000){
            _lbl_judge.text=@"C";
        }else if (point>100000){
            _lbl_judge.text=@"D";
        }else{
            _lbl_judge.text=@"E";
        }
    }
    */
    
    if(course_flg==1){
        if(point>270000){
            _lbl_judge.text=@"A";
        }else if (point>210000){
            _lbl_judge.text=@"B";
        }else if (point>150000){
            _lbl_judge.text=@"C";
        }else if (point>120000){
            _lbl_judge.text=@"D";
        }else{
            _lbl_judge.text=@"E";
        }
    }else if (course_flg==2){
        if(point>480000){
            _lbl_judge.text=@"A";
        }else if (point>400000){
            _lbl_judge.text=@"B";
        }else if (point>320000){
            _lbl_judge.text=@"C";
        }else if (point>240000){
            _lbl_judge.text=@"D";
        }else{
            _lbl_judge.text=@"E";
        }
    }else{
        if(point>700000){
            _lbl_judge.text=@"A";
        }else if (point>600000){
            _lbl_judge.text=@"B";
        }else if (point>500000){
            _lbl_judge.text=@"C";
        }else if (point>400000){
            _lbl_judge.text=@"D";
        }else{
            _lbl_judge.text=@"E";
        }
    }
     
    [self Save];
    [self performSelector:@selector(didJudge) withObject:nil afterDelay:1.5];
    
}

- (void)didJudge {
    
    _lbl_judge.hidden=NO;
    [self addMusic];
}

- (void)addMusic{
    NSString *bgmPath = [[NSBundle mainBundle]
                         pathForResource:@"judge" ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    bgm = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [bgm setNumberOfLoops:0]; // 0なら1回だけ。－1ならエンドレスリピート。
    [bgm play];
}

- (void)Save {
    
    // 保存処理
    NSDate *date = [NSDate date];
    NSString *timeDate = [date description];
    NSString *timeStamp = [timeDate substringToIndex:10];
     
    [[FLDataManager sharedManager] insertJudge:_lbl_judge.text point:point timeStamp:timeStamp course_flg:course_flg restTime:_lbl_restTime.text rightCnt:right_cnt wrongCnt:wrong_cnt maxCombo:max_combo];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)btnReturnTop:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

/*
- (IBAction)swipeHandleGesture:(id)sender {
    
    ChallengeCalculationViewController *challengeCalc = [self.navigationController.viewControllers objectAtIndex:1];
    [self.navigationController popToViewController:challengeCalc animated:YES];
    
}
*/






@end
