//
//  SLFileSystemLogsTools.h
//  SLConsoleLog
//
//  Created by Agustin De Leon on 12/6/16.
//  Copyright (c) 2015 South Lions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLFileSystemLogsTools : NSObject

+ (NSString *)generatePathWithType:(NSString *)type;

+ (NSData *)getDataFromPath:(NSString *)path;

+ (void)saveDataFromPath:(NSString *)path withData:(NSData *)data;

+ (NSString *)pathForKey:(NSString *)key withExtension:(NSString *)extension;

+ (NSString *)createPathForName:(NSString *)name andRoot:(NSString *)root;

+ (NSString *)pathForDocumentDirectory;

+ (void)createFolderForPath:(NSString *)path;

+ (NSMutableArray *)filesOnConsoleLogFolder;

+ (NSString *)getNameOfFileFromPath:(NSString *)path;

+ (void)cleanFilesLogs;

@end
