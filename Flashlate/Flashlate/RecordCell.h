//
//  RecordCell.h
//  Flashlate
//
//  Created by yu-yu on 13/07/28.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface RecordCell : UITableViewCell
{
    // サブビュー
    UILabel*        _titleLabel;
    UILabel*        _feedLabel;
    UIImageView*    _numberBackgroundImageView;
    UILabel*        _numberLabel;
    
    UILabel *_rankLabel;
    UILabel *_judgeLabel;
    UILabel *_pointLabel;
    UILabel *_timeStampLable;
    
}

// プロパティ
@property (nonatomic, retain) UILabel* titleLabel;
@property (nonatomic, retain) UILabel* feedLabel;
@property (nonatomic) int itemNumber;


@property (nonatomic, retain) UILabel *rankLabel;
@property (nonatomic, retain) UILabel *judgeLabel;
@property (nonatomic, retain) UILabel *pointLabel;
@property (nonatomic, retain) UILabel *timeStampLable;










@end
