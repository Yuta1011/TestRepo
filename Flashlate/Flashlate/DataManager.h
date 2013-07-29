//
//  DataManager.h
//  Flashlate
//
//  Created by yu-yu on 13/07/27.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataManager : NSObject
{
    NSManagedObjectContext* _managedObjectContext;
}

// プロパティ
@property (nonatomic, readonly) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, readonly) NSArray* sortedChannels;
@property (nonatomic, readonly) NSArray* sortedRecords;

@property (nonatomic, strong) NSString* str_point;

// 初期化
+ (DataManager*)sharedManager;

// 新規追加
- (void)insertNewJudge:(NSString *)judge
             withPoint:(NSInteger)point
             timeStamp:(NSData *)timeStamp;

// 永続化
- (void)save;

@end
