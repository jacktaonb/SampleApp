//
//  GTLocation.m
//  SampleApp
//
//  Created by 王韬 on 2021/5/4.
//

#import "GTLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface GTLocation()<CLLocationManagerDelegate>
@property(nonatomic, strong, readwrite) CLLocationManager *manager;

@end

@implementation GTLocation

+ (GTLocation *)locationManager{
    static GTLocation *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[GTLocation alloc] init];
    });
    return location;
}

- (instancetype)init{
    self = [super init];
    if(self){
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
    }
    return self;
}

- (void)checkLocationAuthorization{
    if (![CLLocationManager locationServicesEnabled]) {
        //判读系统是否开启定位服务
    }
    
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
        [self.manager requestWhenInUseAuthorization];
    }
}

-(void)locationManager:(CLLocation *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
        [self.manager stopUpdatingLocation];
    }else if (status == kCLErrorDenied){
        
    }
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = [locations firstObject];
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
    }];
    [self.manager stopUpdatingLocation];
}

@end
