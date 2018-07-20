//
//  NotificationViewController.m
//  WoodPeckerDemo
//
//  Created by xiaogang zhang on 2018/6/4.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "NotificationViewController.h"
@import UserNotifications;

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)fireButtonPressed:(id)sender {
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter * notiCenter = [UNUserNotificationCenter currentNotificationCenter];
        [notiCenter requestAuthorizationWithOptions:(UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if(granted){
                UNUserNotificationCenter * notiCenter = [UNUserNotificationCenter currentNotificationCenter];
                NSString * identifier = [NSString stringWithFormat:@"%d",arc4random()];
                NSString * requestIdentifier = [NSString stringWithFormat:@"request identifier%@",identifier];
                UNMutableNotificationContent * content = [[UNMutableNotificationContent alloc] init];
                content.badge = [NSNumber numberWithInteger:arc4random()%10];
                content.body = [NSString stringWithFormat:@"Thanks for using woodpecker %@",identifier];
                content.title = [NSString stringWithFormat:@"This is title %@",identifier];
                content.subtitle = [NSString stringWithFormat:@"This is subtitle %@",identifier];
                content.userInfo = @{
                                     @"identifier" : identifier,
                                     };
                content.categoryIdentifier = @"actionCategory";
                UNTimeIntervalNotificationTrigger * trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3 repeats:NO];
                UNNotificationRequest * request = [UNNotificationRequest requestWithIdentifier:requestIdentifier content:content trigger:trigger];
                [notiCenter addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
                    if(error){
                        NSLog(@"add local notification error: %@",error);
                    }else{
                        NSLog(@"add local notification success");
                    }
                }];
            }else{
                NSLog(@"not granted. error: %@",error);
            }
        }];
    } else {
        NSString *message = @"Sorry, this tool only support iOS 10+";
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert" message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * confirm = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end





