//
//  ChallengeRecordTableViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/07/26.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "FLDataManager.h"
#import "ChallengeRecordTableViewController.h"

@interface ChallengeRecordTableViewController ()

@end

@implementation ChallengeRecordTableViewController
@synthesize right_cnt;
@synthesize wrong_cnt;
@synthesize max_combo;
@synthesize point;
@synthesize total_point;
@synthesize rank;
@synthesize judge;


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

    self.title=@"結果発表";
    myTableView.delegate=self;
    myTableView.dataSource=self;
    
    
    
    [self.navigationItem setHidesBackButton:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(indexPath.row==0){
        cell.textLabel.text = [NSString stringWithFormat:@"正解: %d", right_cnt];
    }else if(indexPath.row==1){
        cell.textLabel.text = [NSString stringWithFormat:@"不正解: %d", wrong_cnt];
    }else if(indexPath.row==2){
        cell.textLabel.text = [NSString stringWithFormat:@"ポイント: %d", point];
    }else if(indexPath.row==3){
        cell.textLabel.text = [NSString stringWithFormat:@"判定: %@", judge];
    }
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (IBAction)btnReturnTop:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}




@end
