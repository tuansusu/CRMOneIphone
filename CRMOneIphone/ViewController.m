//
//  ViewController.m
//  CRMOneIphone
//
//  Created by viettel on 2/9/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    NSUserDefaults *defaults;
    MainViewController *mainView;
    NSString *versionSoftware;
    Language *obj;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ProcessDataUtil *dataUtil = [[ProcessDataUtil alloc]init];
    [dataUtil writeLogMethod];
    
    //set init form
    [self initData];
    //set init form
    
    //ngon ngu
    obj=[Language getInstance];
    obj.str = [defaults objectForKey:@"Language"];
    if ([StringUtil stringIsEmpty:obj.str] ) {
        obj.str = @"vi";
        [defaults setObject:@"vi" forKey:@"Language"];
    }
    
    LocalizationSetLanguage(obj.str);
    [self setUpLanguage];
    //ngon ngu
    
    
    //Hien thi anh cua form
    [self setToDisplayImage:self.view];
    //Hien thi anh cua form
    
    
    //giao dien
    NSString *interfaceOption = [defaults objectForKey:INTERFACE_OPTION];
    
    if (!interfaceOption || [interfaceOption isEqualToString:@"(null)"]) {
        [defaults setObject:@"1" forKey:INTERFACE_OPTION];
        
        interfaceOption = @"1";
    }
    
    [self updateInterFaceWithOption: [interfaceOption intValue]];
    
    //giao dien
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) updateInterFaceWithOption : (int) option
{
    for (UIView *viewTemp in self.view.subviews) {
        
        if ([viewTemp isKindOfClass:[UIButton class]]) {
            
            
        }
    }
}

-(void) initData {
    
    //get version
    NSDictionary *dTmp=[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"]];
    versionSoftware = [dTmp objectForKey:@"CFBundleShortVersionString"];
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:versionSoftware forKey:@"versionSoftware"];
    
    NSString *userNameStr = [defaults objectForKey:@"userName"];
    if (userNameStr) {
        tf_username.text = userNameStr;
        [tf_password becomeFirstResponder];
    }
    else
    {
        tf_username.text =@"";
        [tf_username becomeFirstResponder];
    }
    
    //self.lblVersion.text = [NSString stringWithFormat:@"%@ %@, %@",VOFFICE,[defaults objectForKey:@"versionSoftware"],COPY_OF_SOFTWARE];
    
    //tf_username.text = macAddress;
    if ([UIDevice getCurrentSysVer] >= 7.0) {
        [UIDevice updateLayoutInIOs7OrAfter:self];
    }
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.view.backgroundColor = [UIColor blackColor];
}


#pragma mark - Actions
- (IBAction) login_click: (id) sender {
    [self logIn];
    [tf_password resignFirstResponder];
    [tf_username resignFirstResponder];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == tf_password || textField == tf_username) {
        [textField resignFirstResponder];
        [self logIn];
        return NO;
    }
    return YES;
}
- (void) logIn
{
    
    AppDelegate *appDel = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    MainViewController *viewController =   [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    //viewController.userData = modelEvent.modelData;
    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [navi setNavigationBarHidden:YES];
    
    MenuViewController *leftController = [[MenuViewController alloc] init];
    
    MMDrawerController *drawerControllerMainProgramHome = [[MMDrawerController alloc]
                                                           initWithCenterViewController:navi
                                                           leftDrawerViewController:leftController
                                                           rightDrawerViewController:NULL];
    [drawerControllerMainProgramHome setShouldStretchDrawer:FALSE];
    [drawerControllerMainProgramHome setMaximumLeftDrawerWidth:259];
    [drawerControllerMainProgramHome setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerControllerMainProgramHome setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [UIView transitionWithView:appDel.window
                      duration:0.8
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^(void) {
                        BOOL oldState = [UIView areAnimationsEnabled];
                        [UIView setAnimationsEnabled:NO];
                        [appDel.window setRootViewController:drawerControllerMainProgramHome];
                        [UIView setAnimationsEnabled:oldState];
                    }
                    completion:nil];
    
    return;
    
    if ([self validate]) {
        
        //        if ([[NetworkHelper sharedManager] isNetworkAvaiable] == NO )  {
        //            [AlertViewUtils showAlertViewWithTitle:KEY_NOTIFICATION_TITLE message:VLD_01_005 delegate:self withTag:0 withTitleButtonCancel:nil withTitleButtonOther:KEY_NOTIFICATION_OTHER];
        //        } else  {
        //[ListMeetingProcess deleteAllObject];
        NSString *username = [[StringUtil trimString:tf_username.text] lowercaseString];
        NSString *password = [StringUtil trimString:tf_password.text];
        /**
         *  Tam thoi kiem tra login success/fail bang cach nay
         */
        
        
//        NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
//        [dic setObject: username forKey: @"loginName" ];
//        [dic setObject: password forKey: @"password" ];
//        ActionEvent* actionEvent = [[ActionEvent alloc] init];
//        actionEvent.action = login;
//        actionEvent.viewData = dic;
//        actionEvent.sender = self;
//        [[AppController getController] handleViewEvent:actionEvent];
        
        defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:tf_username.text forKey:POST_USERNAME];
        [defaults synchronize];
        
        
        //}
    }
}


/**
 *  Author: luongdv3
 *  - Validate login form
 *
 *  @return
 */
- (BOOL) validate {
    // Check username
    NSString *strUserName = [StringUtil trimString:tf_username.text];
    if (strUserName.length ==0) { //Chua nhap username
        tf_username.text =@"";
        [AlertViewUtils showAlertViewWithTitle:KEY_NOTIFICATION_TITLE message:VLD_01_001 delegate:self withTag:11 withTitleButtonCancel:nil withTitleButtonOther:KEY_NOTIFICATION_OTHER];
        return NO;
    }
    
    NSRange ranger = [strUserName rangeOfString:@" "];
    if (strUserName.length>100 || ranger.location < strUserName.length) {//username khong hop le khi >100 ky tu hoac co ky tu khoang trang
        [AlertViewUtils showAlertViewWithTitle:KEY_NOTIFICATION_TITLE message:VLD_01_002 delegate:self withTag:12 withTitleButtonCancel:nil withTitleButtonOther:KEY_NOTIFICATION_OTHER];
        return NO;
    }
    NSString *strPassword = [StringUtil trimString:tf_password.text];
    if (strPassword.length==0) { //Chua nhap password
        [AlertViewUtils showAlertViewWithTitle:KEY_NOTIFICATION_TITLE message:VLD_01_003 delegate:self withTag:13 withTitleButtonCancel:nil withTitleButtonOther:KEY_NOTIFICATION_OTHER];
        return NO;
    }
    NSRange rangerPassword = [strPassword rangeOfString:@" "];
    if (strPassword.length>100 || rangerPassword.location < strPassword.length) { //Password khong hop le
        [AlertViewUtils showAlertViewWithTitle:KEY_NOTIFICATION_TITLE message:VLD_01_002 delegate:self withTag:14 withTitleButtonCancel:nil withTitleButtonOther:KEY_NOTIFICATION_OTHER];
        return NO;
    }
    
    return YES;
}


/**
 *  Author: luongdv3
 *  @param alertView
 *  @param buttonIndex
 */
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (alertView.tag) {
        case 11: //Chua nhap username
            [tf_username becomeFirstResponder];
            break;
        case 12: //username khong hop le
            tf_password.text = @"";
            [tf_username becomeFirstResponder];
            break;
        case 13: //Chua nhap password
            [tf_password becomeFirstResponder];
            break;
        case 14: //Password khong hop le
            tf_password.text = @"";
            [tf_password becomeFirstResponder];
            break;
        case 15: //login failed
            tf_password.text = @"";
            [tf_username becomeFirstResponder];
            break;
        default:
            break;
    }
}


#pragma mark CONFIG LAYOUT
//Config multil layout
-(void) refeshMultilLayout {
    
    DeviceSize deviceSize = [SDiPhoneVersion deviceSize];
    switch (deviceSize) {
        case iPhone35inch:
            break;
            case iPhone4inch:
            break;
            case iPhone47inch:
            break;
            case iPhone55inch:
            break;
            
        default:
            break;
    }
    
}

#pragma mark  LANGUAGE
- (IBAction)vietnamLanguageChoose:(id)sender {
    obj.str=@"vi";
    LocalizationSetLanguage(@"vi");
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:obj.str forKey:@"Language"];
    [self setUpLanguage];
    
}

- (IBAction)englishLanguageChoose:(id)sender {
    obj.str=@"en";
    LocalizationSetLanguage(@"en");
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:obj.str forKey:@"Language"];
    [self setUpLanguage];
}

-(void)setUpLanguage{
    [tf_username setPlaceholder:LocalizedString(@"KEY_ACCOUNT")];
    [tf_password setPlaceholder:LocalizedString(@"KEY_PASSWORD")];
    [btnLogin setTitle:LocalizedString(@"KEY_LOGIN") forState:UIControlStateNormal];
    //[self.btnGioiThieu setTitle:LocalizedString(@"KEY_ABOUT") forState:UIControlStateNormal];
}

@end
