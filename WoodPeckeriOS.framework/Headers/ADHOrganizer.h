//
//  AppOrganizer.h
//  ADHClient
//
//  Created by 张小刚 on 2017/11/5.
//  Copyright © 2017年 lifebetter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ADHService;
@class ADHAppConnector;
extern NSString * const ADHOrgnizerWindowDidVisible;

@interface ADHOrganizer : NSObject

+ (ADHOrganizer *)sharedOrganizer;

/**
 show connection UI
 */
- (void)showUI;

/**
 plugin support
 */
- (void)registerService: (Class)serviceClazz;


//private do not call
- (ADHAppConnector *) connector;
- (void)clearAutoConnectTry;
- (NSBundle *)adhBundle;
- (UINib *)nibWithName: (NSString *)nibName;

@end
