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
@synthesize restTime;
@synthesize rightCnt;
@synthesize wrongCnt;
@synthesize maxCombo;


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

    myTableView.rowHeight = 50.0;
    
    items = [[NSArray alloc]initWithObjects:@"1位", @"2位", @"3位", @"4位", @"5位", @"6位", @"7位", @"8位", @"9位", @"10位", nil];
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self changedSeg:nil];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    //return [FLDataManager sharedManager].getCount;
    return 10;
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

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor whiteColor];
    }else {
        cell.backgroundColor = RGB(236, 240, 241);
    }
    
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
    recordCell.rankLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    recordCell.rankLabel.textColor = rankColor;
    
    // judge
    UIColor *judgeColor;
    judge = record.judge;
    judgeColor = [UIColor blackColor];
    recordCell.judgeLabel.font = [UIFont fontWithName:@"Arial" size:18];
    recordCell.judgeLabel.textAlignment = NSTextAlignmentCenter;
    //recordCell.judgeLabel.text = judge;
    recordCell.judgeLabel.text = [NSString stringWithFormat:@"%@", judge];
    recordCell.judgeLabel.textColor = judgeColor;
    
    // judge_rank
    UIColor *judgeRankColor;
    judgeRankColor = [UIColor blackColor];
    recordCell.judgeRankLabel.text = [NSString stringWithFormat:@"rank."];
    recordCell.judgeRankLabel.textAlignment = NSTextAlignmentCenter;
    recordCell.judgeRankLabel.font = [UIFont fontWithName:@"Arial" size:15];
    recordCell.judgeRankLabel.textColor = judgeRankColor;
    
    // timeLabel
    UIColor *timeColor;
    timeColor = [UIColor blackColor];
    recordCell.timeLabel.text = [NSString stringWithFormat:@"Time:"];
    recordCell.timeLabel.font = [UIFont fontWithName:@"Arial" size:15];
    recordCell.timeLabel.textAlignment = NSTextAlignmentCenter;
    recordCell.timeLabel.textColor = timeColor;
    
    // restTime
    UIColor *restTimeColor;
    restTimeColor = [UIColor blackColor];
    restTime = record.restTime;
    recordCell.restTime.text = [NSString stringWithFormat:@"%@", restTime];
    recordCell.restTime.font = [UIFont fontWithName:@"Arial" size:18];
    recordCell.restTime.textAlignment = NSTextAlignmentCenter;
    recordCell.restTime.textColor = restTimeColor;
    
    /*
    // point
    UIColor *pointColor;
    point = [record.point intValue];
    pointColor = [UIColor blackColor];
    recordCell.pointLabel.font = [UIFont fontWithName:@"Arial" size:18];
    recordCell.pointLabel.textAlignment = NSTextAlignmentCenter;
    recordCell.pointLabel.text = [NSString stringWithFormat:@"%d pt.", point];
    recordCell.pointLabel.textColor = pointColor;
    */
    
    // pointをカンマ区切りに変更
    UIColor *pointColor;
    point = [record.point intValue];
    NSNumber *pointNumber = [[NSNumber alloc] initWithInt:point];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGroupingSeparator:@","];
    [formatter setGroupingSize:3];
    NSString *resultPoint = [formatter stringFromNumber:pointNumber];
    pointColor = [UIColor blackColor];
    recordCell.pointLabel.font = [UIFont fontWithName:@"Arial" size:18];
    recordCell.pointLabel.textAlignment = NSTextAlignmentCenter;
    recordCell.pointLabel.text = [NSString stringWithFormat:@"%@ pt.", resultPoint];
    recordCell.pointLabel.textColor = pointColor;
    
    // 日付
    UIColor *dataColor;
    timeStamp = record.timeStamp;
    // 年月を削除
    timeStamp = [timeStamp substringFromIndex:5];
    dataColor = [UIColor blackColor];
    recordCell.timeStampLabel.font = [UIFont fontWithName:@"Arial" size:18];
    recordCell.timeStampLabel.textAlignment = NSTextAlignmentCenter;
    recordCell.timeStampLabel.text = timeStamp;
    recordCell.timeStampLabel.text = [NSString stringWithFormat:@"日付:%@", timeStamp];
    recordCell.timeStampLabel.textColor = dataColor;
    
    // 正解
    UIColor *rightCntColor;
    rightCnt = [record.rightCnt intValue];
    rightCntColor = [UIColor blackColor];
    recordCell.rightCnt.font = [UIFont fontWithName:@"Arial" size:18];
    recordCell.rightCnt.textAlignment = NSTextAlignmentCenter;
    recordCell.rightCnt.text = [NSString stringWithFormat:@"正解:%d", rightCnt];
    recordCell.rightCnt.textColor = rightCntColor;
    
    // 不正解
    UIColor *wrongCntColor;
    wrongCnt = [record.wrongCnt intValue];
    wrongCntColor = [UIColor blackColor];
    recordCell.wrongCnt.font = [UIFont fontWithName:@"Arial" size:18];
    recordCell.wrongCnt.textAlignment = NSTextAlignmentCenter;
    recordCell.wrongCnt.text = [NSString stringWithFormat:@"不正解:%d", wrongCnt];
    recordCell.wrongCnt.textColor = wrongCntColor;
    
    // コンボ
    UIColor *maxComboColor;
    maxCombo = [record.maxCombo intValue];
    maxComboColor = [UIColor blackColor];
    recordCell.maxCombo.font = [UIFont fontWithName:@"Arial" size:18];
    recordCell.maxCombo.textAlignment = NSTextAlignmentCenter;
    recordCell.maxCombo.text = [NSString stringWithFormat:@"Maxコンボ:%d", maxCombo];
    recordCell.maxCombo.textColor = maxComboColor;
    
    
    // nullが一つでもあったら全体を非表示
    [self length];
    
    if(recordNull==1){
        recordCell.rankLabel.hidden=YES;
        recordCell.judgeLabel.hidden=YES;
        recordCell.pointLabel.hidden=YES;
        recordCell.timeStampLabel.hidden=YES;
        recordCell.restTime.hidden=YES;
        recordCell.maxCombo.hidden=YES;
        recordCell.rightCnt.hidden=YES;
        recordCell.wrongCnt.hidden=YES;
        recordCell.judgeRankLabel.hidden=YES;
        recordCell.timeLabel.hidden=YES;
    }else{
        recordCell.rankLabel.hidden=NO;
        recordCell.judgeLabel.hidden=NO;
        recordCell.pointLabel.hidden=NO;
        recordCell.timeStampLabel.hidden=NO;
        recordCell.restTime.hidden=NO;
        recordCell.maxCombo.hidden=NO;
        recordCell.rightCnt.hidden=NO;
        recordCell.wrongCnt.hidden=NO;
        recordCell.judgeRankLabel.hidden=NO;
        recordCell.timeLabel.hidden=NO;
    }
    
    NSLog(@"judge:%@, point:%d, timeStamp:%@", judge, point, timeStamp);
    
}

- (NSUInteger)length{
    if([judge length]==0 || point==0 || [timeStamp length]==0 || [restTime length]==0){
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
    [[FLDataManager sharedManager] selectedRecords:course_flg];
    
    
    //[self addMusic];
    
    // データの再読み込み
    [myTableView reloadData];
}

- (void)addMusic{
    NSString *bgmPath = [[NSBundle mainBundle]
                         pathForResource:@"menu_2" ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    bgm = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [bgm setNumberOfLoops:0]; // 0なら1回だけ。－1ならエンドレスリピート。
    [bgm play];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    RecordGraphViewController *recordGraph = [segue destinationViewController];
    
    recordGraph.course_flg=course_flg;

}


@end
