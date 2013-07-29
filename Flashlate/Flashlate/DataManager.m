
#import "DataManager.h"

@implementation DataManager
@synthesize str_point;
//--------------------------------------------------------------//
#pragma mark -- 初期化 --
//--------------------------------------------------------------//

static DataManager*  _sharedInstance = nil;

+ (DataManager*)sharedManager
{
    // インスタンスを作成する
    if (!_sharedInstance) {
        _sharedInstance = [[DataManager alloc] init];
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

- (NSArray*)sortedRecords
{
    // 管理対象オブジェクトコンテキストを取得する
    NSManagedObjectContext* context;
    context = self.managedObjectContext;
    
    // 取得要求を作成する
    NSFetchRequest*         request;
    NSEntityDescription*    entity;
    NSSortDescriptor*       sortDescriptor;
    request = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:@"Record" inManagedObjectContext:context];
    [request setEntity:entity];
    // pointを昇順で表示
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"point" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    // 取得要求を実行する
    NSArray*    result;
    NSError*    error = nil;
    result = [context executeFetchRequest:request error:&error];
    if (!result) {
        NSLog(@"executeFetchRequest: failed, %@", [error localizedDescription]);
        
        return nil;
    }
    
    return result;

}

//--------------------------------------------------------------//
#pragma mark -- データの新規追加--
//--------------------------------------------------------------//

- (void)insertNewJudge:(NSString *)judge
				withPoint:(NSInteger)point
                    timeStamp:(NSData *)timeStamp
{
    
    // insert用の新しい NSManagedObject を作成する。
    NSManagedObject* newObject;
    newObject = [NSEntityDescription insertNewObjectForEntityForName:@"Record" inManagedObjectContext:self.managedObjectContext];

    // 初期データを登録する
    // setValue には基本的にオブジェクトしか入らない為、
    // 整数やBOOLを入れるときには、NSNumber でラップする
    [newObject setValue:judge forKey:@"judge"];
    [newObject setValue:[NSNumber numberWithInt:point] forKey:@"point"];
    [newObject setValue:timeStamp forKey:@"timeStamp"];
    NSLog(@"judge:%@, point:%d", judge, point);

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
