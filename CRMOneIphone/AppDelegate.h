//
//  AppDelegate.h
//  CRMOneIphone
//
//  Created by viettel on 2/9/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    id services_;
}

@property (strong, nonatomic) UIWindow *window;

typedef void (^AlertViewCompletionBlock)(NSInteger buttonIndex);
@property (strong,nonatomic) AlertViewCompletionBlock callback;

+ (void)showAlertView:(UIAlertView *)alertView withCallback:(AlertViewCompletionBlock)callback;



- (void)showRootView;

@end

