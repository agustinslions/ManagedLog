//
//  SLViewController+Extension.m
//  SLConsoleLog
//
//  Created by Agustin De León on 8/2/18.
//  Copyright © 2018 South Lions. All rights reserved.
//

#import "SLViewController+Extension.h"
#import "SLConsoleTypesViewController.h"

@implementation UIViewController (Extension)

- (void)showConsoleTypesViewController {
    NSBundle *podBundle = [NSBundle bundleForClass:[SLConsoleTypesViewController class]];
    SLConsoleTypesViewController *logsViewController = [[SLConsoleTypesViewController alloc] initWithNibName:@"SLConsoleTypesViewController" bundle:podBundle];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:logsViewController];
    [[self topViewController] presentViewController:navigationController animated:YES completion:nil];
}

- (UIViewController*)topViewController {
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].delegate.window.rootViewController];
}

- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

@end
