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

@interface FreeSettingViewController : UIViewController
{
    
    IBOutlet UILabel *lbl_start;
    
    IBOutlet QBFlatButton *startBtn;
    
    IBOutlet FUISegmentedControl *digitSeg;
    IBOutlet FUISegmentedControl *problemSeg;
    IBOutlet FUISegmentedControl *speedSeg;
    
}


@property(nonatomic)int digit;
@property(nonatomic)int problem;
@property(nonatomic)int speed;

- (IBAction)digitSegChange:(id)sender;
- (IBAction)problemSegChange:(id)sender;
- (IBAction)speedSegChange:(id)sender;
- (IBAction)PushStart:(id)sender;




@end
