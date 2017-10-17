//
//  SLConsoleLogController.m
//  South Lions
//
//  Created by Agustin De Leon on 12/6/16.
//  Copyright (c) 2015 South Lions. All rights reserved.
//

#import "SLConsoleLogController.h"
#import "SLConsoleLogManager.h"
#import "SLFileSystemLogsTools.h"

#define kGeneralFileLog @"general_file_name"

@implementation SLConsoleLogController

+ (SLConsoleLogController *)sharedInstance {
    static SLConsoleLogController * instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [SLConsoleLogController new];
    });
    
    return instance;
}

- (id)init {
    self = [super init];
    
    if (self) {
    
        self.cleanAllPerSession = [[NSUserDefaults standardUserDefaults] boolForKey:@"SLConsoleLogClean"];
    }
    
    return self;
}

- (void)setStopRecord:(BOOL)stopRecord {
    _stopRecord = stopRecord;
}

- (void)setCleanAllPerSession:(BOOL)cleanAllPerSession {
    _cleanAllPerSession = cleanAllPerSession;
    
    [[NSUserDefaults standardUserDefaults] setBool:_cleanAllPerSession forKey:@"SLConsoleLogClean"];
    
    if (_cleanAllPerSession) {
        [self cleanAllLogs];
    }
}

#pragma mark - Public Methods

- (void)addLog:(NSString *)log {
    @try {
        if (self.stopRecord) {
            [self addLogOnGeneralFile:log];
        }
    } @catch (NSException *exception) {
        
    }
}

- (void)addLog:(NSString *)log withType:(NSString *)type {
    @try {
        if (self.stopRecord) {
            [self addLogOnGeneralFile:log];
            [self addLogOnFileWithType:type withLog:log];
        }
    } @catch (NSException *exception) {
        
    }
}

- (NSString *)getLogs {
    return [self getLogsForType:kGeneralFileLog];
}

- (NSString *)getLogsForType:(NSString *)type {
    return [SLConsoleLogManager getLogsForType:type];
}

- (void)cleanAllLogs {
    [SLConsoleLogManager cleanAllLogs];
}

#pragma mark - Private Methods

- (void)addLogOnGeneralFile:(NSString *)log {
    [self addLogOnFileWithType:kGeneralFileLog withLog:log];
}

- (void)addLogOnFileWithType:(NSString *)type withLog:(NSString *)log {
    [SLConsoleLogManager saveLog:log withType:type];
}

@end
