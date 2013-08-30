//
//  ChallengeSelectViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/08/21.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "ChallengeSelectViewController.h"

@interface ChallengeSelectViewController ()

@property (strong, nonatomic) IBOutlet QBFlatButton *btn_easy;
@property (strong, nonatomic) IBOutlet QBFlatButton *btn_normal;
@property (strong, nonatomic) IBOutlet QBFlatButton *btn_hard;
@property int point;

@property UIAlertView *alert;

- (IBAction)btnNormalPush:(id)sender;
- (IBAction)btnHardPush:(id)sender;


@end

@implementation ChallengeSelectViewController
@synthesize course_flg;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _btn_easy.faceColor = RGB(52, 152, 219);
    _btn_easy.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _btn_easy.radius = 15.0;
    _btn_easy.margin = 4.0;
    _btn_easy.depth = 10.0;
    
    _btn_normal.faceColor = RGB(52, 152, 219);
    _btn_normal.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _btn_normal.radius = 15.0;
    _btn_normal.margin = 4.0;
    _btn_normal.depth = 10.0;
    
    _btn_hard.faceColor = RGB(52, 152, 219);
    _btn_hard.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _btn_hard.radius = 15.0;
    _btn_hard.margin = 4.0;
    _btn_hard.depth = 10.0;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    // 隠しエリア出現設定(Normal)    
    NSArray*    records;
    FLRecord* record = nil;
    records = [[FLDataManager sharedManager] selectedRecords:1];
    
    if(1>=[records count]){
        [_btn_normal.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
        [_btn_normal setTitle:@"???" forState:UIControlStateNormal];
    }else{
        record = [records objectAtIndex:0];
        _point = [record.point intValue];
        
        if(_point > 200000) {
            [_btn_normal.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
            [_btn_normal setTitle:@"中級" forState:UIControlStateNormal];
        }else{
            [_btn_normal.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
            [_btn_normal setTitle:@"???" forState:UIControlStateNormal];
        }
    }
        
    // Hard        
    records = [[FLDataManager sharedManager] selectedRecords:2];
        
    if(1>=[records count]){
        [_btn_hard.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
        [_btn_hard setTitle:@"???" forState:UIControlStateNormal];
    }else{
        record = [records objectAtIndex:0];
        _point = [record.point intValue];
        
        if(_point > 500000) {
            [_btn_hard.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
            [_btn_hard setTitle:@"上級" forState:UIControlStateNormal];
        }else{
            [_btn_hard.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
            [_btn_hard setTitle:@"???" forState:UIControlStateNormal];
        }
    }

    NSLog(@"viewWillAppear");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnNormalPush:(id)sender {
    
    course_flg=1;
    
    NSArray*    records;
    FLRecord* record = nil;
    records = [[FLDataManager sharedManager] selectedRecords:course_flg];
    
    _alert = [[UIAlertView alloc] init];
    _alert.title = @"???";
    _alert.message = @"初級を300,000pt以上で\nクリアするとロック解除";
    [_alert addButtonWithTitle:@"OK"];
    
    if(1>=[records count]){
        [_alert show];
    }else{
        record = [records objectAtIndex:0];
        _point = [record.point intValue];
        if(_point > 300000) {
            [self performSegueWithIdentifier:@"Normal" sender:self];
        }else{
            [_alert show];
        }
    }
}

- (IBAction)btnHardPush:(id)sender {
    
    course_flg=2;
    
    NSArray*    records;
    FLRecord* record = nil;
    records = [[FLDataManager sharedManager] selectedRecords:course_flg];
    
    _alert = [[UIAlertView alloc] init];
    _alert.title = @"???";
    _alert.message = @"中級を500,000pt.以上で\nクリアするとロック解除";
    [_alert addButtonWithTitle:@"OK"];
    
    if(1>=[records count]){
        [_alert show];
    }else{
        record = [records objectAtIndex:0];
        _point = [record.point intValue];
        if(_point > 500000) {
            [self performSegueWithIdentifier:@"Hard" sender:self];
        }else{
            [_alert show];
        }
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    ChallengeCalculationViewController *challengeCalc = [segue destinationViewController];
    
    if ([[segue identifier] isEqualToString:@"Easy"]){
        challengeCalc.course_flg = 1;
    }else if ([[segue identifier] isEqualToString:@"Normal"]){
        challengeCalc.course_flg = 2;
    }else{
        challengeCalc.course_flg = 3;
    }
    
}




@end
