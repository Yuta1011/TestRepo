
#import "FLDataManager.h"

@implementation FLDataManager
//--------------------------------------------------------------//
#pragma mark -- 初期化 --
//--------------------------------------------------------------//

static FLDataManager*  _sharedInstance = nil;

+ (FLDataManager*)sharedManager
{
    // インスタンスを作成する
    if (!_sharedInstance) {
        _sharedInstance = [[FLDataManager alloc] init];
    }
    
    return _sharedInstance;
}

//--------------------------------------------------------------//
#pragma mark -- プロパティ --
//--------------------------------------------------------------//

- (NSManagedObjectContext*)managedObjectContext
{
    NSError*    error;
    
    // インスタンス変数のチェック
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    // 管理対象オブジェクトモデルの作成
    NSManagedObjectModel*   managedObjectModel;
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    // 永続ストアコーディネータの作成
    NSPersistentStoreCoordinator*   persistentStoreCoordinator;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                  initWithManagedObjectModel:managedObjectModel];
    
    // 保存ファイルの決定
    NSArray*    paths;
    NSString*   path = nil;
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0) {
        path = [paths objectAtIndex:0];
        path = [path stringByAppendingPathComponent:@".fl"];
        path = [path stringByAppendingPathComponent:@"fl.db"];
    }
    
    if (!path) {
        return nil;
    }
    
    // ディレクトリの作成
    NSString*       dirPath;
    NSFileManager*  fileMgr;
    dirPath = [path stringByDeletingLastPathComponent];
    fileMgr = [NSFileManager defaultManager];
    if (![fileMgr fileExistsAtPath:dirPath]) {
        if (![fileMgr createDirectoryAtPath:dirPath
                withIntermediateDirectories:YES attributes:nil error:&error])
        {
            NSLog(@"Failed to create directory at path %@, erro %@",
                  dirPath, [error localizedDescription]);
        }
    }
    
    // ストアURLの作成
    NSURL*  url = nil;
    url = [NSURL fileURLWithPath:path];
    
    // 永続ストアの追加
    NSPersistentStore*  persistentStore;
    persistentStore = [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                               configuration:nil URL:url options:nil error:&error];
    if (!persistentStore && error) {
        NSLog(@"Failed to create add persitent store, %@", [error localizedDescription]);
    }
    
    // 管理対象オブジェクトコンテキストの作成
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    
    // 永続ストアコーディネータの設定
    [_managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
    
    return _managedObjectContext;
}

-(NSArray *)selectedRecords:(int)course_flg
{
    
    _managedObjectContext = self.managedObjectContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // 検索対象のエンティティを指定します。
    NSEntityDescription *entity
    = [NSEntityDescription entityForName:@"Record" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // 一度に読み込むサイズを指定します。
    [fetchRequest setFetchBatchSize:20];
    
    // 検索結果を保持する順序を指定します。
    // ここでは、keyというカラムの値の昇順で保持するように指定しています。
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"point" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    // 検索条件の指定
    if(course_flg==1){
        NSPredicate *pred
        = [NSPredicate predicateWithFormat:@"course_flg = 1"];
        [fetchRequest setPredicate:pred];
    }else if (course_flg==2){
        NSPredicate *pred
        = [NSPredicate predicateWithFormat:@"course_flg = 2"];
        [fetchRequest setPredicate:pred];
    }else if (course_flg==3){
        NSPredicate *pred
        = [NSPredicate predicateWithFormat:@"course_flg = 3"];
        [fetchRequest setPredicate:pred];
    }
    
    // NSFetchedResultsControllerを作成します。
    // 上記までで作成したFetchRequestを指定します。
    NSFetchedResultsController *fetchedResultsController
    = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                          managedObjectContext:_managedObjectContext
                                            sectionNameKeyPath:nil
                                                     cacheName:nil];
    
    // データ検索を行います。
    // 失敗した場合には、メソッドはfalseを返し、引数errorに値を詰めてくれます。
    NSError *error = nil;
    if (![fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }else{
        NSLog(@"success!!");
    }
    
    NSArray *items = [fetchedResultsController fetchedObjects];
    NSLog(@"item:%@", items);
    
    return  items;

}

-(NSArray *)selectedTimeRecords:(int)course_flg
{
    
    _managedObjectContext = self.managedObjectContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // 検索対象のエンティティを指定します。
    NSEntityDescription *entity
    = [NSEntityDescription entityForName:@"Record" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // 一度に読み込むサイズを指定します。
    [fetchRequest setFetchBatchSize:20];
    
    
    // 検索結果を保持する順序を指定します。
    // ここでは、keyというカラムの値の昇順で保持するように指定しています。
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];    
    
    NSExpression *keyPathExpression = [NSExpression expressionForKeyPath:@"point"];
    NSExpression *expression =
    [NSExpression expressionForFunction:@"max:"
                              arguments:[NSArray arrayWithObject:keyPathExpression]];
    
    
    NSExpressionDescription *expressionDescription = [[NSExpressionDescription alloc] init];
    [expressionDescription setName:@"point"];
    [expressionDescription setExpression:expression];

    // result properties
    [fetchRequest setResultType:NSDictionaryResultType];
    [fetchRequest setPropertiesToFetch:[NSArray arrayWithObject:expressionDescription]];
    
    NSError* error = nil;
    NSArray* array = nil;
    
    // 1週間の記録を表示
    NSPredicate *time0, *time1, *time2, *time3, *time4, *time5, *time6;
    
    date = [NSDate dateWithTimeIntervalSinceNow:0.0f]; // 現在の時刻
    timeDate = [date description];
    timeDate = [timeDate substringToIndex:10];
    time0 = [NSPredicate predicateWithFormat:@"timeStamp = %@ AND course_flg = %d", timeDate, course_flg];
    [fetchRequest setPredicate:time0];
    
    NSArray *array0 = nil ;
    array0 = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    date = [NSDate dateWithTimeIntervalSinceNow:-1*24*60*60];
    timeDate = [date description];
    timeDate = [timeDate substringToIndex:10];
    time1 = [NSPredicate predicateWithFormat:@"timeStamp = %@ AND course_flg = %d", timeDate, course_flg];
    [fetchRequest setPredicate:time1];
    
    NSArray *array1 = nil ;
    array1 = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
     
    date = [NSDate dateWithTimeIntervalSinceNow:-2*24*60*60];
    timeDate = [date description];
    timeDate = [timeDate substringToIndex:10];
    time2 = [NSPredicate predicateWithFormat:@"timeStamp = %@ AND course_flg = %d", timeDate, course_flg];
    [fetchRequest setPredicate:time2];
    
    NSArray *array2 = nil ;
    array2 = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
     
    date = [NSDate dateWithTimeIntervalSinceNow:-3*24*60*60];
    timeDate = [date description];
    timeDate = [timeDate substringToIndex:10];
    time3 = [NSPredicate predicateWithFormat:@"timeStamp = %@ AND course_flg = %d", timeDate, course_flg];
    [fetchRequest setPredicate:time3];
    
    NSArray *array3 = nil ;
    array3 = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
     
    date = [NSDate dateWithTimeIntervalSinceNow:-4*24*60*60];
    timeDate = [date description];
    timeDate = [timeDate substringToIndex:10];
    time4 = [NSPredicate predicateWithFormat:@"timeStamp = %@ AND course_flg = %d", timeDate, course_flg];
    [fetchRequest setPredicate:time4];
    
    NSArray *array4 = nil ;
    array4 = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];

    date = [NSDate dateWithTimeIntervalSinceNow:-5*24*60*60];
    timeDate = [date description];
    timeDate = [timeDate substringToIndex:10];
    time5 = [NSPredicate predicateWithFormat:@"timeStamp = %@ AND course_flg = %d", timeDate, course_flg];
    [fetchRequest setPredicate:time5];
    
    NSArray *array5 = nil ;
    array5 = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    date = [NSDate dateWithTimeIntervalSinceNow:-6*24*60*60];
    timeDate = [date description];
    timeDate = [timeDate substringToIndex:10];
    time6 = [NSPredicate predicateWithFormat:@"timeStamp = %@ AND course_flg = %d", timeDate, course_flg];
    [fetchRequest setPredicate:time6];
    
    
    NSArray *array6 = nil ;
    array6 = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
     
    
    array = [NSArray arrayWithObjects:array6, array5, array4, array3, array2, array1, array0, nil];    
    
    if (error) {
        NSLog(@"[ERROR] %@", error);
    } else {
        NSLog(@"array:%@", array);
    }   
    
    return array;
    
}

// countを返す
-(NSInteger)getCount
{
    _managedObjectContext = [self managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *d = [NSEntityDescription entityForName:@"Record" inManagedObjectContext:_managedObjectContext];
    [request setEntity:d];
    
    NSError *error = nil;
    NSInteger count = [_managedObjectContext countForFetchRequest:request error:&error];
    
    return count;
}

//--------------------------------------------------------------//
#pragma mark -- データの新規追加--
//--------------------------------------------------------------//
/*
-(void)insertJudge:(NSString *)judge point:(int)point timeStamp:(NSString*)timeStamp course_flg:(int)course_flg
{
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Record" inManagedObjectContext:context];
    
    [newManagedObject setValue:judge forKey:@"judge"];
    [newManagedObject setValue:[NSNumber numberWithInt:point] forKey:@"point"];
    [newManagedObject setValue:[NSNumber numberWithInt:course_flg] forKey:@"course_flg"];
    [newManagedObject setValue:timeStamp forKey:@"timeStamp"];
    
    
    NSError*    error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error, %@", error);
    }else{
        NSLog(@"save!!");
    }
}
*/

-(void)insertJudge:(NSString*)judge point:(int)point timeStamp:(NSString*)timeStamp course_flg:(int)course_flg restTime:(NSString*)restTime rightCnt:(int)rightCnt wrongCnt:(int)wrongCnt maxCombo:(int)maxCombo
{
    
    /*
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Record" inManagedObjectContext:context];
    */
    _managedObjectContext = [self managedObjectContext];
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Record" inManagedObjectContext:_managedObjectContext];
     
    [newManagedObject setValue:[NSNumber numberWithInt:point] forKey:@"point"];
    [newManagedObject setValue:[NSNumber numberWithInt:course_flg] forKey:@"course_flg"];
    [newManagedObject setValue:[NSNumber numberWithInt:rightCnt] forKey:@"rightCnt"];
    [newManagedObject setValue:[NSNumber numberWithInt:wrongCnt] forKey:@"wrongCnt"];
    [newManagedObject setValue:[NSNumber numberWithInt:maxCombo] forKey:@"maxCombo"];
    [newManagedObject setValue:judge forKey:@"judge"];
    [newManagedObject setValue:timeStamp forKey:@"timeStamp"];
    [newManagedObject setValue:restTime forKey:@"restTime"];
    
    NSLog(@"restTime:%@, rightCnt:%d, wrongCnt:%d, maxCombo:%d", restTime, rightCnt, wrongCnt, maxCombo);
    
    NSError*    error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error, %@", error);
    }else{
        NSLog(@"Save.");
    }
}


//--------------------------------------------------------------//
#pragma mark -- 永続化 --
//--------------------------------------------------------------//

- (void)save
{
    // 保存
    NSError*    error;
    if (![self.managedObjectContext save:&error]) {
        // エラー
        NSLog(@"Error, %@", error);
    }
}

@end
