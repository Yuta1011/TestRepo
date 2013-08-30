//
//  RecordGraphViewController.m
//  Flashlate
//
//  Created by yu-yu on 13/08/22.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import "RecordGraphViewController.h"

@interface RecordGraphViewController ()
- (IBAction)segDidChange:(id)sender;

@end

@implementation RecordGraphViewController
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
    course_flg=1;
    
    CGRect graphRect = CGRectMake(0, 0, 360, 365);
	graphView = [[S7GraphView alloc] initWithFrame:graphRect];
	graphView.dataSource = self;
	[self.view addSubview:graphView];
	[graphView reloadData];
    
    graphView.backgroundColor = [UIColor clearColor];
	graphView.drawAxisX = YES;
	graphView.drawAxisY = YES;
	graphView.drawGridX = YES;
	graphView.drawGridY = YES;
    
    graphView.gridXColor = RGB(231, 76, 60);
    graphView.gridYColor = RGB(231, 76, 60);
    
    
}

- (NSUInteger)graphViewNumberOfPlots:(S7GraphView *)graphView {
	return 1;
}

- (NSArray *)graphViewXValues:(S7GraphView *)graphView {
    
    array = [[NSMutableArray alloc] initWithCapacity:256];
    
    // 一週間の日付を表示
    for(int i=-6;i<=0;i++){
        NSDateComponents *dateComp = [[NSDateComponents alloc] init];
        [dateComp setDay:i];
        NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComp toDate:[NSDate date] options:0];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM/dd mm:ss"];
        NSString *dateStr = [formatter stringFromDate:date];
        dateStr = [dateStr substringToIndex:5];
        
        [array addObject:dateStr];
    }
    return array;
}

- (NSArray *)graphView:(S7GraphView *)graphView yValuesForPlot:(NSUInteger)plotIndex {
    
    array = [[NSMutableArray alloc] initWithCapacity:256];
    NSArray* record = nil;
    NSArray* records;
    records = [[FLDataManager sharedManager] selectedTimeRecords:course_flg];

    for(int i=0;i<7;i++){
        record = [records objectAtIndex:i];
        for(NSDictionary *d in record){
            if([d objectForKey:@"point"] == nil){
                [array addObject:@"0"];
            }else{
                [array addObject:[d objectForKey:@"point"]];
            }
        }
    }
	return array;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segDidChange:(id)sender {
    
    if([sender isKindOfClass:[UISegmentedControl class]]){
        UISegmentedControl *seg = sender;
        if(0==seg.selectedSegmentIndex){
            course_flg=1;
        }else if(1==seg.selectedSegmentIndex){
            course_flg=2;
        }else if(2==seg.selectedSegmentIndex){
            course_flg=3;
        }
    }
    [graphView reloadData];
}



@end
