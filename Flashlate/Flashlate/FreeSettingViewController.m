//
//  FreeSettingViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/07/20.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "FreeSettingViewController.h"


@interface FreeSettingViewController ()

@property int num;
@property int count;
@property int chk_num;
@property BOOL startInput;
@property BOOL timeflg;

@property UILabel *lbl_ready;
@property (strong, nonatomic) IBOutlet QBFlatButton *btn_start;


- (IBAction)btnDidPush:(id)sender;

@end


@implementation FreeSettingViewController
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
    
    digit = 1;
    problem = 2;
    speed = 10;
    
    /*
    NSString *path = [[NSBundle mainBundle] pathForResource:@"lblStart" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    lbl_start.backgroundColor = [UIColor colorWithPatternImage:image];
    */
     
    // btnカスタマイズ
    _btn_start.faceColor = RGB(52, 152, 219);
    _btn_start.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _btn_start.radius = 15.0;
    _btn_start.margin = 4.0;
    _btn_start.depth = 10.0;
    
    // segmentカスタマイズ
    digitSeg.selectedFontColor = [UIColor cloudsColor];
    digitSeg.deselectedFontColor = [UIColor blackColor];
    digitSeg.selectedColor = [UIColor orangeColor];
    digitSeg.deselectedColor = [UIColor cloudsColor];
    digitSeg.dividerColor = [UIColor midnightBlueColor];
    digitSeg.cornerRadius = 15.0;
    
    problemSeg.selectedFontColor = [UIColor cloudsColor];
    problemSeg.deselectedFontColor = [UIColor blackColor];
    problemSeg.selectedColor = [UIColor orangeColor];
    problemSeg.deselectedColor = [UIColor cloudsColor];
    problemSeg.dividerColor = [UIColor midnightBlueColor];
    problemSeg.cornerRadius = 15.0;
    
    speedSeg.selectedFontColor = [UIColor cloudsColor];
    speedSeg.deselectedFontColor = [UIColor blackColor];
    speedSeg.selectedColor = [UIColor orangeColor];
    speedSeg.deselectedColor = [UIColor cloudsColor];
    speedSeg.dividerColor = [UIColor midnightBlueColor];
    speedSeg.cornerRadius = 15.0;
    
    
    
    _lbl_ready = [[UILabel alloc] initWithFrame:CGRectMake(10,130,300,70)];
    _lbl_ready.font = [UIFont fontWithName:@"Arial-BoldMT" size:65];
    //_lbl_ready.textColor = RGB(231, 76, 60);
    _lbl_ready.textColor = [UIColor blackColor];
    _lbl_ready.backgroundColor = [UIColor clearColor];
    _lbl_ready.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_lbl_ready];
    
    // 角丸
    [[lbl_num layer] setCornerRadius:15.0];
    [lbl_num setClipsToBounds:YES];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    _startInput=YES;
    lbl_num.text = @"";
    
    digitSeg.hidden=NO;
    speedSeg.hidden=NO;
    problemSeg.hidden=NO;
    _btn_start.hidden=NO;
    lbl_num.hidden=NO;
    
    _lbl_ready.hidden=YES;
    
    [self DidStart];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitSegChange:(id)sender{
    
    if([sender isKindOfClass:[UISegmentedControl class]]){
        UISegmentedControl *seg = sender;
        if(0==seg.selectedSegmentIndex){
            digit=1;
        }else if(1==seg.selectedSegmentIndex){
            digit=2;
        }else if(2==seg.selectedSegmentIndex){
            digit=3;
        }else{
            digit=4;
        }
    }
    [self addSegMusic];
}

- (IBAction)problemSegChange:(id)sender{
    
    if([sender isKindOfClass:[UISegmentedControl class]]){
        UISegmentedControl *seg = sender;
        if(0==seg.selectedSegmentIndex){
            problem=2;
        }else if(1==seg.selectedSegmentIndex){
            problem=3;
        }else if(2==seg.selectedSegmentIndex){
            problem=4;
        }else if(3==seg.selectedSegmentIndex){
            problem=5;
        }else{
            problem=10;
        }
    }
   [self addSegMusic];
}

- (IBAction)speedSegChange:(id)sender{
    
    if([sender isKindOfClass:[UISegmentedControl class]]){
        UISegmentedControl *seg = sender;
        if(0==seg.selectedSegmentIndex){
            //speed = 3;
            speed = 20;
        }else if(1==seg.selectedSegmentIndex){
            //speed = 5;
            speed = 15;
        }else if(2==seg.selectedSegmentIndex){
            //speed = 10;
            speed = 10;
        }else if(3==seg.selectedSegmentIndex){
            //speed = 15;
            speed = 5;
        }else if(4==seg.selectedSegmentIndex){
            //speed = 20;
            speed = 3;
        }
    }
    [self timeStop];
    [self DidStart];
    [self addSegMusic];
}

- (void)addSegMusic {
    NSString *bgmPath = [[NSBundle mainBundle]
                         pathForResource:@"tap" ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    bgm = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [bgm setNumberOfLoops:0]; // 0なら1回だけ。－1ならエンドレスリピート。
    [bgm play];
    NSLog(@"music");
}

- (void)addBtnMusic {
    NSString *bgmPath = [[NSBundle mainBundle]
                         pathForResource:@"btnTap" ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    bgm = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [bgm setNumberOfLoops:0]; // 0なら1回だけ。－1ならエンドレスリピート。
    [bgm play];
}

-(void)DidStart{
    
    if(speed==20){
        timer = [NSTimer scheduledTimerWithTimeInterval:(2.2)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }else if (speed==15){
        timer = [NSTimer scheduledTimerWithTimeInterval:(1.7)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }else if (speed==10){
        timer = [NSTimer scheduledTimerWithTimeInterval:(1.2)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }else if (speed==5){
        timer = [NSTimer scheduledTimerWithTimeInterval:(0.7)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }else if (speed==3){
        timer = [NSTimer scheduledTimerWithTimeInterval:(0.5)
                                                 target:self selector:@selector(onTimer:)
                                               userInfo:nil repeats:YES];
    }
    NSLog(@"speed:%d", speed);
}

- (void)onTimer:(NSTimer*)timer{
    
    if(digit==1){
        _num = arc4random() % 9 + 1;
    }else if(digit==2){
        _num = arc4random() % 90 + 10;
    }else if (digit==3){
        _num = arc4random() % 900 + 100;
    }else if (digit==4){
        _num = arc4random() % 9000 + 1000;
    }
    
    if( _startInput ){
        _startInput = NO;
    }else{
        if(_chk_num == _num){
            if(_num==9 || _num==99 || _num == 999 || _num == 9999){
                _num = _num - 1;
            }else{
                _num = _num + 1;
            }
        }
    }
    _chk_num = _num;
    lbl_num.text = [NSString stringWithFormat:@"%d", _num];
    
    if(speed==20){
        [self performSelector:@selector(hiddenNumber) withObject:nil afterDelay:2.0];
    }else if (speed==15) {
        [self performSelector:@selector(hiddenNumber) withObject:nil afterDelay:1.5];
    }else if (speed==10){
        [self performSelector:@selector(hiddenNumber) withObject:nil afterDelay:1.0];
    }else if (speed==5){
        [self performSelector:@selector(hiddenNumber) withObject:nil afterDelay:0.5];
    }else if (speed==3){
        [self performSelector:@selector(hiddenNumber) withObject:nil afterDelay:0.3];
    }
}

- (void)hiddenNumber
{
    lbl_num.text = @"";
}
    
- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear");
    [super viewWillDisappear:animated];
    
    [self timeStop];
}

- (void)timeStop {
    _startInput=NO;
    [timer invalidate];
    _timeflg = FALSE;
}

- (IBAction)btnDidPush:(id)sender {
    
    digitSeg.hidden=YES;
    speedSeg.hidden=YES;
    problemSeg.hidden=YES;
    _btn_start.hidden=YES;
    lbl_num.hidden=YES;
   
    _lbl_ready.hidden=NO;
    _lbl_ready.text = @"Ready?";
    [self performSelector:@selector(btnReady) withObject:nil afterDelay:1.0];
    
    [self addBtnMusic];
    //[self performSegueWithIdentifier:@"Push" sender:self];
    
}

- (void)btnReady {
    _lbl_ready.text = @"Go";
    [self performSelector:@selector(btnStart) withObject:nil afterDelay:0.5];
}

- (void)btnStart {
    
    [self performSegueWithIdentifier:@"Push" sender:self];
    
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    FreeCalculationViewController *FCalculationViewController = [segue destinationViewController];
    
    // 秒数、桁、問題数
    FCalculationViewController.speed = speed;
    FCalculationViewController.digit = digit;
    FCalculationViewController.problem = problem;
    
}








@end
