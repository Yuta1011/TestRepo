//
//  ChallengeCalculationViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/08/21.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "ChallengeCalculationViewController.h"

@interface ChallengeCalculationViewController ()

@property (strong, nonatomic) IBOutlet UILabel *lbl_left;
@property (strong, nonatomic) IBOutlet UILabel *lbl_right;
@property (strong, nonatomic) IBOutlet UILabel *lbl_restTime;
@property (strong, nonatomic) IBOutlet UILabel *lbl_combo;

@property (strong, nonatomic) IBOutlet UILabel *lbl_leftTop;
@property (strong, nonatomic) IBOutlet UILabel *lbl_rightTop;
@property (strong, nonatomic) IBOutlet UILabel *lbl_leftDown;
@property (strong, nonatomic) IBOutlet UILabel *lbl_rightDown;
@property (strong, nonatomic) IBOutlet UILabel *lbl_background;

@property (strong, nonatomic) IBOutlet UILabel *lbl_addTime;


@property (strong, nonatomic) IBOutlet QBFlatButton *btn_leftTop;
@property (strong, nonatomic) IBOutlet QBFlatButton *btn_rightTop;
@property (strong, nonatomic) IBOutlet QBFlatButton *btn_leftDown;
@property (strong, nonatomic) IBOutlet QBFlatButton *btn_rightDown;

@property UILabel *lbl_judge;

@property int leftNum;
@property int rightNum;
@property int tranCnt;

@property NSTimer *timer;
@property BOOL timeflg;


- (IBAction)btnDidPush:(id)sender;
- (IBAction)swipeHandleGesture:(id)sender;

@end

@implementation ChallengeCalculationViewController
@synthesize right_cnt;
@synthesize wrong_cnt;
@synthesize stg_cnt;
@synthesize sum;
@synthesize combo;
@synthesize point;
@synthesize time_cnt;
@synthesize touch_lbl;
@synthesize max_combo;
@synthesize course_flg;


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
    NSLog(@"viewDidLoad");
    
    sum=0;
    max_combo=0;
    _timeflg=false;
    
    _lbl_addTime.hidden=YES;
    
    if(course_flg==1){
        time_cnt=10.00;
    }else if (course_flg==2){
        time_cnt=10.00;
    }else{
        time_cnt=10.00;
    }
    
    
    // 角丸
    [[_lbl_background layer] setCornerRadius:15.0];
    [_lbl_background setClipsToBounds:YES];
    
    
    _lbl_combo.hidden=YES;
    [self.navigationItem setHidesBackButton:YES];
    
    _lbl_judge = [[UILabel alloc] initWithFrame:CGRectMake(10,20,300,300)];
    _lbl_judge.text = @"";
    //_lbl_judge.textColor = [UIColor redColor];
    _lbl_judge.textColor = RGB(231, 76, 60);
    _lbl_judge.backgroundColor = [UIColor clearColor];
    _lbl_judge.textAlignment = NSTextAlignmentCenter;
    _lbl_judge.font = [UIFont fontWithName:@"Arial-BoldMT" size:480];
    [self.view addSubview:_lbl_judge];
    
    // Flat
    _btn_leftTop.faceColor = RGB(52, 152, 219);
    _btn_leftTop.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _btn_leftTop.radius = 15.0;
    _btn_leftTop.margin = 4.0;
    _btn_leftTop.depth = 10.0;
    
    _btn_rightTop.faceColor = RGB(52, 152, 219);
    _btn_rightTop.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _btn_rightTop.radius = 15.0;
    _btn_rightTop.margin = 4.0;
    _btn_rightTop.depth = 10.0;
    
    _btn_leftDown.faceColor = RGB(52, 152, 219);
    _btn_leftDown.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _btn_leftDown.radius = 15.0;
    _btn_leftDown.margin = 4.0;
    _btn_leftDown.depth = 10.0;
    
    _btn_rightDown.faceColor = RGB(52, 152, 219);
    _btn_rightDown.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _btn_rightDown.radius = 15.0;
    _btn_rightDown.margin = 4.0;
    _btn_rightDown.depth = 10.0;
    
    
    [self didStart];
    [self startTimer];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    _tranCnt=0;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)startTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:(0.01)
                                             target:self selector:@selector(onTimer:)
                                           userInfo:nil repeats:YES];
}

- (void)onTimer:(NSTimer*)timer {
    //time_cnt =[[_lbl_restTime text] floatValue];
    time_cnt-=0.01;
    _lbl_restTime.text = [NSString stringWithFormat:@"%.2f", time_cnt];
    
    if(time_cnt<=4.00){
        _lbl_restTime.textColor = RGB(231, 76, 60);
    }else{
        _lbl_restTime.textColor = [UIColor blackColor];
    }
    
    if(time_cnt<0){
        time_cnt=0.00;
        [self stopTimer];
    }
}

-(void)stopTimer{
    
    _timeflg=false;
    [_timer invalidate];
    _tranCnt=1;
    
    [self performSegueWithIdentifier:@"Result" sender:self];
    
}

-(void)didStart{
    stg_cnt++;
    _lbl_addTime.hidden=YES;
    
    srand([[NSDate date] timeIntervalSinceReferenceDate]);
    
    if(course_flg==1){
        _leftNum = arc4random() % 9 + 1;
        _rightNum = arc4random() % 9 + 1;
        sum = _leftNum + _rightNum;
        _lbl_left.text = [NSString stringWithFormat:@"%d",_leftNum];
        _lbl_right.text = [NSString stringWithFormat:@"%d",_rightNum];
    }else if (course_flg==2){
        /*
        int rdm = arc4random() % 2;
        if(rdm==0){
            _leftNum = arc4random() % 90 + 10;
            _rightNum = arc4random() % 9 + 1;
        }else{
            _leftNum = arc4random() % 9 + 1;
            _rightNum = arc4random() % 90 + 10;
        }
        */
        _leftNum = arc4random() % 90 + 10;
        _rightNum = arc4random() % 9 + 1;
        sum = _leftNum + _rightNum;
        _lbl_left.text = [NSString stringWithFormat:@"%d",_leftNum];
        _lbl_right.text = [NSString stringWithFormat:@"%d",_rightNum];
    }else{
        _leftNum = arc4random() % 90 + 10;
        _rightNum = arc4random() % 90 + 10;
        sum = _leftNum + _rightNum;
        _lbl_left.text = [NSString stringWithFormat:@"%d",_leftNum];
        _lbl_right.text = [NSString stringWithFormat:@"%d",_rightNum];
    }
        
    // 乱数で、選択肢の場所を変更
    int random = rand() % 24 + 1;
    switch (random) {
        case 1:     // 正解が右下
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum];
            touch_lbl = 4;
            break;
        case 2:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum];
            touch_lbl = 4;
            break;
        case 3:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum];
            touch_lbl = 4;
            break;
        case 4:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum];
            touch_lbl = 4;
            break;
        case 5:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum];
            touch_lbl = 4;
            break;
        case 6:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum];
            touch_lbl = 4;
            break;
        case 7:     // 正解が左下
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            touch_lbl = 3;
            break;
        case 8:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            touch_lbl = 3;
            break;
        case 9:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            touch_lbl = 3;
            break;
        case 10:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            touch_lbl = 3;
            break;
        case 11:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            touch_lbl = 3;
            break;
        case 12:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            touch_lbl = 3;
            break;
        case 13:        // 正解が右上
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            touch_lbl = 2;
            break;
        case 14:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            touch_lbl = 2;
            break;
        case 15:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            touch_lbl = 2;
            break;
        case 16:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            touch_lbl = 2;
            break;
        case 17:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            touch_lbl = 2;
            break;
        case 18:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            touch_lbl = 2;
            break;
        case 19:        // 正解が左上
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            touch_lbl = 1;
            break;
        case 20:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            touch_lbl = 1;
            break;
        case 21:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            touch_lbl = 1;
            break;
        case 22:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            touch_lbl = 1;
            break;
        case 23:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 1];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            touch_lbl = 1;
            break;
        case 24:
            _lbl_leftTop.text = [NSString stringWithFormat:@"%d",sum];
            _lbl_rightTop.text = [NSString stringWithFormat:@"%d",sum + 2];
            _lbl_leftDown.text = [NSString stringWithFormat:@"%d",sum - 1];
            _lbl_rightDown.text = [NSString stringWithFormat:@"%d",sum + 1];
            touch_lbl = 1;
            break;
        default:
            break;
    }
    if(stg_cnt>1){   // 初期画面ならresetAnimationは必要ない
        [self resetAnimation];
    }
}

- (IBAction)btnDidPush:(id)sender {
    
     _lbl_addTime.hidden=NO;
    
    UIButton *b = (UIButton *)sender;
    
    if(touch_lbl==4){
        if(4==b.tag){
            _lbl_judge.text = @"○";
            [self addComboPoint];
            right_cnt++;
            if(course_flg==1){
                time_cnt+=1.00;
                _lbl_addTime.text = @"+ 1.00";
            }else if (course_flg==2){
                time_cnt+=1.50;
                _lbl_addTime.text = @"+ 1.50";
            }else{
                time_cnt+=2.00;
                _lbl_addTime.text = @"+ 2.00";
            }
            [self addRightBgm];
        }else{
            _lbl_judge.text = @"×";
            wrong_cnt++;
            _lbl_combo.hidden=YES;
            combo=0;
            if(course_flg==1){
                time_cnt-=2.00;
            }else if (course_flg==2){
                time_cnt-=2.00;
            }else{
                time_cnt-=2.00;
            }
            _lbl_addTime.text = @"- 2.00";
            [self addWrongBgm];
        }
    }else if(touch_lbl==3){
        if(3==b.tag){
            _lbl_judge.text = @"○";
            [self addComboPoint];
            right_cnt++;
            if(course_flg==1){
                time_cnt+=1.00;
                _lbl_addTime.text = @"+ 1.00";
            }else if (course_flg==2){
                time_cnt+=1.50;
                 _lbl_addTime.text = @"+ 1.50";
            }else{
                time_cnt+=2.00;
                _lbl_addTime.text = @"+ 2.00";
            }
            [self addRightBgm];
        }else{
            _lbl_judge.text = @"×";
            wrong_cnt++;
            _lbl_combo.hidden=YES;
            combo=0;
            if(course_flg==1){
                time_cnt-=2.00;
            }else if (course_flg==2){
                time_cnt-=2.00;
            }else{
                time_cnt-=2.00;
            }
            _lbl_addTime.text = @"- 2.00";
            [self addWrongBgm];
        }
    }else if (touch_lbl==2){
        if(2==b.tag){
            _lbl_judge.text = @"○";
            [self addComboPoint];
            right_cnt++;
            if(course_flg==1){
                time_cnt+=1.00;
                _lbl_addTime.text = @"+ 1.00";
            }else if (course_flg==2){
                time_cnt+=1.50;
                 _lbl_addTime.text = @"+ 1.50";
            }else{
                time_cnt+=2.00;
                _lbl_addTime.text = @"+ 2.00";
            }
            [self addRightBgm];
        }else{
            _lbl_judge.text = @"×";
            wrong_cnt++;
            _lbl_combo.hidden=YES;
            combo=0;
            if(course_flg==1){
                time_cnt-=2.00;
            }else if (course_flg==2){
                time_cnt-=2.00;
            }else{
                time_cnt-=2.00;
            }
            _lbl_addTime.text = @"- 2.00";
            [self addWrongBgm];
        }
    }else if(touch_lbl==1){
        if(1==b.tag){
            _lbl_judge.text = @"○";
            [self addComboPoint];
            right_cnt++;
            if(course_flg==1){
                time_cnt+=1.00;
                 _lbl_addTime.text = @"+ 1.00";
            }else if (course_flg==2){
                time_cnt+=1.50;
                 _lbl_addTime.text = @"+ 1.50";
            }else{
                time_cnt+=2.00;
                _lbl_addTime.text = @"+ 2.00";
            }
            [self addRightBgm];
        }else{
            _lbl_judge.text = @"×";
            wrong_cnt++;
            _lbl_combo.hidden=YES;
            combo=0;
            if(course_flg==1){
                time_cnt-=2.00;
            }else if (course_flg==2){
                time_cnt-=2.00;
            }else{
                time_cnt-=2.00;
            }
            _lbl_addTime.text = @"- 2.00";
            [self addWrongBgm];
        }
    }
    if(stg_cnt==10){
        _tranCnt=1;
        [self performSegueWithIdentifier:@"Result" sender:self];
    }else{
        [self startAnimation];
    }
}

- (void)addRightBgm{
    NSString *bgmPath = [[NSBundle mainBundle]
                         pathForResource:@"Seikai01-1" ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    bgm = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [bgm setNumberOfLoops:0]; // 0なら1回だけ。－1ならエンドレスリピート。
    [bgm play];
}

- (void)addWrongBgm{
    NSString *bgmPath = [[NSBundle mainBundle]
                         pathForResource:@"wrong" ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    bgm = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [bgm setNumberOfLoops:0]; // 0なら1回だけ。－1ならエンドレスリピート。
    [bgm play];
}

/*
-(void)addComboPoint{
    
    combo++;
    
    _lbl_combo.text = [NSString stringWithFormat:@"%d", combo];
    _lbl_combo.hidden=NO;
    
    if(course_flg==1){
        
        if(combo<2){
            point += EASY_POINT;
        }else if(combo<=2){
            point += (EASY_POINT * 2);
        }else if(combo<=4){
            point += (EASY_POINT * 3);
        }else if (combo<=6){
            point += (EASY_POINT * 4);
        }else if (combo<=8){
            point += (EASY_POINT * 5);
        }else{
            point += (EASY_POINT * 10);
        }
        
    }else if (course_flg==2){
        if(combo<2){
            point += NORMAL_POINT;
        }else if(combo<=2){
            point += (NORMAL_POINT * 2);
        }else if(combo<=4){
            point += (NORMAL_POINT * 3);
        }else if (combo<=6){
            point += (NORMAL_POINT * 4);
        }else if (combo<=8){
            point += (NORMAL_POINT * 5);
        }else{
            point += (NORMAL_POINT * 10);
        }
    }else{
        if(combo<2){
            point += HARD_POINT;
        }else if(combo<=2){
            point += (HARD_POINT * 2);
        }else if(combo<=4){
            point += (HARD_POINT * 3);
        }else if (combo<=6){
            point += (HARD_POINT * 4);
        }else if (combo<=8){
            point += (HARD_POINT * 5);
        }else{
            point += (HARD_POINT * 10);
        }
    }
    
    if(max_combo<combo){
        max_combo = combo;
    }
}
*/

-(void)addComboPoint{
    
    if(course_flg==1){
        
        point += EASY_POINT;
        
    }else if (course_flg==2){
        
        point += NORMAL_POINT;
        
    }else{
        
        point += HARD_POINT;
        
    }
}

-(void)startAnimation{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    [UIView setAnimationDuration:0.2];
    
    _lbl_leftTop.alpha=0.0;
    _lbl_rightTop.alpha=0.0;
    _lbl_leftDown.alpha=0.0;
    _lbl_rightDown.alpha=0.0;
    _lbl_left.alpha=0.0;
    _lbl_right.alpha=0.0;
    _btn_leftTop.alpha=0.0;
    _btn_rightTop.alpha=0.0;
    _btn_leftDown.alpha=0.0;
    _btn_rightDown.alpha=0.0;
    _lbl_judge.alpha=0.0;
    [UIView commitAnimations];
    
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished{
    if([finished boolValue]){
        // アニメーションがキャンセルされずに、完了したら
        [self didStart];
    }
}

-(void)resetAnimation{
    
    _lbl_leftTop.alpha=1.0;
    _lbl_rightTop.alpha=1.0;
    _lbl_leftDown.alpha=1.0;
    _lbl_rightDown.alpha=1.0;
    _lbl_left.alpha=1.0;
    _lbl_right.alpha=1.0;
    _btn_leftTop.alpha=1.0;
    _btn_rightTop.alpha=1.0;
    _btn_leftDown.alpha=1.0;
    _btn_rightDown.alpha=1.0;
    _lbl_judge.alpha=1.0;
    _lbl_judge.text=@"";
    
}

/*
- (void)resetBackSwipe {
    
    NSLog(@"resetBackSwipe");
    
    if(course_flg==1){
        time_cnt=8.00;
    }else if (course_flg==2){
        time_cnt=10.00;
    }else{
        time_cnt=15.00;
    }
    
    combo=0;
    sum=0;
    stg_cnt=0;
    right_cnt=0;
    wrong_cnt=0;
    max_combo=0;
    
    [self didStart];
}
*/

- (IBAction)swipeHandleGesture:(id)sender {
    
    _timeflg=false;
    [_timer invalidate];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear");
    [super viewWillDisappear:animated];
    
    _timeflg=false;
    [_timer invalidate];
    
    if(_tranCnt==0){
        [self.navigationController popViewControllerAnimated:YES];
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    ChallengeResultViewController *challengeResult = [segue destinationViewController];
    
    challengeResult.max_combo = max_combo;
    challengeResult.point = point;
    challengeResult.time_cnt = time_cnt;
    challengeResult.right_cnt = right_cnt;
    challengeResult.wrong_cnt = wrong_cnt;
    challengeResult.course_flg = course_flg;
    
    
}




@end
