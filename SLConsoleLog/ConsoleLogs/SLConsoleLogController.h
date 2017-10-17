//
//  SLConsoleLogController.h
//  SLConsoleLog
//
//  Created by Agustin De Leon on 12/6/16.
//  Copyright (c) 2015 South Lions. All rights reserved.
//

#import <Foundation/Foundation.h>

#define logFormat(logString)        [NSString stringWithFormat:@"[%@] ---> %@", [NSDate date], logString]
#define SLLog(log)                  [[SLConsoleLogController sharedInstance] addLog:logFormat(log)]
#define SLLogWithType(log, type)    [[SLConsoleLogController sharedInstance] addLog:logFormat(log) withType:type]

@interface SLConsoleLogController : NSObject

@property (nonatomic, assign) BOOL stopRecord;

@property (nonatomic, assign) BOOL cleanAllPerSession;

+ (SLConsoleLogController *)sharedInstance;

- (void)addLog:(NSString *)log;

- (void)addLog:(NSString *)log withType:(NSString *)type;

- (NSString *)getLogs;

- (NSString *)getLogsForType:(NSString *)type;

- (void)cleanAllLogs;

@end
