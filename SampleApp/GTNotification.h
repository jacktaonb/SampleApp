//
//  GTNotification.h
//  SampleApp
//
//  Created by 王韬 on 2021/5/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 APP 推送管理
 */
@interface GTNotification : NSObject

+ (GTNotification *)notificationManager;

- (void)checkNotificationAuthorization;

@end

NS_ASSUME_NONNULL_END
