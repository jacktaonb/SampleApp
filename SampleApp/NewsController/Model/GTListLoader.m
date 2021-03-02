//
//  GTListLoader.m
//  SampleApp
//
//  Created by 王韬 on 2020/11/15.
//

#import "GTListLoader.h"
//#import <AFNetworking.h>
#import "GTListItem.h"
@implementation GTListLoader

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock {
    
    NSArray<GTlistItem *> *listdata = [self _readDataFromLocal];
    if (listdata) {
        finishBlock(YES, listdata);
    }
    
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=1113811726e766953e642681e1371677";
    NSURL *listURL = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    
    __weak typeof(self) weakself = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        __weak typeof(weakself) strongSelf = weakself;
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *dataArray = [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        [weakself _archiveListDataWithArray:listItemArray.copy];
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (finishBlock) {
                               finishBlock(error == nil, listItemArray.copy);
                           }
                       });
    }];

    [dataTask resume];
}
#pragma mark - private
-(NSArray<GTlistItem *> *)_readDataFromLocal{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];
    NSFileManager *fileManger = [NSFileManager defaultManager];
    NSData *readListData = [fileManger contentsAtPath:listDataPath];
        id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readListData error:nil];
    if([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0){
        return (NSArray<GTlistItem *> *)unarchiveObj;
    }
    return  nil;
}

- (void)_archiveListDataWithArray:(NSArray<GTlistItem *> *)array {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];

    NSFileManager *fileManger = [NSFileManager defaultManager];
    
    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *creatError;
    [fileManger createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    
    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    [fileManger createFileAtPath:listDataPath contents:listData attributes:nil];
    
//    NSData *readListData = [fileManger contentsAtPath:listDataPath];
//
//    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
//
//    NSData *testListdata = [[NSUserDefaults standardUserDefaults] dataForKey:@"listData"];
    

//    //查询文件
//    BOOL fileExist = [fileManger fileExistsAtPath:listDataPath];
    
    //删除
//    if (fileExist) {
//        [fileManger removeItemAtPath:listDataPath error:nil];
//    }
    
    NSLog(@"");
//
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    [fileHandle synchronizeFile];
//    [fileHandle closeFile];
}

@end
