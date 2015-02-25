//
//  ListAccountLeadViewController.h
//  CRMOneIphone
//
//  Created by viettel on 2/16/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import "BaseViewController.h"
#import <MessageUI/MessageUI.h>

#import "DTOACCOUNTLEADProcess.h"
#import "DTOFLLOWUPProcess.h"
#import "UIMenuItem+CXAImageSupport.h"

#import "EditAccountLeadViewController.h"
#import "EditBussinessLeadViewController.h"
#import "SelectIndexViewController.h"
#import "DetailLeadViewController.h"
#import "AccountLeadCell.h"
#import "SearchAdvanceLeadViewController.h"
#import "FlowLeadViewController.h"
#import "TestMapViewController.h"
//
#import "MJDetailViewController.h"
#import "UIViewController+MJPopupViewController.h"

#import "FPPopoverController.h"


//AccountLeadCellDelegate
//SelectIndexDelegate
@interface ListAccountLeadViewController : BaseViewController<UISearchBarDelegate, UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate,AccountLeadCellDelegate, SelectIndexDelegate>



//Header
@property (weak, nonatomic) IBOutlet UIView *headerViewBar;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLB;
@property (weak, nonatomic) IBOutlet UILabel *lbTotal;
@property (weak, nonatomic) IBOutlet UITextField *lbTypeCustomer;
- (IBAction)actionChoiceTypeOfCustomer:(id)sender;

- (IBAction)actionAdd:(id)sender;
- (IBAction)actionAdvanceSearch:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnHome;
- (IBAction)homeBack:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *txtSearchBar;

@property (weak, nonatomic) IBOutlet UIView *mainView;


@property (weak, nonatomic) IBOutlet UIView *rightInMainView;

@property (weak, nonatomic) IBOutlet UITableView *tbData;


////////////// KHAI BAO BIEN CHUNG//////////
@property (nonatomic, retain) UIPopoverController *listPopover;
////////////// KHAI BAO BIEN CHUNG//////////


@end
