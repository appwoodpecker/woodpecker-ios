//
//  ADHLogger.h
//  ADHClient
//
//  Created by 张小刚 on 2017/12/30.
//  Copyright © 2017年 lifebetter. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    1. log text
    2. log text with color
    3. log file, fileData will be transfer to Mac
 */
extern void adhLog(NSString *format, ...);
extern void adhColorLog(UIColor *color,NSString *format, ...);
extern void adhFileLog(NSData * fileData,NSString *fileName,NSString *format,...);

@interface ADHLogger : NSObject

+ (ADHLogger *)sharedLogger;
- (void)logText: (NSString *)text;
- (void)logText: (NSString *)text color: (UIColor *)color;
- (void)logFileWithData:(NSData *)fileData fileName:(NSString *)fileName text: (NSString *)text;

@end
