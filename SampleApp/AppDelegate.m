//
//  AppDelegate.m
//  SampleApp
//
//  Created by 王韬 on 2020/11/1.
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "SceneDelegate.h"
#import "GTNewsViewController.h"
#import "GTRecommendViewController.h"
#import "GTMineViewController.h"
#import "GTSplashView.h"
#import "GTVideoViewController.h"
#import "GTLocation.h"
#import "GTNotification.h"


@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
        GTNewsViewController *newsViewController = [[GTNewsViewController alloc] init];
        GTVideoViewController *videoController = [[GTVideoViewController alloc] init];
        GTRecommendViewController *recommendController = [[GTRecommendViewController alloc] init];
        GTMineViewController *mineViewController = [[GTMineViewController alloc] init];

        [tabbarController setViewControllers:@[newsViewController, videoController, recommendController, mineViewController]];
        tabbarController.delegate = self;

        UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabbarController];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [ self.window setRootViewController:navigationController];
        [ self.window makeKeyAndVisible];
        [self.window addSubview:({
            GTSplashView *view = [[GTSplashView alloc] initWithFrame:self.window.bounds];
            view;
        })];
    
    
//    static
//    [[GTStaic alloc] init];
    
//    [[GTFramework alloca] init];
    
    
      //crash
//    [self _caughtException];
//    [@[].mutableCopy addObject:nil];
    [[GTLocation locationManager] checkLocationAuthorization];
    [[GTNotification notificationManager] checkNotificationAuthorization];
    
    
    return YES;
}


#pragma mark - crash

-(void)_caughtException{
    NSSetUncaughtExceptionHandler(HandelNSException);
    
}

void HandelNSException(NSException *exception){
    __unused NSString * reason = [exception reason];
    __unused NSString * name = [exception name];
    //crash
}

#pragma mark - tuisong
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    //notification实现
     
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    
}


@end
