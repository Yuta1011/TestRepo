//
//  RecordCell.h
//  Flashlate
//
//  Created by yu-yu on 13/07/28.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface FLRecordCell : UITableViewCell
{
    // サブビュー
    UILabel*        _titleLabel;
    UILabel*        _feedLabel;
    UIImageView*    _numberBackgroundImageView;
    UILabel*        _numberLabel;
    
    UILabel *_rankLabel;
    UILabel *_judgeLabel;
    UILabel *_pointLabel;
    UILabel *_timeStampLabel;
    UILabel *_restTime;
    UILabel *_rightCnt;
    UILabel *_wrongCnt;
    UILabel *_maxCombo;
    UILabel *_judgeRankLabel;
    UILabel *_timeLabel;
    
    
}

@property (nonatomic, retain) UILabel *rankLabel;
@property (nonatomic, retain) UILabel *judgeLabel;
@property (nonatomic, retain) UILabel *pointLabel;
@property (nonatomic, retain) UILabel *timeStampLabel;
@property (nonatomic, retain) UILabel *restTime;
@property (nonatomic, retain) UILabel *rightCnt;
@property (nonatomic, retain) UILabel *wrongCnt;
@property (nonatomic, retain) UILabel *maxCombo;
@property (nonatomic, retain) UILabel *judgeRankLabel;
@property (nonatomic, retain) UILabel *timeLabel;










@end
