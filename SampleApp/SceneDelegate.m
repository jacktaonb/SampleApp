//
//  SceneDelegate.m
//  SampleApp
//
//  Created by 王韬 on 2020/11/1.
//

#import "SceneDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
#import "GTSplashView.h"
#import "GTMineViewController.h"

@interface SceneDelegate ()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {

    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    GTNewsViewController *newsViewController = [[GTNewsViewController alloc] init];
    GTVideoViewController *videoController = [[GTVideoViewController alloc] init];
    GTRecommendViewController *recommendController = [[GTRecommendViewController alloc] init];
    GTMineViewController *mineViewController = [[GTMineViewController alloc] init];

    [tabbarController setViewControllers:@[newsViewController, videoController, recommendController, mineViewController]];
    tabbarController.delegate = self;

    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabbarController];
    UIWindow *windowScene = (UIWindow *)scene;
    self.window = [[UIWindow alloc] initWithFrame:windowScene.coordinateSpace.bounds];
    self.window.windowScene = (UIWindowScene *)windowScene;
    [ self.window setRootViewController:navigationController];
    [ self.window makeKeyAndVisible];
    [self.window addSubview:({
        GTSplashView *view = [[GTSplashView alloc] initWithFrame:self.window.bounds];
        view;
    })];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

@end
