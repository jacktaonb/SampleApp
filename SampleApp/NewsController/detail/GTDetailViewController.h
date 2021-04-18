//
//  GTDetailViewController.h
//  SampleApp
//
//  Created by 王韬 on 2020/11/9.
//
//文章底层页
#import <UIKit/UIKit.h>
#import "GTMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTDetailViewController : UIViewController<GTDetailViewControllerProtocol>
-(instancetype)initWithUrlSting:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
