//
//  SLConsoleTypesViewController.m
//  SLConsoleLog
//
//  Created by Agustin De Leon on 12/6/16.
//  Copyright (c) 2015 South Lions. All rights reserved.
//

#import "SLConsoleTypesViewController.h"
#import "SLConsoleLogManager.h"
#import "SLLogsViewController.h"
#import "SLFileSystemLogsTools.h"

@interface SLConsoleTypesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *consoleFiles;

@end

@implementation SLConsoleTypesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        
    self.consoleFiles = [SLConsoleLogManager getFilesLogsTypes];
    
    [self.tableView reloadData];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.consoleFiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ConsoleLogType"];
    
    cell.textLabel.text = [SLFileSystemLogsTools getNameOfFileFromPath:[self.consoleFiles objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"%@", [self.consoleFiles objectAtIndex:indexPath.row]);
    
    SLLogsViewController *logsViewController = [[SLLogsViewController alloc] initWithNibName:@"SLLogsViewController" bundle:nil];

    logsViewController.filePathLogs = [SLFileSystemLogsTools getNameOfFileFromPath:[self.consoleFiles objectAtIndex:indexPath.row]];
    
    [self.navigationController pushViewController:logsViewController animated:YES];
}

@end
