//
//  SLLogsViewController.m
//  SLConsoleLog
//
//  Created by Agustin De Leon on 12/6/16.
//  Copyright (c) 2015 South Lions. All rights reserved.
//

#import "SLLogsViewController.h"
#import "SLConsoleLogManager.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface SLLogsViewController () <MFMailComposeViewControllerDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (nonatomic, weak) IBOutlet UIButton *button;

@end

@implementation SLLogsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.textView.text = [SLConsoleLogManager getLogsForType:self.filePathLogs];
    [self checkIfBottomScroll];
    UIBarButtonItem *barbutton = [[UIBarButtonItem alloc] initWithTitle:@"Send Logs" style:UIBarButtonItemStyleDone target:self action:@selector(sendLogsAction)];
    self.navigationItem.rightBarButtonItem = barbutton;
}

- (void)sendLogsAction
{
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:@"Sending logs."];
        [mailViewController setMessageBody:[SLConsoleLogManager getLogsForType:self.filePathLogs] isHTML:NO];
        
        [self presentViewController:mailViewController animated:NO completion:nil];
    } else {
        NSLog(@"This device not supporting send mails");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToBottom:(id)sender
{
    CGPoint bottomOffset = CGPointMake(0, self.textView.contentSize.height - self.textView.bounds.size.height);
    [self.textView setContentOffset:bottomOffset animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self checkIfBottomScroll];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self checkIfBottomScroll];
}

- (void)checkIfBottomScroll {
    CGPoint offset = self.textView.contentOffset;
    CGRect bounds = self.textView.bounds;
    CGSize size = self.textView.contentSize;
    UIEdgeInsets inset = self.textView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    
    if (y >= h) {
        self.button.hidden = YES;
    } else {
        self.button.hidden = NO;
    }
}


@end
