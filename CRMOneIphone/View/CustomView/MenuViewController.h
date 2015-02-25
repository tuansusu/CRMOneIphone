//
//  MenuViewController.h
//  CRMOneIphone
//
//  Created by viettel on 2/14/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImageView+ForScrollView.h"

//#import "DDMenuController.h"
#import "AppDelegate.h"
//viewcontroller function
#import "MainViewController.h"
#import "HelpViewController.h"
#import "ListAccountLeadViewController.h"


@interface MenuViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIView *menuView2;

@property (weak, nonatomic) IBOutlet UIView *footerView;

@property (weak, nonatomic) IBOutlet UIView *DashboardView;

@property (weak, nonatomic) IBOutlet UIView *CongViecView; //Khach hang
@property (weak, nonatomic) IBOutlet UIView *LichHopView;   //hoat dong ban hang
@property (weak, nonatomic) IBOutlet UIView *TienIchView;
@property (weak, nonatomic) IBOutlet UIView *HeThongView;

@property (weak, nonatomic) IBOutlet UILabel *lbDashboard;
@property (weak, nonatomic) IBOutlet UILabel *lbTask;
@property (weak, nonatomic) IBOutlet UILabel *lbMeetingSchedule;
@property (weak, nonatomic) IBOutlet UILabel *lbUtility;
//@property (weak, nonatomic) IBOutlet UILabel *lbSystem;
@property (weak, nonatomic) IBOutlet UIButton *btnLogOut;





@end
