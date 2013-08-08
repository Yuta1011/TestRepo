//
//  FreeSettingViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/07/20.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "FreeSettingViewController.h"


@interface FreeSettingViewController ()

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
    
    // lblカスタマイズ
    NSString *path = [[NSBundle mainBundle] pathForResource:@"lblStart" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    lbl_start.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
    // btnカスタマイズ
    //startBtn.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    startBtn.faceColor = RGB(52, 152, 219);
    startBtn.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    startBtn.radius = 8.0;
    startBtn.margin = 4.0;
    startBtn.depth = 8.0;
    
    // segmentカスタマイズ
    digitSeg.selectedFontColor = [UIColor cloudsColor];
    digitSeg.deselectedFontColor = [UIColor blackColor];
    digitSeg.selectedColor = [UIColor orangeColor];
    digitSeg.deselectedColor = [UIColor cloudsColor];
    digitSeg.dividerColor = [UIColor midnightBlueColor];
    digitSeg.cornerRadius = 5.0;
    
    problemSeg.selectedFontColor = [UIColor cloudsColor];
    problemSeg.deselectedFontColor = [UIColor blackColor];
    problemSeg.selectedColor = [UIColor orangeColor];
    problemSeg.deselectedColor = [UIColor cloudsColor];
    problemSeg.dividerColor = [UIColor midnightBlueColor];
    problemSeg.cornerRadius = 5.0;
    
    speedSeg.selectedFontColor = [UIColor cloudsColor];
    speedSeg.deselectedFontColor = [UIColor blackColor];
    speedSeg.selectedColor = [UIColor orangeColor];
    speedSeg.deselectedColor = [UIColor cloudsColor];
    speedSeg.dividerColor = [UIColor midnightBlueColor];
    speedSeg.cornerRadius = 5.0;
    
    
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
}

- (IBAction)speedSegChange:(id)sender{
    
    if([sender isKindOfClass:[UISegmentedControl class]]){
        UISegmentedControl *seg = sender;
        if(0==seg.selectedSegmentIndex){
            speed = 3;
        }else if(1==seg.selectedSegmentIndex){
            speed = 5;
        }else if(2==seg.selectedSegmentIndex){
            speed = 10;
        }else if(3==seg.selectedSegmentIndex){
            speed = 15;
        }else if(4==seg.selectedSegmentIndex){
            speed = 20;
        }
    }
}

- (IBAction)PushStart:(id)sender{
    // 選択されてない時の警告処理
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    FreeCalculationViewController *FCalculationViewController = [segue destinationViewController];
    
    // 秒数、桁、問題数
    FCalculationViewController.speed = speed;
    FCalculationViewController.digit = digit;
    FCalculationViewController.problem = problem;

}



@end
