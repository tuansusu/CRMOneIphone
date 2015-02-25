//
//  EditAccountLeadViewController.h
//  CRMOneIphone
//
//  Created by viettel on 2/18/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import "BaseViewController.h"
#import "SelectIndexViewController.h"
#import "Util.h"
#import "TestMapViewController.h"
#import "CalendarPickerViewController.h"

//#import "MJDetailViewController.h"
//#import "UIViewController+MJPopupViewController.h"

@interface EditAccountLeadViewController : BaseViewController
//DATA
@property (nonatomic, retain) NSDictionary *dataSend;
//header



@property (weak, nonatomic) IBOutlet UIScrollView *bodyMainView;

////Header
@property (weak, nonatomic) IBOutlet UIView *headerViewBar;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLB;



@property (weak, nonatomic) IBOutlet UIButton *btnHome;
- (IBAction)homeBack:(id)sender;

//@property (weak, nonatomic) IBOutlet UIView *mainView;

//@property (weak, nonatomic) IBOutlet UIView *headerMainView;
//@property (weak, nonatomic) IBOutlet UILabel *lbTextHeaderMainView;


//@property (weak, nonatomic) IBOutlet UIScrollView *bodyMainView;

@property (weak, nonatomic) IBOutlet UIView *viewMainBodyInfo;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layoutWidthViewMainBodyInfo;

//@property (weak, nonatomic) IBOutlet UIView *viewExpandInfo;

@property (weak, nonatomic) IBOutlet UIButton *btnSave;
- (IBAction)actionSave:(id)sender;


//@property (weak, nonatomic) IBOutlet UIButton *btnClose;
//- (IBAction)actionClose:(id)sender;

////////
/*1*/
@property (weak, nonatomic) IBOutlet UITextField *txtName;
/*1*/
@property (weak, nonatomic) IBOutlet UITextField *txtCompany;
/*1*/
@property (weak, nonatomic) IBOutlet UITextField *txtDateOfBirth;
/*1*/
- (IBAction)actionChoiceDateOfBirth:(id)sender;
/*1*/
@property (weak, nonatomic) IBOutlet UIButton *btnBirthDay;
/*1*/
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
/*1*/
@property (weak, nonatomic) IBOutlet UITextField *txtNumberIdentity;
/*1*/
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
/*1*/
@property (weak, nonatomic) IBOutlet UITextField *txtPersonPosition;
/*1*/
@property (weak, nonatomic) IBOutlet UISegmentedControl *segSex;
/*1*/
@property (weak, nonatomic) IBOutlet UISegmentedControl *segMarialStatus;
@property (weak, nonatomic) IBOutlet UITextField *txtJob;
/*1*/
@property (weak, nonatomic) IBOutlet UITextField *txtMonthlyIncom;
/*1*/
@property (weak, nonatomic) IBOutlet UITextField *txtAddress;
/*1*/
@property (weak, nonatomic) IBOutlet UITextField *txtTotalassets; //tổng tài sản


//@property (weak, nonatomic) IBOutlet UIButton *btnPersonalJob;
//- (IBAction)actionChoicePersonalJob:(id)sender;

//@property (weak, nonatomic) IBOutlet UIButton *btnPersonalPosition;
//- (IBAction)actionChoicePersonalPosition:(id)sender;

////////



//@property (nonatomic,retain) IBOutlet UILabel *barLabel;
//@property (weak, nonatomic) IBOutlet UIView *footerView;

////////////// KHAI BAO BIEN CHUNG//////////
@property (nonatomic, retain) UIPopoverController *listPopover;

////////////// KHAI BAO BIEN CHUNG//////////

//@property (weak, nonatomic) IBOutlet UIButton *btnAddAddress;

//- (IBAction)actionAddAdress:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnCheckMobile;

- (IBAction)actionCheckMobile:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *btnCheckEmail;
- (IBAction)actionCheckMail:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnCheckSMS;

- (IBAction)actionCheckSMS:(id)sender;


//display image in ipad air


@end
