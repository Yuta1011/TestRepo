//
//  RecordCell.m
//  Flashlate
//
//  Created by yu-yu on 13/07/28.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "FLRecordCell.h"

@implementation FLRecordCell

// プロパティ
@synthesize rankLabel = _rankLabel;
@synthesize judgeLabel = _judgeLabel;
@synthesize pointLabel  =_pointLabel;
@synthesize timeStampLable = _timeStampLabel;


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
    _rankLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _rankLabel.textColor = [UIColor blackColor];
    _rankLabel.highlightedTextColor = [UIColor whiteColor];
    _rankLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_rankLabel];
    
    // judge
    _judgeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _judgeLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _judgeLabel.textColor = [UIColor blackColor];
    _judgeLabel.highlightedTextColor = [UIColor whiteColor];
    _judgeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_judgeLabel];
    
    // point
    _pointLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _pointLabel.font = [UIFont systemFontOfSize:16.0f];
    _pointLabel.textColor = [UIColor blackColor];
    _pointLabel.highlightedTextColor = [UIColor whiteColor];
    _pointLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_pointLabel];
    
    // timeStamp
    _timeStampLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _timeStampLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _timeStampLabel.textColor = [UIColor blackColor];
    _timeStampLabel.backgroundColor = [UIColor clearColor];
    _timeStampLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_timeStampLabel];
        
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
    
    _rankLabel.frame = CGRectMake(5, 25, 50, 20);
    _judgeLabel.frame = CGRectMake(70, 25, 30, 20);
    _pointLabel.frame = CGRectMake(110, 25, 100, 20);
    _timeStampLabel.frame = CGRectMake(200, 25, 120, 20);
    
}

@end
