//
//  WebConsoleViewController.m
//  WoodPeckerDemo
//
//  Created by xiaogang zhang on 2018/1/17.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "WebConsoleViewController.h"
#import "WebContentViewController.h"

@interface WebConsoleViewController ()

@end

@implementation WebConsoleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)uiwebviewButtonPressed:(id)sender {
    WebContentViewController * vc = [[WebContentViewController alloc] init];
    vc.uiwebView = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)wkwebviewButtonPressed:(id)sender {
    WebContentViewController * vc = [[WebContentViewController alloc] init];
    vc.uiwebView = NO;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
