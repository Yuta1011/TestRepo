//
//  FLDataManager.h
//  Flashlate
//
//  Created by yu-yu on 13/07/27.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface FLDataManager : NSObject
{
    NSManagedObjectContext* _managedObjectContext;
}

// プロパティ
@property (nonatomic, readonly) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, readonly) NSArray* sortedChannels;
@property (nonatomic, readonly) NSArray* sortedRecords;

// 初期化
+ (FLDataManager*)sharedManager;

// 新規追加&保存
-(void)insertJudge:(NSString *)judge point:(int)point timeStamp:(NSString*)timeStamp course_flg:(int)course_flg;

//　データの取得
-(NSArray *)selectedRecords:(int)course_flg;

// カウント
-(NSInteger)getCount;


// 永続化
- (void)save;




@end
