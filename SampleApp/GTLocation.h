//
//  GTLocation.h
//  SampleApp
//
//  Created by 王韬 on 2021/5/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTLocation : NSObject

+ (GTLocation *)locationManager;
- (void)checkLocationAuthorization;

@end

NS_ASSUME_NONNULL_END
