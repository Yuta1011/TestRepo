//
//  RecordTableViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/07/27.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    IBOutlet UITableView *myTableView;
    //IBOutlet UISegmentedControl *seg;
    
}

@property (nonatomic, strong)NSString *judge;
@property (nonatomic, strong)NSNumber *set_point;
@property (nonatomic, assign)int point;
@property (nonatomic, strong)NSString * str_point;
@property (nonatomic, strong)NSString *timeStamp;
@property (nonatomic, strong)NSString *set_timeStamp;
@property (nonatomic, assign)int rank;
@property (nonatomic, assign)int course_flg;
@property (nonatomic, strong)NSArray *items;
@property (nonatomic, assign)NSInteger recordNull;

- (IBAction)changedSeg:(id)sender;



@end
