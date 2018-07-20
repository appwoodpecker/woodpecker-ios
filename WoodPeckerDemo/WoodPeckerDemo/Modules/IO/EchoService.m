//
//  EchoService.m
//  WoodPeckerDemo
//
//  Created by xiaogang zhang on 2018/1/17.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "EchoService.h"

@implementation EchoService

+ (void)load {
    [[ADHOrganizer sharedOrganizer] registerService:[EchoService class]];
}

+ (NSString *)serviceName {
    return @"adh.EchoService";
}

+ (NSDictionary<NSString*,NSString *> *)actionList {
    return @{
             @"echo" : NSStringFromSelector(@selector(onRequestEcho:)),
             };
}

- (void)onRequestEcho: (ADHRequest *)request {
    NSDictionary * data = @{
                            @"response" : @"hi, I`m App, What`s up",
                            };
    [request finishWithBody:data];
}

@end





















