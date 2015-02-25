//
//  AppDelegate.m
//  CRMOneIphone
//
//  Created by viettel on 2/9/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import "AppDelegate.h"

//#import <GoogleMaps/GoogleMaps.h>
//#import "SDKDemoAPIKey.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize callback;


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    callback(buttonIndex);
}

+ (void)showAlertView:(UIAlertView *)alertView
         withCallback:(AlertViewCompletionBlock)callback {
    __block AppDelegate *delegate = [[AppDelegate alloc] init];
    alertView.delegate = delegate;
    delegate.callback = ^(NSInteger buttonIndex) {
        callback(buttonIndex);
        alertView.delegate = nil;
        delegate = nil;
    };
    
    [alertView show];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ////////////<<<<GOOGLE MAP>>>////////////////////
    
//    if ([kAPIKey length] == 0) {
//        // Blow up if APIKey has not yet been set.
//        NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
//        NSString *format = @"Configure APIKey inside SDKDemoAPIKey.h for your "
//        @"bundle `%@`, see README.GoogleMapsSDKDemos for more information";
//        @throw [NSException exceptionWithName:@"SDKDemoAppDelegate"
//                                       reason:[NSString stringWithFormat:format, bundleId]
//                                     userInfo:nil];
//    }
//    [GMSServices provideAPIKey:kAPIKey];
//    services_ = [GMSServices sharedServices];
//    
//    // Log the required open source licenses!  Yes, just NSLog-ing them is not
//    // enough but is good for a demo.
//    NSLog(@"Open source licenses:\n%@", [GMSServices openSourceLicenseInfo]);
//    ////////////<<<<GOOGLE MAP>>>////////////////////
    
    //tuankk test git
    
    self.window.backgroundColor = [UIColor whiteColor];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    //[application setStatusBarStyle:UIBarStyleBlackTranslucent];
    
    //tuannv call copyDatabaseIfNeeded method
    [self copyDatabaseIfNeeded];
    
    
//    if (IS_OS_8_OR_LATER) {
//        self.window.frame = [UIScreen mainScreen].bounds;
//    }
//    
//    RootViewController *rootView = [[RootViewController alloc] init];
//    
//    if (IS_OS_8_OR_LATER) {
//        //set Landscape io8
//        [UIView transitionWithView:window
//                          duration:0.5
//                           options:UIViewAnimationOptionTransitionCrossDissolve
//                        animations:^{
//                            BOOL oldState = [UIView areAnimationsEnabled];
//                            [UIView setAnimationsEnabled:NO];
//                            rootView.view.layer.transform = window.rootViewController.view.layer.transform;
//                            window.rootViewController = rootView;
//                            [UIView setAnimationsEnabled:oldState];
//                        } completion:nil];
//    }else
//    {
//        [window setRootViewController:rootView];
//    }
//    
//    //    [window addSubview:navigationController.view];
//    [window addSubview:navigationController.view];
//    
//    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//Ham dung de khoi tao 1 file database
- (void) copyDatabaseIfNeeded {
    
    //Using NSFileManager we can perform many file system operations.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    //NSString *dbPath = [DataUtil getPathFileSqlLite];
    //BOOL success = [fileManager fileExistsAtPath:dbPath];
    
    
   NSString *dbPath =  [documentsDirectory stringByAppendingPathComponent:DATABASE_NAME];
   BOOL success = [fileManager fileExistsAtPath:dbPath];
    
    if(!success) {
        
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DATABASE_NAME];
        success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        
        if (!success)
            NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
        
    }
    NSLog(@"path:%@", dbPath);
    //    DTOEMPLOYEEACCOUNTProcess *tableProcess = [[DTOEMPLOYEEACCOUNTProcess alloc]init];
    //    NSMutableDictionary *dicEntity = [[NSMutableDictionary alloc]init];
    //    //[dicEntity setValue:@"ID1" forKey:DTOEMPLOYEEACCOUNT_id];
    //    [dicEntity setValue:@"9999" forKey:DTOEMPLOYEEACCOUNT_accountId];
    //    BOOL insertOk =  [tableProcess insertToDBWithEntity:dicEntity];
    //    NSLog(@"insert oko = %d", insertOk);
    //
    //    //Lay du lieu
    //    NSDictionary *dicGetEntity = [tableProcess getObjectWithDataID:@"10"];
    //    NSLog(@"data dic = %@", dicGetEntity);
    //
    //    NSLog(@"%@", [dicGetEntity objectForKey:DTOEMPLOYEEACCOUNT_id]);
    
    //    DTOCONTACTProcess *contactProcess = [DTOCONTACTProcess new];
    //    [contactProcess RenderDataField];
    
    
}

- (void)showRootView{
    ViewController *rootView = [[ViewController alloc] init];
    [self.window setRootViewController:rootView];
}

@end
