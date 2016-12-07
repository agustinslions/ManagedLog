//
//  ViewController.m
//  SLConsoleLog
//
//  Created by Agustin De León on 12/6/16.
//  Copyright © 2016 South Lions. All rights reserved.
//

#import "ViewController.h"
#import "SLConsoleLogController.h"
#import "SLConsoleTypesViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)firstLogAction:(id)sender
{
    SLLogWithType(@"first Log", @"TrackLog");
}

- (IBAction)secondLogAction:(id)sender
{
    SLLogWithType(@"second Log", @"TrackLog");
}

- (IBAction)thirthLogAction:(id)sender
{
    SLLogWithType(@"thirth Log", @"TrackLog");
}

- (IBAction)fourthLogAction:(id)sender
{
    SLLogWithType(@"fourth Log", @"TrackLog");
}

- (IBAction)first2LogAction:(id)sender
{
    SLLogWithType(@"first Log", @"TrackLog 2");
}

- (IBAction)second2LogAction:(id)sender
{
    SLLogWithType(@"second Log", @"TrackLog 2");
}

- (IBAction)thirth2LogAction:(id)sender
{
    SLLogWithType(@"thirth Log", @"TrackLog 2");
}

- (IBAction)seeLogsAction:(id)sender
{
    SLConsoleTypesViewController *logsViewController = [[SLConsoleTypesViewController alloc] initWithNibName:@"SLConsoleTypesViewController" bundle:nil];
    [self.navigationController pushViewController:logsViewController animated:YES];
}

@end
