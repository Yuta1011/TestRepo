//
//  FreeSettingViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/07/20.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreeCalculationViewController.h"
#import "Global.h"
#import "QBFlatButton.h"
#import "FUISegmentedControl.h"
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

@interface FreeSettingViewController : UIViewController
{
    
    //IBOutlet UILabel *lbl_start;
    
    IBOutlet FUISegmentedControl *digitSeg;
    IBOutlet FUISegmentedControl *problemSeg;
    IBOutlet FUISegmentedControl *speedSeg;
    
    IBOutlet UILabel *lbl_num;
    
    NSTimer *timer;
    
    AVAudioPlayer *bgm;
    
}


@property(nonatomic)int digit;
@property(nonatomic)int problem;
@property(nonatomic)int speed;

- (IBAction)digitSegChange:(id)sender;
- (IBAction)problemSegChange:(id)sender;
- (IBAction)speedSegChange:(id)sender;
- (IBAction)PushStart:(id)sender;




@end
