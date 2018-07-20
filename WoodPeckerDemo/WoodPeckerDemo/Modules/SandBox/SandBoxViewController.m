//
//  SandBoxViewController.m
//  WoodPeckerDemo
//
//  Created by xiaogang zhang on 2018/1/17.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "SandBoxViewController.h"

@interface SandBoxViewController ()

@end

@implementation SandBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)addFileButtonPressed:(id)sender {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date = [NSDate date];
    NSString * text = [formatter stringFromDate:date];
    //file name
    [formatter setDateFormat:@"HH-mm-ss"];
    NSString * fileName = [NSString stringWithFormat:@"%@.txt",[formatter stringFromDate:date]];
    NSString * documentPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString * filePath = [documentPath stringByAppendingPathComponent:fileName];
    NSURL * fileURL = [NSURL fileURLWithPath:filePath];
    NSError * error = nil;
    [text writeToURL:fileURL atomically:YES encoding:NSUTF8StringEncoding error:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end












