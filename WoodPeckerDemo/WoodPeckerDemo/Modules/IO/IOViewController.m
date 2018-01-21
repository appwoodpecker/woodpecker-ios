//
//  IOViewController.m
//  WoodPeckerDemo
//
//  Created by 张小刚 on 2018/1/17.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "IOViewController.h"
#import "WoodPeckeriOS/WoodPeckeriOS.h"
#import "EchoService.h"

@interface IOViewController ()

@end

@implementation IOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //register custom service
    [[ADHOrganizer sharedOrganizer] registerService:[EchoService class]];
}

- (IBAction)logButtonPressed:(id)sender {
    NSString * text = @"A channel between mac and your app, you can transfer data, call service in you app, or log message to mac client,  try log something, or you create a custom ADHService";
    // log to mac
    adhLog(@"%@",text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
