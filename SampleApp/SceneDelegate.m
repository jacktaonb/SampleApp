//
//  SceneDelegate.m
//  SampleApp
//
//  Created by 王韬 on 2020/11/1.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"

@interface SceneDelegate ()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    ViewController *viewController = [[ViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];

    //UIViewController *controller1 = [[UIViewController alloc] init];
    //controller1.view.backgroundColor = [UIColor redColor];
    viewController.tabBarItem.title = @"新闻";
    viewController.tabBarItem.image = [UIImage imageNamed:@"1"];

    GTVideoViewController *videoController = [[GTVideoViewController alloc] init];
    

    GTRecommendViewController *recommendController = [[GTRecommendViewController alloc] init];
    
    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor lightGrayColor];
    controller4.tabBarItem.title = @"我的";
    controller4.tabBarItem.image = [UIImage imageNamed:@"1"];

    [tabbarController setViewControllers:@[viewController, videoController, recommendController, controller4]];
    tabbarController.delegate = self;
    
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabbarController];
    UIWindow *windowScene = (UIWindow *)scene;
    _window = [[UIWindow alloc] initWithFrame:windowScene.coordinateSpace.bounds];
    _window.windowScene = (UIWindowScene *)windowScene;
    [_window setRootViewController:navigationController];
    [_window makeKeyAndVisible];
}



- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select");
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
