//
//  GTListLoader.h
//  SampleApp
//
//  Created by 王韬 on 2020/11/15.
//

//列表请求
#import <Foundation/Foundation.h>

@class GTlistItem;
NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTlistItem *> *dataArray);





@interface GTListLoader : NSObject

- (void) loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
