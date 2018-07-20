//
//  DeviceInfoViewController.m
//  WoodPeckerDemo
//
//  Created by xiaogang zhang on 2018/3/17.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "DeviceInfoViewController.h"

@interface DeviceInfoViewController ()

@end

@implementation DeviceInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)actionButton:(id)sender {
    NSString * message = @"click me on Mac or iPhone ?";
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"iPhone" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.view.backgroundColor = [UIColor grayColor];
    }];
    UIAlertAction * confirm = [UIAlertAction actionWithTitle:@"Mac" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        float red = arc4random() % 255 / 255.0f;
        float green = arc4random() % 255 / 255.0f;
        float blue = arc4random() % 255 / 255.0f;
        self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    }];
    [alert addAction:cancel];
    [alert addAction:confirm];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
