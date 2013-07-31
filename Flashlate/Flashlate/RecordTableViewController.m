//
//  RecordTableViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/07/27.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "FLRecord.h"
#import "FLRecordCell.h"
#import "FLDataManager.h"
#import "RecordTableViewController.h"

@interface RecordTableViewController ()

@end

@implementation RecordTableViewController
@synthesize str_point;
@synthesize judge;
@synthesize point;
@synthesize timeStamp;
@synthesize rank;
@synthesize set_point;
@synthesize set_timeStamp;
@synthesize items;
@synthesize course_flg;
@synthesize recordNull;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    course_flg=1;
    rank=1;

    items = [[NSArray alloc]initWithObjects:@"1位", @"2位", @"3位", @"4位", @"5位", @"6位", @"7位", @"8位", @"9位", @"10位", nil];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    for (int i=0; i<[FLDataManager sharedManager].getCount; i++) {
        rank++;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [FLDataManager sharedManager].getCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // セルを取得する
    FLRecordCell* cell;
    cell = (FLRecordCell*)[myTableView dequeueReusableCellWithIdentifier:@"RecordCell"];
    if (!cell) {
        cell = [[FLRecordCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"RecordCell"];
    }
    
    [self _updateCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


//--------------------------------------------------------------//
#pragma mark -- 画面の更新 --
//--------------------------------------------------------------//

- (void)_updateCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath
{
    // セルのキャスト
    FLRecordCell* recordCell;
    recordCell = (FLRecordCell*)cell;
    
    NSArray*    records;
    FLRecord* record = nil;
    records = [[FLDataManager sharedManager] selectedRecords:course_flg];
    if (indexPath.row < [records count]) {
        record = [records objectAtIndex:indexPath.row];
    }
    
    // rank
    UIColor *rankColor;
    //rank=1;
    rankColor = [UIColor blackColor];
    //recordCell.rankLabel.text = [NSString stringWithFormat:@"%d位", rank];
    recordCell.rankLabel.text = [items objectAtIndex:indexPath.row];
    recordCell.rankLabel.textAlignment = NSTextAlignmentCenter;
    recordCell.rankLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    recordCell.rankLabel.textColor = rankColor;
    
    // judge
    UIColor *judgeColor;
    judge = record.judge;
    judgeColor = [UIColor blackColor];
    recordCell.judgeLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    recordCell.judgeLabel.textAlignment = NSTextAlignmentCenter;
    recordCell.judgeLabel.text = judge;
    recordCell.judgeLabel.textColor = judgeColor;
    
    // point
    UIColor *pointColor;
    point = [record.point intValue];
    pointColor = [UIColor blackColor];
    recordCell.pointLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    recordCell.pointLabel.textAlignment = NSTextAlignmentCenter;
    recordCell.pointLabel.text = [NSString stringWithFormat:@"%d pt.", point];
    recordCell.pointLabel.textColor = pointColor;
    
    // 日付
    UIColor *dataColor;
    timeStamp = record.timeStamp;
    dataColor = [UIColor blackColor];
    recordCell.timeStampLable.font = [UIFont fontWithName:@"Helvetica" size:15];
    recordCell.timeStampLable.textAlignment = NSTextAlignmentCenter;
    recordCell.timeStampLable.text = timeStamp;
    recordCell.timeStampLable.textColor = dataColor;
    
    
    // nullが一つでもあったら全体を非表示
    [self length];
    if(recordNull==1){
        recordCell.rankLabel.hidden=YES;
        recordCell.judgeLabel.hidden=YES;
        recordCell.pointLabel.hidden=YES;
        recordCell.timeStampLable.hidden=YES;
    }else{
        recordCell.rankLabel.hidden=NO;
        recordCell.judgeLabel.hidden=NO;
        recordCell.pointLabel.hidden=NO;
        recordCell.timeStampLable.hidden=NO;
    }
    
    NSLog(@"judge:%@, point:%d, timeStamp:%@", judge, point, timeStamp);
    
}

- (NSUInteger)length{
    if([judge length] == 0 || point == 0 || [timeStamp length] == 0){
        NSLog(@"null");
        recordNull = 1;
    }else{
        recordNull = 2;
    }
    return recordNull;
}

// seg変更時
- (IBAction)changedSeg:(id)sender {
    
    if([sender isKindOfClass:[UISegmentedControl class]]){
        UISegmentedControl *seg = sender;
        if(0==seg.selectedSegmentIndex){
            course_flg=1;
        }else if(1==seg.selectedSegmentIndex){
            course_flg=2;
        }else if(2==seg.selectedSegmentIndex){
            course_flg=3;
        }
    }
    NSLog(@"segChanged:%d", course_flg);
    [[FLDataManager sharedManager] selectedRecords:course_flg];
    
    // データの再読み込み
    [myTableView reloadData];
}






@end
