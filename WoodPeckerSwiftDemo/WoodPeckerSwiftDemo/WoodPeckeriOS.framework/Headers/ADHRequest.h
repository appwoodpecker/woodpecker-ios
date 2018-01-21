//
//  ADHRequest.h
//  ADHClient
//
//  Created by 张小刚 on 2017/11/4.
//  Copyright © 2017年 lifebetter. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ADHRequest;
@class ADHSession;
@class ADHService;

typedef void (^ADHActionResponseBlock)(NSDictionary * body,NSData * payload, ADHRequest * request);

@interface ADHRequest : NSObject

@property (nonatomic, strong) NSString * service;
@property (nonatomic, strong) NSString * action;
@property (nonatomic, strong) NSDictionary * body;
@property (nonatomic, strong) NSData * payload;
/**
 the service object which handle current request
 
 * use strong to prevent service release before request finish (do not modify)
 */
@property (nonatomic, strong) ADHService * serviceObj;

//must call on end of a request
- (void)finish;
- (void)finishWithBody: (NSDictionary *)body;
- (void)finishWithBody: (NSDictionary *)body payload: (NSData *)payload;

//private use by dispatcher
@property (nonatomic, weak) ADHSession * tSession;
//set by dispatcher call finish method not this block
@property (nonatomic, strong) ADHActionResponseBlock responseBlock;

@end








