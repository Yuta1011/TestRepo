//
//  FreeCalculationViewController.h
//  Flashlate
//
//  Created by yu-yu on 13/07/20.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreeAnswerViewController.h"

@interface FreeCalculationViewController : UIViewController
{
    NSTimer *timer;
    
    
}


@property (strong, nonatomic) IBOutlet UILabel *num_lbl;
@property(nonatomic)NSInteger digit;
@property(nonatomic)NSInteger problem;
@property(nonatomic)int speed;
@property(nonatomic)int count;
@property(nonatomic)int num;
@property(nonatomic)int sum;
@property(nonatomic)BOOL timeflg;
@property(nonatomic)BOOL startInput;
@property(nonatomic)int chk_num;    // 重複チェック

- (void)startDidPush;
- (void)DidStart;
- (void)onTimer:(NSTimer*)timer;


@end