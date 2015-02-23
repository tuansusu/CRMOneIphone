//
//  HelpViewController.m
//  CRMOneIphone
//
//  Created by viettel on 2/15/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()
{
    int smgSelect ; //option layout
    NSUserDefaults *defaults;
}
@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([UIDevice getCurrentSysVer] >= 7.0) {
        [UIDevice updateLayoutInIOs7OrAfter:self];
    }
    
    //NSURL *urlFile = [NSURL URLWithString: @"https://crm.mbbank.com.vn/help.html"];
    //NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:urlFile];
    
    NSURL *websiteUrl = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:websiteUrl];
    
    
    [self.webContent loadRequest:urlRequest];
    
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    smgSelect = [[defaults objectForKey:INTERFACE_OPTION] intValue];
    [self updateInterFaceWithOption:smgSelect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateInterFaceWithOption : (int) option
{
    
    //self.barLabel.text = [NSString stringWithFormat:@"%@ %@, %@",VOFFICE,[defaults objectForKey:@"versionSoftware"],COPY_OF_SOFTWARE];
    
    [self.headerViewBar setBackgroundColor:HEADER_VIEW_COLOR1];
    self.fullNameLB.textColor = TEXT_COLOR_HEADER_APP;
    
    
    [self setToDisplayImage:self.view];
    
    //self.footerView.backgroundColor = TOOLBAR_VIEW_COLOR;
    //self.barLabel.textColor = TEXT_TOOLBAR_COLOR1;
    
}


- (IBAction)homeBack:(id)sender {
    [Util backToHome:self];
}



-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //Start the progressbar..
    [SVProgressHUD show];
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //Stop or remove progressbar
    [SVProgressHUD dismiss];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //Stop or remove progressbar and show error
    [SVProgressHUD dismiss];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
