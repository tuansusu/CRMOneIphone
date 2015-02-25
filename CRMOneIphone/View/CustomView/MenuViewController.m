//
//  MenuViewController.m
//  CRMOneIphone
//
//  Created by viettel on 2/14/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
{
    __weak IBOutlet UILabel *lbGroupCustomer;
    
    __weak IBOutlet UIButton *btnCustomer;
    
    __weak IBOutlet UIButton *btnAccount360;
    
    __weak IBOutlet UIButton *btnOpportunity;
    
    __weak IBOutlet UIButton *btnMap;
    
    __weak IBOutlet UILabel *lbGroupAction;
    
    __weak IBOutlet UIButton *btnTask;
    
    __weak IBOutlet UIButton *btnCalendar;
    
    __weak IBOutlet UILabel *lbGroupUtility;
    
    __weak IBOutlet UIButton *btnReport;
    
    __weak IBOutlet UIButton *btnSetting;
    
    __weak IBOutlet UIButton *btnOptionReply;
    
    __weak IBOutlet UIButton *btnHelp;
    
    __weak IBOutlet UILabel *lbSystem;
    
    __weak IBOutlet UIButton *btnSync;
    
    __weak IBOutlet UIButton *btnCancel;
    
    
    __weak IBOutlet UIScrollView *menuScrolview;
    
    Language *obj;
}
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.menuView2 setBackgroundColor:TOOLBAR_VIEW_COLOR];
    
    [self updateInterFaceWithOption:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CGRect frame = self.view.frame;
    if ([UIDevice getCurrentSysVer] >= 7.0) {
        frame.origin.y = 20;
        self.view.frame = frame;
    }
    CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    sublayer.frame = CGRectMake(frame.size.width - 1.f, 0, .5f, frame.size.height);
    [self.view.layer addSublayer:sublayer];
}


-(void)setupLanguage{
    
    [lbGroupCustomer setText:LocalizedString(@"MENU_GROUP_CUSTOMER")];
    [btnCustomer setTitle:LocalizedString(@"MENU_FUNCTION_ACCOUNTLEAD") forState:UIControlStateNormal];
    [btnAccount360 setTitle:LocalizedString(@"MENU_FUNCTION_ACCOUNT360") forState:UIControlStateNormal];
    [btnOpportunity setTitle:LocalizedString(@"MENU_FUNCTION_OPPORTUNITY") forState:UIControlStateNormal];
    [btnMap setTitle:LocalizedString(@"MENU_FUNCTION_MAP") forState:UIControlStateNormal];
    
    [lbGroupAction setText:LocalizedString(@"MENU_GROUP_ACTION_SALE")];
    [btnTask setTitle:LocalizedString(@"MENU_FUNCTION_TASK") forState:UIControlStateNormal];
    [btnCalendar setTitle:LocalizedString(@"MENU_FUNCTION_CALENDAR") forState:UIControlStateNormal];
    [lbGroupUtility setText:LocalizedString(@"MENU_GROUP_UTILITY")];
    
    [btnReport setTitle:LocalizedString(@"MENU_FUNCTION_REPORT") forState:UIControlStateNormal];
    
    [btnSetting setTitle:LocalizedString(@"MENU_FUNCTION_SETTING") forState:UIControlStateNormal];
    
    [btnOptionReply setTitle:LocalizedString(@"MENU_FUNCTION_OPTION_REPLY") forState:UIControlStateNormal];
    
    [btnHelp setTitle:LocalizedString(@"MENU_FUNCTION_HELP") forState:UIControlStateNormal];
    
    [lbSystem setText:LocalizedString(@"MENU_GROUP_SYSTEM")];
    [btnSync setTitle:LocalizedString(@"MENU_FUNCTION_SYNC") forState:UIControlStateNormal];
    
    [btnCancel setTitle:LocalizedString(@"MENU_FUNCTION_CANCEL") forState:UIControlStateNormal];
    
    
}

- (void) updateInterFaceWithOption : (int) option
{
    
    for (UIView *viewTemp in self.menuView2.subviews) {
        if ([viewTemp isKindOfClass:[UIImageView class]]) {
            
            [((UIImageView*) viewTemp) setAlpha:1.0f];
        }
        
    }
    
    
    self.footerView.backgroundColor = TOOLBAR_VIEW_COLOR;
    self.CongViecView.backgroundColor = [UIColor whiteColor];
    
    for (UIView *viewTemp in self.DashboardView.subviews) {
        if ([viewTemp isKindOfClass:[UIButton class]]) {
            [viewTemp setSelectiveBorderWithColor:BORDER_COLOR withBorderWith:BORDER_WITH withBorderFlag:AUISelectiveBordersFlagTop];
            [((UIButton*) viewTemp) setTitleColor:TEXT_COLOR_MENU_SUB forState:UIControlStateNormal];
            
            continue;
        }
        if ([viewTemp isKindOfClass:[UILabel class]]) {
            
            [((UILabel*) viewTemp) setTextColor:TEXT_COLOR_HOME];
            continue;
        }
        
    }
    
    for (UIView *viewTemp in self.CongViecView.subviews) {
        if ([viewTemp isKindOfClass:[UIButton class]]) {
            [viewTemp setSelectiveBorderWithColor:BORDER_COLOR withBorderWith:BORDER_WITH withBorderFlag:AUISelectiveBordersFlagTop];
            [((UIButton*) viewTemp) setTitleColor:TEXT_COLOR_MENU_SUB forState:UIControlStateNormal];
            continue;
        }
        if ([viewTemp isKindOfClass:[UILabel class]]) {
            
            [((UILabel*) viewTemp) setTextColor:TEXT_COLOR_HOME];
            continue;
        }
        
        if ([viewTemp isKindOfClass:[UIImageView class]]) {
            
            [((UIImageView*) viewTemp) setAlpha:1.0f];
            
            
            continue;
        }
        
        
    }
    
    self.LichHopView.backgroundColor = [UIColor whiteColor];
    
    for (UIView *viewTemp in self.LichHopView.subviews) {
        if ([viewTemp isKindOfClass:[UIButton class]]) {
            [viewTemp setSelectiveBorderWithColor:BORDER_COLOR withBorderWith:BORDER_WITH withBorderFlag:AUISelectiveBordersFlagTop];
            [((UIButton*) viewTemp) setTitleColor:TEXT_COLOR_MENU_SUB forState:UIControlStateNormal];
            continue;
        }
        if ([viewTemp isKindOfClass:[UILabel class]]) {
            
            [((UILabel*) viewTemp) setTextColor:TEXT_COLOR_HOME];
            continue;
        }
        
        if ([viewTemp isKindOfClass:[UIImageView class]]) {
            
            [((UIImageView*) viewTemp) setAlpha:1.0f];
            continue;
        }
        
    }
    
    self.TienIchView.backgroundColor = [UIColor whiteColor];
    
    for (UIView *viewTemp in self.TienIchView.subviews) {
        if ([viewTemp isKindOfClass:[UIButton class]]) {
            [viewTemp setSelectiveBorderWithColor:BORDER_COLOR withBorderWith:BORDER_WITH withBorderFlag:AUISelectiveBordersFlagTop];
            [((UIButton*) viewTemp) setTitleColor:TEXT_COLOR_MENU_SUB forState:UIControlStateNormal];
            continue;
        }
        if ([viewTemp isKindOfClass:[UILabel class]]) {
            
            [((UILabel*) viewTemp) setTextColor:TEXT_COLOR_HOME];
            continue;
        }
        
        if ([viewTemp isKindOfClass:[UIImageView class]]) {
            
            [((UIImageView*) viewTemp) setAlpha:1.0f];
            continue;
        }
        
    }
    
    self.HeThongView.backgroundColor = [UIColor whiteColor];
    
    for (UIView *viewTemp in self.HeThongView.subviews) {
        if ([viewTemp isKindOfClass:[UIButton class]]) {
            [viewTemp setSelectiveBorderWithColor:BORDER_COLOR withBorderWith:BORDER_WITH withBorderFlag:AUISelectiveBordersFlagTop];
            [((UIButton*) viewTemp) setTitleColor:TEXT_COLOR_MENU_SUB forState:UIControlStateNormal];
            continue;
        }
        if ([viewTemp isKindOfClass:[UILabel class]]) {
            
            [((UILabel*) viewTemp) setTextColor:TEXT_COLOR_HOME];
            continue;
        }
        if ([viewTemp isKindOfClass:[UIImageView class]]) {
            
            [((UIImageView*) viewTemp) setAlpha:1.0f];
            continue;
        }
    }
    
    [self.lbDashboard setTextColor:TEXT_COLOR_HOMEPAGE];
    [self.lbTask setTextColor:TEXT_COLOR_HOMEPAGE];
    [self.lbMeetingSchedule setTextColor:TEXT_COLOR_HOMEPAGE];
    [self.lbUtility setTextColor:TEXT_COLOR_HOMEPAGE];
    [lbSystem setTextColor:TEXT_COLOR_HOMEPAGE];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if( buttonIndex ==1 && alertView.tag==3)
    {
        AppDelegate *appDel = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [appDel showRootView];
    }
}




//action menu

//Khach hang dau moi = khach hang tiem nang
- (IBAction)actionDashboard:(id)sender {
    
    MainViewController *targetViewController = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:targetViewController];
    [navi setNavigationBarHidden:YES];
    
    [self.mm_drawerController closeDrawerAnimated:YES completion:NULL];
    [self.mm_drawerController setCenterViewController:navi withCloseAnimation:YES completion:nil];
    
}

//Khach hang dau moi = khach hang tiem nang
- (IBAction)actionPotentialCustomer:(id)sender {
    
    NSLog(@"khach hang tiem nang");
    
    ListAccountLeadViewController *targetViewController = [[ListAccountLeadViewController alloc]initWithNibName:@"ListAccountLeadViewController" bundle:nil];
    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:targetViewController];
    [navi setNavigationBarHidden:YES];
    
    [self.mm_drawerController closeDrawerAnimated:YES completion:NULL];
    [self.mm_drawerController setCenterViewController:navi withCloseAnimation:YES completion:nil];
    
}

- (IBAction)actionAccount360:(id)sender {
    
//    ListAccountViewController *targetViewController = [[ListAccountViewController alloc]initWithNibName:@"ListAccountViewController" bundle:nil];
//    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:targetViewController];
//    [navi setNavigationBarHidden:YES];
//    
//    [self.mm_drawerController closeDrawerAnimated:YES completion:NULL];
//    [self.mm_drawerController setCenterViewController:navi withCloseAnimation:YES completion:nil];
//    
}

- (IBAction)actionOpportunity:(UIButton *)sender {
    
//    ListOpportunityViewController *targetViewController = [[ListOpportunityViewController alloc]initWithNibName:@"ListOpportunityViewController" bundle:nil];
//    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:targetViewController];
//    [navi setNavigationBarHidden:YES];
//    
//    [self.mm_drawerController closeDrawerAnimated:YES completion:NULL];
//    [self.mm_drawerController setCenterViewController:navi withCloseAnimation:YES completion:nil];
    
    
    
}

- (IBAction)actionCalendar:(id)sender {
    
//    FFCalendarViewController *targetViewController =[FFCalendarViewController new];
//    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:targetViewController];
//    [navi setNavigationBarHidden:YES];
//    
//    [self.mm_drawerController closeDrawerAnimated:YES completion:NULL];
//    [self.mm_drawerController setCenterViewController:navi withCloseAnimation:YES completion:nil];
//    
    
}

- (IBAction)actionTask:(id)sender {
    
//    DashboardTaskViewController *targetViewController =[[DashboardTaskViewController alloc] initWithNibName:@"DashboardTaskViewController" bundle:nil];
//    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:targetViewController];
//    [navi setNavigationBarHidden:YES];
//    
//    [self.mm_drawerController closeDrawerAnimated:YES completion:NULL];
//    [self.mm_drawerController setCenterViewController:navi withCloseAnimation:YES completion:nil];
    
    
}


- (IBAction)actionMapView:(id)sender {
    
//    TestMapViewController *targetViewController = [[TestMapViewController alloc]initWithNibName:@"TestMapViewController" bundle:nil];
//    targetViewController.typeMapView = typeMapView_Manager;
//    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:targetViewController];
//    [navi setNavigationBarHidden:YES];
//    
//    [self.mm_drawerController closeDrawerAnimated:YES completion:NULL];
//    [self.mm_drawerController setCenterViewController:navi withCloseAnimation:YES completion:nil];
    
}

- (IBAction)actionComplain:(id)sender {
    
//    ListComplainsViewController *targetViewController = [[ListComplainsViewController alloc]initWithNibName:@"ListComplainsViewController" bundle:nil];
//    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:targetViewController];
//    [navi setNavigationBarHidden:YES];
//    
//    [self.mm_drawerController closeDrawerAnimated:YES completion:NULL];
//    [self.mm_drawerController setCenterViewController:navi withCloseAnimation:YES completion:nil];
    
    
}

- (IBAction)actionHelp:(id)sender {
    
    NSLog(@"action help");
    
    HelpViewController *targetViewController =  [[HelpViewController alloc]initWithNibName:@"HelpViewController" bundle:nil];
    
    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:targetViewController];
    [navi setNavigationBarHidden:YES];
    
    [self.mm_drawerController closeDrawerAnimated:YES completion:NULL];
    [self.mm_drawerController setCenterViewController:navi withCloseAnimation:YES completion:nil];
    
}

- (IBAction)btnProfileAction:(id)sender {
    //    ProfileViewController *profileVC = [[ProfileViewController alloc] init];
    //    [profileVC.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //    [self presentViewController:profileVC animated:YES completion:nil];
    
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
