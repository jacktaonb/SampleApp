//
//  GTMediator.m
//  SampleApp
//
//  Created by 王韬 on 2021/4/18.
//

#import "GTMediator.h"

@implementation GTMediator

//MARK: -target action

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl{
    
    Class detailCls = NSClassFromString(@"GTDetailViewController");
    UIViewController *view = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlSting:") withObject:detailUrl];
    return view;
}
//MARK: -scheme
+ (NSMutableDictionary *)mediatorCache{
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock{
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}


+ (void)openUrl:(NSString *)url params:(NSDictionary *)params{
    GTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if(block){
        block(params);
    }
}
//MARK: -protocol

+ (void)registerProtol:(Protocol *)proto class:(Class)cls{
    if (proto && cls) {
        [[[self class] mediatorCache] setObject:cls forKey:NSStringFromProtocol(proto)];
    }
}
+ (Class)classForProtol:(Protocol *)proto{
    return [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(proto)];
}

@end
