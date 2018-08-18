//
//  AppOrganizer.h
//  ADHClient
//
//  Created by woodpecker on 2017/11/5.
//  Copyright © 2017年 lifebetter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 * parameters that specify which mac client you'd like to connect
 * learn more at http://www.woodpeck.cn/connection.html
 */
extern NSString *const kADHHostName;
extern NSString *const kADHHostAddress;
extern NSString *const kADHAutoConnectEnabled;
extern NSString *const kADHShowOnConnectionFailed;


@interface ADHOrganizer : NSObject

+ (ADHOrganizer *)sharedOrganizer;

/**
 * register your own ADHService
 * learn more about custom service, please visit http://www.woodpeck.cn/plugin.html
 */
- (void)registerService: (Class)serviceClazz;


@end
