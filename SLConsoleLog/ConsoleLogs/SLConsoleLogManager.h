//
//  SLConsoleLogManager.h
//  SLConsoleLog
//
//  Created by Agustin De Leon on 12/6/16.
//  Copyright (c) 2015 South Lions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLConsoleLogManager : NSObject

+ (void)saveLog:(NSString *)log withType:(NSString *)type;

+ (NSMutableArray *)getFilesLogsTypes;

+ (NSString *)getLogsForType:(NSString *)type;

+ (void)cleanAllLogs;

@end
