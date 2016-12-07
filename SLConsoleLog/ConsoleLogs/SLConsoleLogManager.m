//
//  SLConsoleLogManager.m
//  SLConsoleLog
//
//  Created by Agustin De Leon on 12/6/16.
//  Copyright (c) 2015 South Lions. All rights reserved.
//

#import "SLConsoleLogManager.h"
#import "SLFileSystemLogsTools.h"

@implementation SLConsoleLogManager

+ (void)saveLog:(NSString *)log withType:(NSString *)type
{
    NSString *filePath = [SLFileSystemLogsTools generatePathWithType:type];
    
    NSData *data;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        
        NSData *dataLogs = [SLFileSystemLogsTools getDataFromPath:filePath];
        NSString *logsString = [[NSString alloc] initWithData:dataLogs encoding:NSUTF16StringEncoding];
        
        NSString *updatedLogs = [logsString stringByAppendingString:[NSString stringWithFormat:@"\n%@", log]];
        data = [updatedLogs dataUsingEncoding:NSUTF16StringEncoding];
        
    } else {
        data = [log dataUsingEncoding:NSUTF16StringEncoding];
    }
    
    [SLFileSystemLogsTools saveDataFromPath:filePath withData:data];
}

+ (NSMutableArray *)getFilesLogsTypes
{
    return [SLFileSystemLogsTools filesOnConsoleLogFolder];
}

+ (NSString *)getLogsForType:(NSString *)type
{
    NSString *filePath = [SLFileSystemLogsTools generatePathWithType:type];
    NSData *dataLogs = [SLFileSystemLogsTools getDataFromPath:filePath];
    NSString *logsString = [[NSString alloc] initWithData:dataLogs encoding:NSUTF16StringEncoding];
    
    return logsString;
}

+ (void)cleanAllLogs
{
    [SLFileSystemLogsTools cleanFilesLogs];
}

@end
