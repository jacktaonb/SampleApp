//
//  GTMediator.h
//  SampleApp
//
//  Created by 王韬 on 2021/4/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTDetailViewControllerProtocol <NSObject>

- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end

@interface GTMediator : NSObject

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;


typedef void(^GTMediatorProcessBlock)(NSDictionary *params);
+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

+ (void)registerProtol:(Protocol *)proto class:(Class)cls;
+ (Class)classForProtol:(Protocol *)proto;

@end

NS_ASSUME_NONNULL_END
