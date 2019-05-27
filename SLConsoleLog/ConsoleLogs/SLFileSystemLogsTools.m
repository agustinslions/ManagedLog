//
//  SLFileSystemLogsTools.m
//  SLConsoleLog
//
//  Created by Agustin De Leon on 12/6/16.
//  Copyright (c) 2015 South Lions. All rights reserved.
//

#import "SLFileSystemLogsTools.h"

#define ktxtExtension         @"txt"
#define kConsoleLogs         @"ConsoleLogs"

@implementation SLFileSystemLogsTools

+ (NSString *)generatePathWithType:(NSString *)type
{
    return [SLFileSystemLogsTools pathForKey:type withExtension:ktxtExtension];
}

+ (NSData *)getDataFromPath:(NSString *)path
{
    return [NSData dataWithContentsOfFile:path];
}

+ (void)saveDataFromPath:(NSString *)path withData:(NSData *)data
{
    [data writeToFile:path atomically:NO];
}

+ (NSString *)pathForKey:(NSString *)key withExtension:(NSString *)extension
{
    return [SLFileSystemLogsTools createPathForName:[NSString stringWithFormat:@"%@.%@", key, extension] andRoot:[SLFileSystemLogsTools pathForConsoleLogDirectory]];
}

+ (NSString *)createPathForName:(NSString *)name andRoot:(NSString *)root
{
    return [root stringByAppendingString:[NSString stringWithFormat:@"/%@", name]];
}

+ (NSString *)pathForConsoleLogDirectory
{
    NSString *path = [NSString stringWithFormat:@"%@/%@", [SLFileSystemLogsTools pathForDocumentDirectory], kConsoleLogs];
    [SLFileSystemLogsTools createFolderForPath:path];
    
    return path;
}

+ (NSString *)pathForDocumentDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (void)createFolderForPath:(NSString *)path
{
    BOOL isDir = YES;

    if (![[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir]) {
        NSError *error;
        
        if (![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&error]) {
            NSLog(@"Couldn't create directory error: %@", error);
        } else {
            NSLog(@"directory created!");
        }
    }
}

+ (NSMutableArray *)filesOnConsoleLogFolder
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *directory = [self pathForConsoleLogDirectory];
    NSError *error = nil;

    NSArray *directoryContent = [fm contentsOfDirectoryAtURL:[[NSURL alloc] initWithString:directory]
                                  includingPropertiesForKeys:@[NSURLContentModificationDateKey]
                                                     options:NSDirectoryEnumerationSkipsHiddenFiles
                                                       error:&error];

    NSArray *sortedContent = [directoryContent sortedArrayUsingComparator:
                              ^(NSURL *file1, NSURL *file2)
                              {
                                  NSDate *file1Date;
                                  [file1 getResourceValue:&file1Date forKey:NSURLContentModificationDateKey error:nil];

                                  NSDate *file2Date;
                                  [file2 getResourceValue:&file2Date forKey:NSURLContentModificationDateKey error:nil];

                                  return [file2Date compare: file1Date];
                              }];

    return [NSMutableArray arrayWithArray: sortedContent] ;
}

+ (NSString *)getNameOfFileFromPath:(NSString *)path
{
    NSString *nameWithExtension = [path lastPathComponent];
    NSArray *parts = [nameWithExtension componentsSeparatedByString:@"."];
    NSString *filename = [parts objectAtIndex:0];
    
    return filename;
}

+ (void)cleanFilesLogs
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *directory = [self pathForConsoleLogDirectory];
    NSError *error = nil;
    
    for (NSString *file in [fm contentsOfDirectoryAtPath:directory error:&error]) {
        BOOL success = [fm removeItemAtPath:[NSString stringWithFormat:@"%@/%@", directory, file] error:&error];
        
        if (!success || error) {
            // it failed.
            NSLog(@"failed clean");
        }
    }
}

@end
