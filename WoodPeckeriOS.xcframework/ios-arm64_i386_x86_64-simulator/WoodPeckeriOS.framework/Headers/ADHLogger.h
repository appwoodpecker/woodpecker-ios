//
//  ADHLogger.h
//  ADHClient
//
//  Created by 张小刚 on 2017/12/30.
//  Copyright © 2017年 lifebetter. All rights reserved.
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

@interface ADHLogger : NSObject

+ (ADHLogger *)sharedLogger;
- (void)logText: (NSString *)text;
- (void)logFileWithData:(NSData *)fileData fileName:(NSString *)fileName text: (NSString *)text;
#if TARGET_OS_IPHONE
- (void)logText: (NSString *)text color: (UIColor *)color;
#endif

@end
