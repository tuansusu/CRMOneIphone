//
//  HelpViewController.h
//  CRMOneIphone
//
//  Created by viettel on 2/15/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import "BaseViewController.h"

@interface HelpViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIWebView *webContent;
//
@property (weak, nonatomic) IBOutlet UIView *headerViewBar;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLB;
@property (weak, nonatomic) IBOutlet UIButton *btnHome;
- (IBAction)homeBack:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *mainView;

@end
