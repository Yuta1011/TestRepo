//
//  ChallengeCourseTableViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/07/23.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeCalculationViewController.h"
#import "Global.h"
#import "QBFlatButton.h"
#import "FUISegmentedControl.h"
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"


@interface ChallengeCourseTableViewController : UITableViewController
{
    
    IBOutlet FUISegmentedControl *speedSeg;
    
}


@property(nonatomic, assign)int digit;
@property(nonatomic, assign)int problem;
@property(nonatomic, assign)int speed;
@property(nonatomic, assign)int course_flg;

- (IBAction)speedSegChange:(id)sender;



@end
