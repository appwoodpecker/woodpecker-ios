//
//  AppDelegate.m
//  WoodPeckerDemo
//
//  Created by xiaogang zhang on 2018/1/17.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "AppDelegate.h"
#import "IndexViewController.h"
@import UserNotifications;

@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow * window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    IndexViewController * indexVC = [[IndexViewController alloc] init];
    UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:indexVC];
    self.window = window;
    self.window.rootViewController = nvc;
    [self.window makeKeyAndVisible];
    [self setupNotification];
    return YES;
}

- (void)setupNotification {
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter * notiCenter = [UNUserNotificationCenter currentNotificationCenter];
        notiCenter.delegate = self;
        UNNotificationAction *openAction = [UNNotificationAction actionWithIdentifier:UNNotificationDefaultActionIdentifier title:@"Okay" options:0];
        UNNotificationAction *customAction = [UNNotificationAction actionWithIdentifier:@"custum action" title:@"Do Something" options:0];
        UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"actionCategory" actions:@[openAction,customAction] intentIdentifiers:@[] options:0];
        NSSet *set = [NSSet setWithObjects:category, nil];
        [notiCenter setNotificationCategories:set];
    }
}

/** The method will be called on the delegate only if the application is in the foreground. If the method is not implemented or the handler is not called in a timely manner then the notification will not be presented. The application can choose to have the notification presented as a sound, badge, alert and/or in the notification list. This decision should be based on whether the information in the notification is otherwise visible to the user.
 */
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
API_AVAILABLE(ios(10.0)){
    NSLog(@"will present notification");
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert|UNNotificationPresentationOptionBadge);
}

/** The method will be called on the delegate when the user responded to the notification by opening the application, dismissing the notification or choosing a UNNotificationAction. The delegate must be set before the application returns from application:didFinishLaunchingWithOptions:.
 */
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler
API_AVAILABLE(ios(10.0)){
    NSLog(@"did receive notification response");
    completionHandler();
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
