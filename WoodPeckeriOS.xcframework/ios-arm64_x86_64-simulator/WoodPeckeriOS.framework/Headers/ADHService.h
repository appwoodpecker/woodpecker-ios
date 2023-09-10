//
//  ADHService.h
//  AppDevelopHelper
//
//  Created by woodpecker on 2017/11/4.
//  Copyright © 2017年 lifebetter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADHService : NSObject

/**
 service name
 */
+ (NSString *)serviceName;

/**
 action list

 return @{
    @"actionName1" : selector1 string,
    @"actionName2" : selector2 string,
 };
 */
+ (NSDictionary<NSString*,NSString *> *)actionList;

/**
 YES: all request use one shared service instance.
 NO: each request use a new service instance.
 */
+ (BOOL)isShared;

/**
 called on service init
 */
- (void)onServiceInit;


@end


@interface ADHAction: NSObject

@property (nonatomic, strong) NSString * service;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * handler;

+ (ADHAction *)actionWithService: (NSString *)service name: (NSString *)name handler: (NSString *)handler;

@end
