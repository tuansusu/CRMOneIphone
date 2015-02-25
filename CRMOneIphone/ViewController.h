//
//  ViewController.h
//  CRMOneIphone
//
//  Created by viettel on 2/9/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#include "BaseViewController.h"
#import "MainViewController.h"
#import "MenuViewController.h"
#import "ProcessDataUtil.h"


@interface ViewController : BaseViewController
    {
       __weak IBOutlet UITextField* tf_username;
       __weak IBOutlet UITextField* tf_password;
        __weak IBOutlet UIButton *btnLogin;
        
        __weak IBOutlet UIImageView *imgLogo;
        
        __weak IBOutlet UIImageView *imgBackGroundUserName;
        
        __weak IBOutlet UIImageView *imgBackGroundPassword;
        
    }

@end

