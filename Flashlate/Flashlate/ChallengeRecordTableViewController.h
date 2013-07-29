//
//  ChallengeRecordTableViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/07/26.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Record;


@interface ChallengeRecordTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>{
    
    Record *_record;
    
    IBOutlet UITableView *myTableView;
    
    
}




@property(nonatomic)int right_cnt;
@property(nonatomic)int wrong_cnt;
@property(nonatomic)int max_combo;
@property(nonatomic)int point;
@property(nonatomic)int total_point;
@property(nonatomic)int rank;
@property(nonatomic, strong)NSString *judge;

- (IBAction)btnReturnTop:(id)sender;

@end
