//
//  RecordCell.m
//  Flashlate
//
//  Created by yu-yu on 13/07/28.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "FLRecordCell.h"

@implementation FLRecordCell

@synthesize rankLabel = _rankLabel;
@synthesize judgeLabel = _judgeLabel;
@synthesize pointLabel  =_pointLabel;
@synthesize timeStampLabel = _timeStampLabel;
@synthesize rightCnt = _rightCnt;
@synthesize wrongCnt = _wrongCnt;
@synthesize maxCombo = _maxCombo;
@synthesize restTime = _restTime;
@synthesize judgeRankLabel = _judgeRankLabel;
@synthesize timeLabel = _timeLabel;


//--------------------------------------------------------------//
#pragma mark -- 初期化 --
//--------------------------------------------------------------//

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier
{
    // 親クラスの初期化メソッドを呼び出す
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    // rank
    _rankLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _rankLabel.font = [UIFont boldSystemFontOfSize:40.0f];
    _rankLabel.textColor = [UIColor blackColor];
    _rankLabel.backgroundColor = [UIColor clearColor];
    _rankLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_rankLabel];
    
    // judge
    _judgeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _judgeLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _judgeLabel.textColor = [UIColor blackColor];
    _judgeLabel.backgroundColor = [UIColor clearColor];
    _judgeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_judgeLabel];
    
    // judgeRank
    _judgeRankLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _judgeRankLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _judgeRankLabel.textColor = [UIColor blackColor];
    _judgeRankLabel.backgroundColor = [UIColor clearColor];
    _judgeRankLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_judgeRankLabel];
    
    // point
    _pointLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _pointLabel.font = [UIFont systemFontOfSize:16.0f];
    _pointLabel.textColor = [UIColor blackColor];
    _pointLabel.backgroundColor = [UIColor clearColor];
    _pointLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_pointLabel];
    
    // timeStamp
    _timeStampLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _timeStampLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _timeStampLabel.textColor = [UIColor blackColor];
    _timeStampLabel.backgroundColor = [UIColor clearColor];
    _timeStampLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_timeStampLabel];
    
    // restTime
    _restTime = [[UILabel alloc] initWithFrame:CGRectZero];
    _restTime.font = [UIFont boldSystemFontOfSize:16.0f];
    _restTime.textColor = [UIColor blackColor];
    _restTime.backgroundColor = [UIColor clearColor];
    _restTime.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_restTime];
    
    // timeLabel
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _timeLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _timeLabel.textColor = [UIColor blackColor];
    _timeLabel.backgroundColor = [UIColor clearColor];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_timeLabel];
    
    // rightCnt
    _rightCnt = [[UILabel alloc] initWithFrame:CGRectZero];
    _rightCnt.font = [UIFont boldSystemFontOfSize:16.0f];
    _rightCnt.textColor = [UIColor blackColor];
    _rightCnt.backgroundColor = [UIColor clearColor];
    _rightCnt.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_rightCnt];
    
    // wrongCnt
    _wrongCnt = [[UILabel alloc] initWithFrame:CGRectZero];
    _wrongCnt.font = [UIFont boldSystemFontOfSize:16.0f];
    _wrongCnt.textColor = [UIColor blackColor];
    _wrongCnt.backgroundColor = [UIColor clearColor];
    _wrongCnt.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_wrongCnt];
    
    // maxCombo
    _maxCombo = [[UILabel alloc] initWithFrame:CGRectZero];
    _maxCombo.font = [UIFont boldSystemFontOfSize:16.0f];
    _maxCombo.textColor = [UIColor blackColor];
    _maxCombo.backgroundColor = [UIColor clearColor];
    _maxCombo.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_maxCombo];
        
    return self;
}

//--------------------------------------------------------------//
#pragma mark -- プロパティ --
//--------------------------------------------------------------//

- (int)itemNumber
{
    // ラベルから数値を取得する
    return [_numberLabel.text intValue];
}

- (void)setItemNumber:(int)itemNumber
{
    // ラベルにテキストを設定する
    _numberLabel.text = [NSString stringWithFormat:@"%d", itemNumber];
    
    // セルの再レイアウトを行う
    [self setNeedsLayout];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    // 親クラスのメソッドを呼び出す
    [super setHighlighted:highlighted animated:animated];
    
    // ラベルのハイライトを設定する
    _titleLabel.highlighted = highlighted;
    _feedLabel.highlighted = highlighted;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    // 親クラスのメソッドを呼び出す
    [super setSelected:selected animated:animated];
    
    // ラベルのハイライトを設定する
    _titleLabel.highlighted = selected;
    _feedLabel.highlighted = selected;
}

//--------------------------------------------------------------//
#pragma mark -- レイアウト --
//--------------------------------------------------------------//

- (void)layoutSubviews
{
    // 親クラスのメソッドを呼び出す
    [super layoutSubviews];
    
    _rankLabel.frame = CGRectMake(5, 17, 45, 20);
    _judgeLabel.frame = CGRectMake(50, 17, 30, 20);
    _judgeRankLabel.frame = CGRectMake(75, 17, 40, 20);
    _timeLabel.frame = CGRectMake(110, 17, 60, 20);
    _restTime.frame = CGRectMake(160, 17, 50, 20);
    _pointLabel.frame = CGRectMake(180, 17, 180, 20);
    
    /*
    _rightCnt.frame = CGRectMake(50, 20, 70, 25);
    _wrongCnt.frame = CGRectMake(120, 20, 70, 25);
    _maxCombo.frame = CGRectMake(190, 20, 130, 25);
    
    
    _timeStampLabel.frame = CGRectMake(50, 60, 110, 25);
    */
}



@end
