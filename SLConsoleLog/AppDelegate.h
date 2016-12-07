//
//  AppDelegate.h
//  SLConsoleLog
//
//  Created by Agustin De León on 12/6/16.
//  Copyright © 2016 South Lions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

