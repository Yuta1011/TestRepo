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
    IBOutlet UISegmentedControl *seg;
    
}

@property (nonatomic, strong)NSString * str_point;



@end
