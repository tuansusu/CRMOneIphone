//
//  SearchAdvanceLeadViewController.h
//  CRMOneIphone
//
//  Created by viettel on 2/18/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchAdvanceDelegate <NSObject>

-(void) actionSearchAdvanceWithCode : (NSString*) strCode withName : (NSString*) strName withMobile : (NSString*) strMobile withEmail : (NSString*) strEmail;
-(void) dismissPopoverView;
@end

@interface SearchAdvanceLeadViewController : UIViewController

@property (weak,nonatomic) id <SearchAdvanceDelegate> advanceSearchDelegate;

@end
