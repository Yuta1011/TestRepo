//
//  ChallengeCalculationViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/07/23.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeAnswerViewController.h"
#import "ChallengeRecordTableViewController.h"

@class Record;

@interface ChallengeCalculationViewController : UIViewController<ChallengeAnswerViewDelegate>
{
    Record *_record;
    
    NSTimer *timer;
    
    IBOutlet UIImageView *image1;
    IBOutlet UIImageView *image2;
    IBOutlet UIImageView *image3;
    
}


@property(nonatomic, strong)Record *record;


@property (strong, nonatomic) IBOutlet UILabel *num_lbl;
@property (strong, nonatomic) UILabel *right_lbl;
@property (strong, nonatomic) UILabel *wrong_lbl;
@property (strong, nonatomic) UILabel *point_lbl;
@property (strong, nonatomic) UILabel *judge_lbl;
@property (strong, nonatomic) UILabel *fever_lbl;
@property (strong, nonatomic) UILabel *combo_lbl;
@property (strong, nonatomic) UIButton *record_btn;
@property(nonatomic)int digit;
@property(nonatomic)int problem;
@property(nonatomic)int speed;
@property(nonatomic)int count;
@property(nonatomic)int num;
@property(nonatomic)int sum;
@property(nonatomic)BOOL timeflg;
@property(nonatomic)BOOL startInput;
@property(nonatomic)int chk_num;    // 重複チェック
@property(nonatomic)int stg_cnt;    // ステージカウント
@property(nonatomic)int finish_flg;
@property(nonatomic)int right_cnt;  // 1...正解 2...不正解
@property(nonatomic)int wrong_cnt;
@property(nonatomic)int point;
@property(nonatomic)int combo_cnt;
@property(nonatomic)int max_combo;
@property(nonatomic)NSString *judge;


// ポイント
#define EASY_SLOW_POINT 1000
#define EASY_NORMAL_POINT 1500
#define EASY_FAST_POINT 2000

#define NORMAL_SLOW_POINT 2500
#define NORMAL_NORMAL_POINT 3000
#define NORMAL_FAST_POINT 3500

#define HARD_SLOW_POINT 4000
#define HARD_NORMAL_POINT 4500
#define HARD_FAST_POINT 5000

#define COMBO_POINT 500


- (void)startDidPush;
- (void)DidStart;
- (void)onTimer:(NSTimer*)timer;
//- (void)nextProblem;
//- (void)finishCalc;


@end
