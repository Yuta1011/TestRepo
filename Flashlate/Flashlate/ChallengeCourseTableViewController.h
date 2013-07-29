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


@property(nonatomic)int digit;
@property(nonatomic)int problem;
@property(nonatomic)int speed;

- (IBAction)speedSegChange:(id)sender;



@end
