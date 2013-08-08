//
//  ChallengeCalculationViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/07/23.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "FLRecord.h"
#import "FLDataManager.h"
#import "ChallengeCalculationViewController.h"

@interface ChallengeCalculationViewController ()

@end

@implementation ChallengeCalculationViewController
@synthesize num_lbl;
@synthesize right_lbl;
@synthesize wrong_lbl;
@synthesize point_lbl;
@synthesize judge_lbl;
@synthesize fever_lbl;
@synthesize combo_lbl;
@synthesize record_btn;
@synthesize digit;
@synthesize problem;
@synthesize speed;
@synthesize count;
@synthesize num;
@synthesize sum;
@synthesize timeflg;
@synthesize chk_num;
@synthesize startInput;
@synthesize stg_cnt;
@synthesize finish_flg;
@synthesize right_cnt;
@synthesize wrong_cnt;
@synthesize combo_cnt;
@synthesize point;
@synthesize max_combo;
@synthesize judge;
@synthesize record = _record;
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
    timeflg=FALSE;
    [self startDidPush];
    
    startInput = YES;
    
    // navigationBar戻る禁止
    [self.navigationItem setHidesBackButton:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startDidPush{
    stg_cnt++;
    /*
    if(stg_cnt==5){
        self.title = @"Final Stage";
    }else{
        self.title = [NSString stringWithFormat:@"Stage %d", stg_cnt];
    }
    */
    num_lbl.text = @"";
    
    [self performSelector:@selector(DidStart) withObject:nil afterDelay:1.0];
}

-(void)DidStart{
    count = 0;
    sum = 0;
    
    if(speed == 15){
        timer = [NSTimer scheduledTimerWithTimeInterval:(1.7)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }else if (speed == 10){
        timer = [NSTimer scheduledTimerWithTimeInterval:(1.2)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }else if (speed == 5){
        timer = [NSTimer scheduledTimerWithTimeInterval:(0.7)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }
}

- (void)onTimer:(NSTimer*)timer{
    
    if(digit==1){
        num = arc4random() % 9 + 1;
    }else if(digit==2){
        if(count==0 || count == 2 || count == 4){
            num = arc4random() % 90 + 10;
        }else{
            num = arc4random() % 9 + 1;
        }
        //num = arc4random() % 90 + 10;
    }else if (digit==3){
        //num = arc4random() % 900 + 100;
        num = arc4random() % 90 + 10;
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
    
    if (speed==15) {
        [self performSelector:@selector(hiddenNumber) withObject:nil afterDelay:1.5];
    }else if (speed==10){
        [self performSelector:@selector(hiddenNumber) withObject:nil afterDelay:1.0];
    }else{
        [self performSelector:@selector(hiddenNumber) withObject:nil afterDelay:0.5];
    }

    if(count == problem){
        [self timerStop];
    }
}

-(void)hiddenNumber{
    num_lbl.text = @"";
}

-(void)timerStop{
    [timer invalidate];
    timeflg = FALSE;
    if(finish_flg==1){
        num_lbl.text=@"";
        num_lbl.hidden=YES;
        
        // 全問不正解
        if(right_cnt==0){
            point=0;
            judge=@"D";
        }
        
        // 保存処理
        NSDate *date = [NSDate date];
        NSString *timeDate = [date description];
        NSString *timeStamp = [timeDate substringToIndex:10];
        
        [[FLDataManager sharedManager] insertJudge:judge point:point timeStamp:timeStamp course_flg:course_flg];
        
        NSLog(@"course_flg:%d", course_flg);
        
        
        [self performSegueWithIdentifier:@"Push" sender:self];
    }else{
        [self performSelector:@selector(modalView) withObject:nil afterDelay:0.5];
    }
}

-(void)modalView{
    
    ChallengeAnswerViewController *CAnswerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Modal"];
    CAnswerViewController.delegate = self;
    CAnswerViewController.sum = sum;
    [self presentViewController:CAnswerViewController animated:YES completion:nil];
    
}

-(void)nextProblem:(int)result {
    if(result==1){
        right_cnt++;
        //combo_cnt++;
        [self addPoint];
    }else if(result==2){
        //combo_cnt=0;
        wrong_cnt++;
        if(wrong_cnt==1){
            //image1.hidden=YES;
            image1.highlighted=YES;
        }else if (wrong_cnt==2){
            //image2.hidden=YES;
            image2.highlighted=YES;
        }else if (wrong_cnt==3){
            //image3.hidden=YES;
            image3.highlighted=YES;
        }
    }
    
    // 3問ミスで強制終了
    if(5==stg_cnt || wrong_cnt>2){
        finish_flg=1;
        [self timerStop];
    }else{
        [self startDidPush];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addPoint{
    switch (digit) {
        case 1:
            if(speed==15){
                point+=EASY_SLOW_POINT;
                if(point==5000){
                    judge=@"S";
                }else if (point>=4000){
                    judge=@"A";
                }else if (point>=3000){
                    judge=@"B";
                }else{
                    judge=@"C";
                }
            }else if(speed==10){
                point+=EASY_NORMAL_POINT;
                if(point==7500){
                    judge=@"S";
                }else if (point>=6000){
                    judge=@"A";
                }else if (point>=4500){
                    judge=@"B";
                }else{
                    judge=@"C";
                }
            }else{
                point+=EASY_FAST_POINT;
                if(point==10000){
                    judge=@"S";
                }else if (point>=8000){
                    judge=@"A";
                }else if (point>=6000){
                    judge=@"B";
                }else{
                    judge=@"C";
                }
            }
            break;
        case 2:
            if(speed==15){
                point+=NORMAL_SLOW_POINT;
                if(point==12500){
                    judge=@"S";
                }else if (point>=10000){
                    judge=@"A";
                }else if (point>=7500){
                    judge=@"B";
                }else{
                    judge=@"C";
                }
            }else if (speed==10){
                point+=NORMAL_NORMAL_POINT;
                if(point==15000){
                    judge=@"S";
                }else if (point>=12000){
                    judge=@"A";
                }else if (point>=9000){
                    judge=@"B";
                }else{
                    judge=@"C";
                }
            }else{
                point+=NORMAL_FAST_POINT;
                if(point==17500){
                    judge=@"S";
                }else if (point>=14000){
                    judge=@"A";
                }else if (point>=10500){
                    judge=@"B";
                }else{
                    judge=@"C";
                }
            }
            break;
        case 3:
            if(speed==15){
                point+=HARD_SLOW_POINT;
                if(point==20000){
                    judge=@"S";
                }else if (point>=16000){
                    judge=@"A";
                }else if (point>=12000){
                    judge=@"B";
                }else{
                    judge=@"C";
                }
            }else if (speed==10){
                point+=HARD_NORMAL_POINT;
                if(point==22500){
                    judge=@"S";
                }else if (point>=18000){
                    judge=@"A";
                }else if (point>=13500){
                    judge=@"B";
                }else{
                    judge=@"C";
                }
            }else{
                point+=HARD_FAST_POINT;
                if(point==25000){
                    judge=@"S";
                }else if (point>=20000){
                    judge=@"A";
                }else if (point>=15000){
                    judge=@"B";
                }else{
                    judge=@"C";
                }
            }
            break;
        default:
            break;
    }
    //[self addCombo];
}

-(void)addCombo{
    //　最大値取得
    if(max_combo<combo_cnt){
        max_combo=combo_cnt;
    }
    if(combo_cnt>2){
        point+=COMBO_POINT;
        fever_lbl.hidden=NO;
        combo_lbl.hidden=NO;
        //self.view.backgroundColor=[UIColor yellowColor];
        combo_lbl.text = [NSString stringWithFormat:@"%d combo", combo_cnt];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    ChallengeRecordTableViewController *CRecordTableViewController = [segue destinationViewController];
    CRecordTableViewController.right_cnt=right_cnt;
    CRecordTableViewController.wrong_cnt=wrong_cnt;
    CRecordTableViewController.point=point;
    CRecordTableViewController.max_combo=max_combo;
    CRecordTableViewController.judge=judge;
    
    
}



@end
