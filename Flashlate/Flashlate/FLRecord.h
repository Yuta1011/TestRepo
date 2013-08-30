//
//  Record.h
//  Flashlate
//
//  Created by yu-yu on 13/07/27.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface FLRecord : NSManagedObject

@property (nonatomic, retain) NSNumber * point;
@property (nonatomic, retain) NSNumber * course_flg;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSString * timeStamp;
@property (nonatomic, retain) NSString * judge;
@property (nonatomic, retain) NSString * restTime;
@property (nonatomic, retain) NSNumber * rightCnt;
@property (nonatomic, retain) NSNumber * wrongCnt;
@property (nonatomic, retain) NSNumber * maxCombo;







@end
