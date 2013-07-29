//
//  FreeSettingViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/07/20.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreeCalculationViewController.h"

@interface FreeSettingViewController : UIViewController
{
    
}


@property(nonatomic)int digit;
@property(nonatomic)int problem;
@property(nonatomic)int speed;

- (IBAction)digitSegChange:(id)sender;
- (IBAction)problemSegChange:(id)sender;
- (IBAction)speedSegChange:(id)sender;
- (IBAction)PushStart:(id)sender;




@end
