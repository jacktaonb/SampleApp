//
//  GTVideoPlayer.h
//  SampleApp
//
//  Created by 王韬 on 2021/3/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoPlayer : NSObject

+ (GTVideoPlayer *)Player;

- (void)playViedoWithUrl:(NSString *)videoUrl attachView:(UIView *)attchView;
@end

NS_ASSUME_NONNULL_END
