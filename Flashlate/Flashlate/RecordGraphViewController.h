//
//  RecordGraphViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/08/22.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "S7GraphView.h"
#import "FLDataManager.h"
#import "FLRecordCell.h"
#import "FLRecord.h"

@interface RecordGraphViewController : UIViewController<S7GraphViewDataSource>
{
    
    S7GraphView *graphView;
    NSMutableArray *array;
    NSDate *date;
    

    NSString *timeDate;
    NSString *timeStamp;
    
    
}

@property int course_flg;




@end
