//
//  RecordTableViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/07/27.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "Record.h"
#import "RecordCell.h"
#import "DataManager.h"
#import "RecordTableViewController.h"

@interface RecordTableViewController ()

@end

@implementation RecordTableViewController
@synthesize str_point;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    // 親クラスのメソッドを呼び出す
    [super viewWillAppear:animated];
    
    // テーブルの行の数とチャンネルの数を比較する
    NSArray*    records;
    records = [DataManager sharedManager].sortedChannels;
    if ([myTableView numberOfRowsInSection:0] != [records count]) {
        // データの再読み込みを行う
        [myTableView reloadData];
        
        // 最後の行を表示する
        if ([records count] > 0) {
            NSIndexPath*    lastIndexPath;
            lastIndexPath = [NSIndexPath indexPathForRow:[records count] - 1 inSection:0];
            [myTableView scrollToRowAtIndexPath:lastIndexPath
                              atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        }
    }
    // データの再読み込みを行わない場合
    else {
        // 選択されているセルを解除する
        NSIndexPath*    indexPath;
        indexPath = [myTableView indexPathForSelectedRow];
        if (indexPath) {
            [myTableView deselectRowAtIndexPath:indexPath animated:YES];
        }
        
        // セルの表示更新を行う
        for (UITableViewCell* cell in [myTableView visibleCells]) {
            //[self _updateCell:cell atIndexPath:[myTableView indexPathForCell:cell]];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    myTableView.delegate = self;
    self.title = @"Record";
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    
    if(section == 0) {
        return 1; // 1個目のセクションのセルは3個とします
    }else{
        return 1; // 2個目のセクションのセルは4個とします
        //return [[DataManager sharedManager].sortedRecords count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    str_point = [DataManager sharedManager].sortedRecords;
    if(indexPath.section == 0) {
        if(indexPath.row==0){
            
        }else{
            
        }
    }else if (indexPath.section == 1){
        if(indexPath.row==1){
            cell.textLabel.text = [NSString stringWithFormat:@"ポイント: %@", str_point];
        }
    }
    */

    // セルを取得する
    RecordCell* cell;
    cell = (RecordCell*)[myTableView dequeueReusableCellWithIdentifier:@"RecordCell"];
    if (!cell) {
        cell = [[RecordCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"RecordCell"];
    }
    
    if(indexPath.section == 0) {
        if(indexPath.row==0){
            // segment
            NSArray * items = [NSArray arrayWithObjects:@"初級", @"中級", @"上級", nil];
            UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:items];
            segment.selectedSegmentIndex=0;
            segment.frame = CGRectMake(20, 5, 260, 35);
            [segment addTarget:self action:@selector(segmentDidChange) forControlEvents:UIControlEventValueChanged];
            [cell.contentView addSubview:segment];
        }else if(indexPath.row==1){
            // ランク・判定・ポイント・日付
            UILabel *rank_lbl = [[UILabel alloc] initWithFrame:CGRectMake(10,12,60,20)];
            rank_lbl.font = [UIFont fontWithName:@"Helvetica" size:20];
            rank_lbl.textColor = [UIColor blackColor];
            rank_lbl.textAlignment = NSTextAlignmentCenter;
            rank_lbl.text = @"ランク";
            [cell.contentView addSubview:rank_lbl];
            
            UILabel *judge_lbl = [[UILabel alloc] initWithFrame:CGRectMake(90,12,40,20)];
            judge_lbl.font = [UIFont fontWithName:@"Helvetica" size:20];
            judge_lbl.textColor = [UIColor blackColor];
            judge_lbl.textAlignment = NSTextAlignmentCenter;
            judge_lbl.text = @"判定";
            [cell.contentView addSubview:judge_lbl];
            
            UILabel *point_lbl = [[UILabel alloc] initWithFrame:CGRectMake(150,12,80,20)];
            point_lbl.font = [UIFont fontWithName:@"Helvetica" size:20];
            point_lbl.textColor = [UIColor blackColor];
            point_lbl.textAlignment = NSTextAlignmentCenter;
            point_lbl.text = @"ポイント";
            [cell.contentView addSubview:point_lbl];
            
            UILabel *timeStamp_lbl = [[UILabel alloc] initWithFrame:CGRectMake(240,12,40,20)];
            timeStamp_lbl.font = [UIFont fontWithName:@"Helvetica" size:20];
            timeStamp_lbl.textColor = [UIColor blackColor];
            timeStamp_lbl.textAlignment = NSTextAlignmentCenter;
            timeStamp_lbl.text = @"日付";
            [cell.contentView addSubview:timeStamp_lbl];
            
        }
    }else if (indexPath.section == 1){
        // セルの値を更新する
        [self _updateCell:cell atIndexPath:indexPath];
    }    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)segmentDidChange {
    NSLog(@"準備中");
}

//--------------------------------------------------------------//
#pragma mark -- 画面の更新 --
//--------------------------------------------------------------//

- (void)_updateCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath
{
    // セルのキャスト
    RecordCell* recordCell;
    recordCell = (RecordCell*)cell;
    
    // 指定された行のチャンネルの取得
    NSArray*    records;
    Record* record = nil;
    records = [DataManager sharedManager].sortedRecords;
    if (indexPath.row < [records count]) {
        record = [records objectAtIndex:indexPath.row];
    }
    
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    int point = [ud integerForKey:@"point"];
    NSString *judge = [ud stringForKey:@"judge"];
    NSString *str_timeStamp = [ud stringForKey:@"timeStamp"];
    
    NSString *timeStamp = [str_timeStamp substringToIndex:10];
    
    
    // rankの設定
    NSString *rank;
    UIColor *rankColor;
    rank = @"1位";
    rankColor = [UIColor blackColor];
    recordCell.rankLabel.text = [NSString stringWithFormat:@"%@", rank];
    recordCell.rankLabel.textAlignment = NSTextAlignmentCenter;
    recordCell.rankLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    recordCell.rankLabel.textColor = rankColor;
     
    // judgeの設定
    UIColor *judgeColor;
    judgeColor = [UIColor blackColor];
    recordCell.judgeLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    recordCell.judgeLabel.textAlignment = NSTextAlignmentCenter;
    recordCell.judgeLabel.text = [NSString stringWithFormat:@"%@", judge];
    recordCell.judgeLabel.textColor = judgeColor;
    
    // pointの設定
    UIColor *pointColor;
    pointColor = [UIColor blackColor];
    recordCell.pointLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    recordCell.pointLabel.textAlignment = NSTextAlignmentCenter;
    recordCell.pointLabel.text = [NSString stringWithFormat:@"%d", point];
    recordCell.pointLabel.textColor = pointColor;
    
    // 日付の設定
    UIColor *dataColor;
    dataColor = [UIColor blackColor];
    recordCell.timeStampLable.font = [UIFont fontWithName:@"Helvetica" size:20];
    recordCell.timeStampLable.text = [NSString stringWithFormat:@"%@", timeStamp];
    recordCell.timeStampLable.textAlignment = NSTextAlignmentCenter;
    recordCell.timeStampLable.textColor = dataColor;
    
}




@end
