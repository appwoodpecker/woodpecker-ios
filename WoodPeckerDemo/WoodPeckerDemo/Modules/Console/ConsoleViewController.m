//
//  ConsoleViewController.m
//  WoodPeckerDemo
//
//  Created by xiaogang zhang on 2018/6/9.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "ConsoleViewController.h"

@interface ConsoleViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger count;
@property (weak, nonatomic) IBOutlet UIButton *countButton;

@end

@implementation ConsoleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count = 0;
    [self updateTimerCountButtonUI];
}

- (IBAction)logButtonPressed:(id)sender {
    [self logCount];
    NSLog(@"Woodpecker home page: http://www.woodpeck.cn, \nContact me: woodpeckerapp@163.com");
}

- (IBAction)counterLogButtonPressed:(id)sender {
    if(!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(logCount) userInfo:nil repeats:YES];
    }else {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self updateTimerCountButtonUI];
}

- (void)updateTimerCountButtonUI {
    if(self.timer) {
        [self.countButton setTitle:@"Stop" forState:UIControlStateNormal];
    }else {
        [self.countButton setTitle:@"Start Count" forState:UIControlStateNormal];
    }
}

- (void)logCount {
    NSLog(@"count:  %zd",self.count++);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end











