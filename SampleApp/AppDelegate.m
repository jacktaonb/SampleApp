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
    return YES;
}


#pragma mark - UISceneSession lifecycle



@end
