//
//  ADHRequest.h
//  ADHClient
//
//  Created by woodpecker on 2017/11/4.
//  Copyright © 2017年 lifebetter. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ADHRequest;
@class ADHSession;
@class ADHService;

@interface ADHRequest : NSObject

@property (nonatomic, strong) NSString * service;
@property (nonatomic, strong) NSString * action;
@property (nonatomic, strong) NSDictionary * body;
@property (nonatomic, strong) NSData * payload;


//must call at the end of a request
- (void)finish;
- (void)finishWithBody: (NSDictionary *)body;
- (void)finishWithBody: (NSDictionary *)body payload: (NSData *)payload;


@end








