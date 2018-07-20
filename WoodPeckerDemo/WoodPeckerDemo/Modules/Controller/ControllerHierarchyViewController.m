//
//  ControllerHierarchyViewController.m
//  WoodPeckerDemo
//
//  Created by xiaogang zhang on 2018/5/17.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "ControllerHierarchyViewController.h"

@interface ControllerHierarchyViewController ()

@end

@implementation ControllerHierarchyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"Page %zd",self.pageIndex];
}

- (IBAction)nextButtonPressed:(id)sender {
    ControllerHierarchyViewController *nextVC = [[ControllerHierarchyViewController alloc] init];
    nextVC.pageIndex = self.pageIndex+1;
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
