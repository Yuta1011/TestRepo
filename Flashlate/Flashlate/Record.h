//
//  Record.h
//  Flashlate
//
//  Created by yu-yu on 13/07/27.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Record : NSManagedObject

@property (nonatomic, retain) NSNumber * point;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSData * timeStamp;
@property (nonatomic, retain) NSString * judge;






@end
