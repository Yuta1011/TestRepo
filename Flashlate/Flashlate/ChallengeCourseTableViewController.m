//
//  ChallengeCourseTableViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/07/23.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "ChallengeCourseTableViewController.h"

@interface ChallengeCourseTableViewController ()

@end

@implementation ChallengeCourseTableViewController
@synthesize digit;
@synthesize problem;
@synthesize speed;
@synthesize course_flg;

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
    speed = 10;
    
    // speedSegカスタマイズ
    speedSeg.selectedFontColor = [UIColor cloudsColor];
    speedSeg.deselectedFontColor = [UIColor blackColor];
    speedSeg.selectedColor = [UIColor orangeColor];
    speedSeg.deselectedColor = [UIColor cloudsColor];
    speedSeg.dividerColor = [UIColor midnightBlueColor];
    speedSeg.cornerRadius = 5.0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)speedSegChange:(id)sender {
    
    if([sender isKindOfClass:[UISegmentedControl class]]){
        UISegmentedControl *seg = sender;
        if(0==seg.selectedSegmentIndex){
            speed = 15;
        }else if(1==seg.selectedSegmentIndex){
            speed = 10;
        }else if(2==seg.selectedSegmentIndex){
            speed = 5;
        }
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    ChallengeCalculationViewController *CCalculationViewController = [segue destinationViewController];
    
    if ([segue.identifier isEqualToString:@"1-1"]){
        CCalculationViewController.speed = speed;
        CCalculationViewController.digit = 1;
        CCalculationViewController.problem = 5;
        CCalculationViewController.course_flg = 1;
    }else if ([segue.identifier isEqualToString:@"1-2"]){
        CCalculationViewController.speed = speed;
        CCalculationViewController.digit = 1;
        CCalculationViewController.problem = 7;
        CCalculationViewController.course_flg = 1;
    }else if ([segue.identifier isEqualToString:@"1-3"]){
        CCalculationViewController.speed = speed;
        CCalculationViewController.digit = 1;
        CCalculationViewController.problem = 10;
        CCalculationViewController.course_flg = 1;
    }else if ([segue.identifier isEqualToString:@"2-1"]){
        CCalculationViewController.speed = speed;
        CCalculationViewController.digit = 2;
        CCalculationViewController.problem = 5;
        CCalculationViewController.course_flg = 2;
    }else if ([segue.identifier isEqualToString:@"2-2"]){
        CCalculationViewController.speed = speed;
        CCalculationViewController.digit = 2;
        CCalculationViewController.problem = 7;
        CCalculationViewController.course_flg = 2;
    }else if ([segue.identifier isEqualToString:@"2-3"]){
        CCalculationViewController.speed = speed;
        CCalculationViewController.digit = 2;
        CCalculationViewController.problem = 10;
        CCalculationViewController.course_flg = 2;
    }else if ([segue.identifier isEqualToString:@"3-1"]){
        CCalculationViewController.speed = speed;
        CCalculationViewController.digit = 3;
        CCalculationViewController.problem = 5;
        CCalculationViewController.course_flg = 3;
    }else if ([segue.identifier isEqualToString:@"3-2"]){
        CCalculationViewController.speed = speed;
        CCalculationViewController.digit = 3;
        CCalculationViewController.problem = 7;
        CCalculationViewController.course_flg = 3;
    }else if ([segue.identifier isEqualToString:@"3-3"]){
        CCalculationViewController.speed = speed;
        CCalculationViewController.digit = 3;
        CCalculationViewController.problem = 10;
        CCalculationViewController.course_flg = 3;
    }
}




@end
