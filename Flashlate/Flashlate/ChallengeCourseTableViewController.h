//
//  ChallengeCourseTableViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/07/23.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeCalculationViewController.h"

@interface ChallengeCourseTableViewController : UITableViewController
{
    
}


@property(nonatomic, assign)int digit;
@property(nonatomic, assign)int problem;
@property(nonatomic, assign)int speed;
@property(nonatomic, assign)int course_flg;

- (IBAction)speedSegChange:(id)sender;



@end
