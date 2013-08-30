//
//  ChallengeCalculationViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/08/21.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeSelectViewController.h"
#import "ChallengeResultViewController.h"
#import "Global.h"
#import "QBFlatButton.h"
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"
#import <AVFoundation/AVFoundation.h>

#define EASY_POINT 3000
#define NORMAL_POINT 4000
#define HARD_POINT 5000


@interface ChallengeCalculationViewController : UIViewController
{
    AVAudioPlayer *bgm;
}


@property int right_cnt;
@property int wrong_cnt;
@property int stg_cnt;
@property float time_cnt;
@property int point;
@property int combo;
@property int max_combo;
@property int sum;
@property int touch_lbl;
@property int course_flg;


- (void)didStart;
- (void)resetBackSwipe;


@end
