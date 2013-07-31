
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
    /*
    NSManagedObjectContext *moc = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *d = [NSEntityDescription entityForName:@"Record" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:d];
    
    NSError *error = nil;
    NSArray *list = [moc executeFetchRequest:fetchRequest error:&error];
    
    //ソート対象となるキーを指定した、NSSortDescriptorの生成
    NSSortDescriptor *sortDescString;
    sortDescString = [[NSSortDescriptor alloc] initWithKey:@"point" ascending:NO];
    
    NSArray *sortDescArray;
    sortDescArray = [NSArray arrayWithObjects:sortDescString, nil];
    
    // ソートの実行
    NSArray *items;
    items = [list sortedArrayUsingDescriptors:sortDescArray];
     
    return items;
    */
    
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
    /*
    for (int i = 0; i < items.count; i++) {
        NSManagedObject *object = [items objectAtIndex:i];
        NSString *key   = [object valueForKey:@"key"];
        NSString *value = [object valueForKey:@"value"];
        NSLog(@"key=%@, value=%@", key, value);
    }
    */
    return  items;


}

// countを返す
-(NSInteger)getCount
{
    NSManagedObjectContext *moc = [self managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *d = [NSEntityDescription entityForName:@"Record" inManagedObjectContext:_managedObjectContext];
    [request setEntity:d];
    
    NSError *error = nil;
    NSInteger count = [moc countForFetchRequest:request error:&error];
    
    return count;
}

//--------------------------------------------------------------//
#pragma mark -- データの新規追加--
//--------------------------------------------------------------//

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
