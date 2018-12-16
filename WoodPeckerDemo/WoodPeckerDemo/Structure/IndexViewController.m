//
//  IndexViewController.m
//  WoodPeckerDemo
//
//  Created by xiaogang zhang on 2018/1/17.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "IndexViewController.h"
#import "SandBoxViewController.h"
#import "NetworkViewController.h"
#import "IOViewController.h"
#import "WebConsoleViewController.h"
#import "UserDefaultsViewController.h"
#import "DeviceInfoViewController.h"
#import "ControllerHierarchyViewController.h"
#import "NotificationViewController.h"
#import "ConsoleViewController.h"

static NSString * const kIndexCellIdentifier = @"kIndexCellIdentifier";

@interface IndexViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) NSArray * actionList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Woodpecker Demo";
    self.tableView.rowHeight = 60.0f;
    [self loadData];
}

- (void)loadData
{
    self.actionList = @[
                        @{
                            @"title" : @"Sandbox",
                            @"action" : NSStringFromSelector(@selector(sandBox)),
                            },
                        @{
                            @"title" : @"Network",
                            @"action" : NSStringFromSelector(@selector(network)),
                            },
                        @{
                            @"title" : @"I/O",
                            @"action" : NSStringFromSelector(@selector(doIO)),
                            },
                        @{
                            @"title" : @"Console",
                            @"action" : NSStringFromSelector(@selector(console)),
                            },
                        @{
                            @"title" : @"Web Console",
                            @"action" : NSStringFromSelector(@selector(webConsole)),
                            },
                        @{
                            @"title" : @"UserDefaults",
                            @"action" : NSStringFromSelector(@selector(userDefaults)),
                            },
                        @{
                            @"title" : @"Device",
                            @"action" : NSStringFromSelector(@selector(device)),
                            },
                        @{
                            @"title" : @"Controller Hierarchy",
                            @"action" : NSStringFromSelector(@selector(controller)),
                            },
                        @{
                            @"title" : @"Notification",
                            @"action" : NSStringFromSelector(@selector(notification)),
                            },
                        
                        
                       ];
}


- (void)sandBox
{
    SandBoxViewController * vc = [[SandBoxViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)network
{
    NetworkViewController * vc = [[NetworkViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)doIO
{
    IOViewController * vc = [[IOViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)console {
    ConsoleViewController *vc = [[ConsoleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)webConsole
{
    WebConsoleViewController * vc = [[WebConsoleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)userDefaults
{
    UserDefaultsViewController * vc = [[UserDefaultsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)device
{
    DeviceInfoViewController * vc = [[DeviceInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)controller {
    ControllerHierarchyViewController *nextVC = [[ControllerHierarchyViewController alloc] init];
    nextVC.pageIndex = 0;
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)notification {
    NotificationViewController *notificationVC = [[NotificationViewController alloc] init];
    [self.navigationController pushViewController:notificationVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.actionList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kIndexCellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kIndexCellIdentifier];
    }
    NSDictionary * data = self.actionList[indexPath.row];
    NSString * title = data[@"title"];
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * data = self.actionList[indexPath.row];
    SEL selector = NSSelectorFromString(data[@"action"]);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:selector];
#pragma clang diagnostic pop
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end








