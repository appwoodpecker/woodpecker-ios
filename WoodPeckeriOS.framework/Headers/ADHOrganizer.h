//
//  AppOrganizer.h
//  ADHClient
//
//  Created by woodpecker on 2017/11/5.
//  Copyright © 2017年 lifebetter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


extern NSString * const ADHOrgnizerWindowDidVisible;
extern NSString * const ADHOrganizerWorkStatusUpdate;

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

/**
 working well
 */
- (BOOL)isWorking;


@end
