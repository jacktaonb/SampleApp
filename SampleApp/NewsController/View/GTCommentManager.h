//
//  GTCommentManager.h
//  SampleApp
//
//  Created by 王韬 on 2021/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTCommentManager : NSObject

+(GTCommentManager *)sharedManager;

-(void)showCommentView;

@end

NS_ASSUME_NONNULL_END
