//
//  ChallengeResultViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/08/21.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeCalculationViewController.h"
#import "FLDataManager.h"
#import <AVFoundation/AVFoundation.h>

@interface ChallengeResultViewController : UIViewController
{
    
    AVAudioPlayer *bgm;
    
}


@property int right_cnt;
@property int wrong_cnt;
@property int point;
@property int max_combo;
@property float time_cnt;
@property int course_flg;






@end
