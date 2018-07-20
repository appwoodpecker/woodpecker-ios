//
//  UserDefaultsViewController.m
//  WoodPeckerDemo
//
//  Created by xiaogang zhang on 2018/3/17.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "UserDefaultsViewController.h"

@interface UserDefaultsViewController ()

@end

@implementation UserDefaultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)addButtonPressed:(id)sender {
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * key = [NSString stringWithFormat:@"key%d",arc4random()];
    NSString * value = [NSString stringWithFormat:@"value%d",arc4random()];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

@end
