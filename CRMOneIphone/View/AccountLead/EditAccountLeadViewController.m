//
//  EditAccountLeadViewController.m
//  CRMOneIphone
//
//  Created by viettel on 2/18/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import "EditAccountLeadViewController.h"

#import "DTOACCOUNTLEADProcess.h"
#import "DTOSYSCATProcess.h"
#import "DataField.h"
#import "FlowLeadViewController.h"
#import "SelectAddInMapsViewController.h"

#define TAG_SELECT_PERSONAL_POSITION 1
#define TAG_SELECT_PERSONAL_JOB 2


#define TEXT_HEADER_ADD_LEADER_PERSON LocalizedString(@"KEY_TEXT_HEADER_ADD_CUSTOMER_PERSON")
#define TEXT_HEADER_EDIT_LEADER_PERSON LocalizedString(@"KEY_TEXT_HEADER_EDIT_CUSTOMER_PERSON")

@interface EditAccountLeadViewController ()
{
    int smgSelect ; //option layout
    NSArray *arrayData; //mang luu tru du lieu
    NSDictionary *dicData; //luu tru du lieu sua
    
    DTOACCOUNTLEADProcess *dtoLeadProcess;
    DTOSYSCATProcess *dtoSyscatProcess; //NGHE NGHIEP CA NHAN
    Util*util;
    //chon index form them moi
    NSInteger selectIndex;
    NSArray *listArr;
    
    int dataId; //xac dinh id de them moi hay sua
    NSUserDefaults *defaults ;
    
    
    //thong tin chon cho loai hinh CA NHAN
    
    int SELECTED_TAG ;
    
    NSInteger selectPersonJobIndex;
    NSArray *listArrPersonJob;
    //thong tin chon cho loai hinh CHUC DANH
    NSInteger selectPersonPositionIndex;
    NSArray *listArrPersonPosition;
    
    BOOL succsess;//Trang thai acap nhat
    
    //key board
    float heightKeyboard;
    UITextField *_txt;
    BOOL isPhone,isEmail,isSMS,isMeeting;
    
    
    //thong tin chon NGAY - THANG
    int SELECTED_DATE_TAG ;
    NSDate  *dateBirthday;
    NSDateFormatter *df;
    
    //luu lai thong tin chon dia chi cua ban do
    float _longitude, _latitude;
}
@end

@implementation EditAccountLeadViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    [self registerForKeyboardNotifications];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    isPhone=NO;
    isEmail=NO;
    isSMS=NO;
    isMeeting=NO;
    _latitude=0;
    _longitude=0;
    [super viewDidLoad];
//    if ([UIDevice getCurrentSysVer] >= 7.0) {
//        [UIDevice updateLayoutInIOs7OrAfter:self];
//    }
    util=[Util new];
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    smgSelect = [[defaults objectForKey:INTERFACE_OPTION] intValue];
    [self updateInterFaceWithOption:smgSelect];
    [self initData];
    
    
    //TINH TOAN THEO MAN HINH
    self.bodyMainView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, 813);
    
    NSLog(@"screen width = %f", [[UIScreen mainScreen] bounds].size.width);
    self.layoutWidthViewMainBodyInfo.constant =[[UIScreen mainScreen] bounds].size.width;
    
    if (IPHONE_SCREEN_SIZE_35INCH) {
        NSLog(@"IPHONE_SCREEN_SIZE_35INCH = %f", self.bodyMainView.frame.size.width);
    }else if (IPHONE_SCREEN_SIZE_4INCH){
        NSLog(@"IPHONE_SCREEN_SIZE_4INCH = %f", self.bodyMainView.frame.size.width);
    }else if(IPHONE_SCREEN_SIZE_47INCH){
        NSLog(@"IPHONE_SCREEN_SIZE_47INCH = %f", self.bodyMainView.frame.size.width);
    }else if (IPHONE_SCREEN_SIZE_55INCH){
        NSLog(@"IPHONE_SCREEN_SIZE_55INCH = %f", self.bodyMainView.frame.size.width);
    }else if(IPHONE_SCREEN_SIZE_UNKNOW){
        NSLog(@"IPHONE_SCREEN_SIZE_UNKNOW = %f", self.bodyMainView.frame.size.width);
    }
    
    
    
    
}

-(void) viewDidAppear:(BOOL)animated{
//    self.viewMainBodyInfo.frame =  CGRectMake(self.viewMainBodyInfo.frame.origin.x, self.viewMainBodyInfo.frame.origin.y, [[UIScreen mainScreen] bounds].size.width, self.viewMainBodyInfo.frame.size.height);
}

-(void) viewWillAppear:(BOOL)animated{
    //self.viewMainBodyInfo.frame =  CGRectMake(self.viewMainBodyInfo.frame.origin.x, self.viewMainBodyInfo.frame.origin.y, [[UIScreen mainScreen] bounds].size.width, self.viewMainBodyInfo.frame.size.height);
}

//khoi tao gia tri mac dinh cua form
-(void) initData {
    
    df = [[NSDateFormatter alloc] init];
   	[df setDateFormat:FORMAT_DATE];
    
    
    _latitude = -1; //khong chon
    _longitude = -1; //khong chon
    
    selectPersonJobIndex = -1;
    selectPersonPositionIndex = -1;
    succsess = NO;
    //self.barLabel.text = [NSString stringWithFormat:@"%@ %@, %@",VOFFICE,[defaults objectForKey:@"versionSoftware"],COPY_OF_SOFTWARE];
    
    dtoLeadProcess = [DTOACCOUNTLEADProcess new];
    arrayData  = [NSArray new];
    arrayData = [dtoLeadProcess filter];
    
    dtoSyscatProcess = [DTOSYSCATProcess new];
    listArrPersonJob = [dtoSyscatProcess filterWithCatType:FIX_SYS_CAT_TYPE_PERSONAL_JOB];
    listArrPersonPosition = [dtoSyscatProcess filterWithCatType:FIX_SYS_CAT_TYPE_PERSONAL_POSITION];
    
    dataId = 0;
    if (self.dataSend) {
        self.fullNameLB.text = TEXT_HEADER_EDIT_LEADER_PERSON;
        [self loadEditData];
    }else{
        self.fullNameLB.text = TEXT_HEADER_ADD_LEADER_PERSON;
    }
    
}

//Load thong tin len form sua
-(void) loadEditData {
    
    NSLog(@"dataSen:%@",_dataSend);
    if (![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_name]]) {
        _txtName.text =[_dataSend objectForKey:DTOLEAD_name];
    }
    if (![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_address]]) {
        _txtAddress.text =[_dataSend objectForKey:DTOLEAD_address];
    }
    if (![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_mobile]]) {
        _txtPhone.text =[_dataSend objectForKey:DTOLEAD_mobile];
    }
    if (![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_organization]]) {
        _txtCompany.text =[_dataSend objectForKey:DTOLEAD_organization];
    }
    
    if (![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_birthday]]) {
        _txtDateOfBirth.text =[_dataSend objectForKey:DTOLEAD_birthday];
    }
    if (![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_email]]) {
        _txtEmail.text =[_dataSend objectForKey:DTOLEAD_email];
    }
    if (![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_identifiedNumber]]) {
        _txtNumberIdentity.text =[_dataSend objectForKey:DTOLEAD_identifiedNumber];
    }
    NSString *strPersonalJob = [_dataSend objectForKey:DTOLEAD_personalJob];
    if (![StringUtil stringIsEmpty:strPersonalJob]) {
        NSArray *arrayPersonJobID = [listArrPersonJob valueForKey:DTOSYSCAT_sysCatId];
        selectPersonJobIndex = [arrayPersonJobID indexOfObject:strPersonalJob];
        if (selectPersonJobIndex>=0) {
            NSDictionary *dataPersonJob = [listArrPersonJob objectAtIndex:selectPersonJobIndex];
            _txtJob.text = [dataPersonJob objectForKey:DTOSYSCAT_name];
        }
    }
    
    NSString *strPersonalPosition = [_dataSend objectForKey:DTOLEAD_personalPosition];
    if (![StringUtil stringIsEmpty:strPersonalPosition]) {
        NSArray *arrayPersonJobID = [listArrPersonPosition valueForKey:DTOSYSCAT_sysCatId];
        selectPersonPositionIndex = [arrayPersonJobID indexOfObject:strPersonalPosition];
        if (selectPersonPositionIndex>=0) {
            NSDictionary *dataPersonJob = [listArrPersonPosition objectAtIndex:selectPersonPositionIndex];
            _txtPersonPosition.text = [dataPersonJob objectForKey:DTOSYSCAT_name];
        }
    }
    
    if (![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_sex]]) {
        if ([[_dataSend objectForKey:DTOLEAD_sex] isEqualToString:@"Nữ"]) {
            _segSex.selectedSegmentIndex = 1;
        }
    }
    
    if (![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_marialStatus]]) {
        if ([[_dataSend objectForKey:DTOLEAD_marialStatus] isEqualToString:@"1"]) {
            _segMarialStatus.selectedSegmentIndex = 1;
        }
    }
    
    
    if (![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_monthlyIncome]]) {
        _txtMonthlyIncom.text =[_dataSend objectForKey:DTOLEAD_monthlyIncome];
    }
    
    if (![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_assetTotal]]) {
        _txtTotalassets.text =[_dataSend objectForKey:DTOLEAD_assetTotal];
    }
    if ([[_dataSend objectForKey:DTOLEAD_disableEmail] isEqualToString:@"1"]) {
        isEmail=YES;
        [_btnCheckEmail setImage:[UIImage imageNamed:@"checkbox_ticked.png"] forState:UIControlStateNormal];
    }
    if ([[_dataSend objectForKey:DTOLEAD_disablePhone] isEqualToString:@"1"]) {
        isPhone=YES;
        [_btnCheckMobile setImage:[UIImage imageNamed:@"checkbox_ticked.png"] forState:UIControlStateNormal];
    }
    if ([[_dataSend objectForKey:DTOLEAD_disableSms ] isEqualToString:@"1"]) {
        isSMS=YES;
        [_btnCheckSMS setImage:[UIImage imageNamed:@"checkbox_ticked.png"] forState:UIControlStateNormal];
    }
    if(![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_lat]]){
        _latitude =[[_dataSend objectForKey:DTOLEAD_lat] floatValue];
    }
    if(![StringUtil stringIsEmpty:[_dataSend objectForKey:DTOLEAD_lon]]){
        _longitude =[[_dataSend objectForKey:DTOLEAD_lon] floatValue];
    }
}


- (void) updateInterFaceWithOption : (int) option
{
    //self.fullNameLB.text = TITLE_APPLICATION;
    [self.headerViewBar setBackgroundColor:HEADER_VIEW_COLOR1];
    self.fullNameLB.textColor = TEXT_COLOR_HEADER_APP;
    
    //self.footerView.backgroundColor = TOOLBAR_VIEW_COLOR;
    //self.barLabel.textColor = TEXT_TOOLBAR_COLOR1;
    //    [self.leftViewHeader setBackgroundColor:BACKGROUND_COLOR_TOP_LEFT_HEADER];
    //    self.leftLabelHeader.textColor = TEXT_COLOR_HEADER_APP;
    
    
    //[self.headerMainView setBackgroundColor:HEADER_SUB_VIEW_COLOR1];
    //[self.headerMainView setSelectiveBorderWithColor:BORDER_COLOR withBorderWith:BORDER_WITH withBorderFlag:AUISelectiveBordersFlagBottom];
    //    for (UIView *viewSubTemp in self.headerMainView.subviews) {
    //
    //
    //        if ([viewSubTemp isKindOfClass:[UILabel class]]) {
    //            ((UILabel*) viewSubTemp).textColor = TEXT_COLOR_REPORT_TITLE_1;
    //        }
    //    }
    
    
    
    
    //[self.mainView setBackgroundColor:HEADER_SUB_VIEW_COLOR1];
    
    self.bodyMainView.backgroundColor = BACKGROUND_NORMAL_COLOR1;
    
    self.bodyMainView.layer.borderWidth = BORDER_WITH;
    self.bodyMainView.layer.borderColor = [BORDER_COLOR CGColor];
    
    //[self.btnSave setStyleNormalWithOption:smgSelect];
    
    
    for (UIView *viewTemp in self.headerViewBar.subviews) {
            if ([viewTemp isKindOfClass:[UIImageView class]]) {
                [((UIImageView*) viewTemp) setAlpha:1.0f];
                continue;
            }
    }
    
    
    for (UIView *viewTemp in self.bodyMainView.subviews) {
        
        
        //        if ([viewTemp isKindOfClass:[UIView class]]) {
        //            ((UIView*) viewTemp).backgroundColor = BACKGROUND_NORMAL_COLOR1;
        //
        //            ((UIView*) viewTemp).layer.borderWidth = BORDER_WITH;
        //            ((UIView*) viewTemp).layer.borderColor = [BORDER_COLOR CGColor];
        //
        //        }
        
        for (UIView *viewSubTemp in viewTemp.subviews) {
            
            
            if ([viewSubTemp isKindOfClass:[UIImageView class]]) {
                [((UIImageView*) viewSubTemp) setAlpha:1.0f];
                continue;
            }
            
            
            if ([viewSubTemp isKindOfClass:[UILabel class]]) {
                ((UILabel*) viewSubTemp).textColor = TEXT_COLOR_REPORT_TITLE_1;
                continue;
            }
            
            
            if ([viewSubTemp isKindOfClass:[UITextView class]]) {
                ((UITextView*) viewSubTemp).textColor = TEXT_COLOR_REPORT;
                ((UITextView*) viewSubTemp).backgroundColor = BACKGROUND_NORMAL_COLOR1;
                ((UITextView*) viewSubTemp).layer.borderColor = [BORDER_COLOR CGColor];
                ((UITextView*) viewSubTemp).layer.borderWidth = BORDER_WITH;
                continue;
                
                
            }
            if ([viewSubTemp isKindOfClass:[UITextField class]]) {
                ((UITextField*) viewSubTemp).textColor = TEXT_COLOR_REPORT;
                ((UITextField*) viewSubTemp).backgroundColor = BACKGROUND_NORMAL_COLOR1;
                //                ((UITextField*) viewSubTemp).layer.borderColor = [BORDER_COLOR CGColor];
                //                ((UITextField*) viewSubTemp).layer.borderWidth = BORDER_WITH;
                [((UITextField*) viewSubTemp) setBorderWithOption:smgSelect];
                [((UITextField*) viewSubTemp) setPaddingLeft];
                continue;

            }
            
        }
        
        if ([viewTemp isKindOfClass:[UIButton class]]) {
            if(viewTemp.tag!=10){
                [((UIButton*) viewTemp) setStyleNormalWithOption:smgSelect];
            }
            continue;
        }
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) actionSave:(id)sender{
    //check valid to save
    
    if (![util checkValidToSave:_txtName :@"Anh/Chị chưa nhập tên khách hàng" :self.viewMainBodyInfo]) {
        return;
    }
    if(![util checkValidToSave:_txtPhone :@"Anh/Chị chưa nhập số điện thoại khách hàng" :_viewMainBodyInfo]){
        return;
    }
    if(_txtEmail.text.length>0 && ![util validateEmail:_txtEmail.text]){
        
        [util showTooltip:_txtEmail withText:@"Email không đúng định dạng" showview:_viewMainBodyInfo];
        [util setBorder:_txtEmail];
        return;
    }
    
    //neu qua duoc check thi tien hanh luu du lieu
    NSMutableDictionary *dicEntity = [NSMutableDictionary new];
    
    
    
    [dicEntity setObject:[StringUtil trimString:_txtName.text] forKey:DTOLEAD_name];
    [dicEntity setObject:[StringUtil trimString:_txtNumberIdentity.text] forKey:DTOLEAD_identifiedNumber];
    [dicEntity setObject:[StringUtil trimString:_txtAddress.text] forKey:DTOLEAD_address];
    [dicEntity setObject:[StringUtil trimString:_txtPhone.text]forKey:DTOLEAD_mobile];
    [dicEntity setObject:[StringUtil trimString:_txtCompany.text] forKey:DTOLEAD_organization];
    
    
    [dicEntity setObject:[StringUtil trimString:_txtDateOfBirth.text] forKey:DTOLEAD_birthday];
    
    [dicEntity setObject:[StringUtil trimString:_txtEmail.text] forKey:DTOLEAD_email];
    if(_longitude>0){
        NSString *myLon=[NSString stringWithFormat:@"%f",_longitude];
        [dicEntity setObject:myLon forKey:DTOLEAD_lon];
    }
    if(_latitude>0){
        NSString *myLat=[NSString stringWithFormat:@"%f",_latitude];
        [dicEntity setObject:myLat forKey:DTOLEAD_lat];
    }
    if (isPhone) {
        [dicEntity setObject:@"1" forKey:DTOLEAD_disablePhone];
    }
    else{
        [dicEntity setObject:@"0" forKey:DTOLEAD_disablePhone];
    }
    if (isEmail) {
        [dicEntity setObject:@"1" forKey:DTOLEAD_disableEmail];
    }
    else{
        [dicEntity setObject:@"0" forKey:DTOLEAD_disableEmail];
    }
    if (isSMS) {
        [dicEntity setObject:@"1" forKey:DTOLEAD_disableSms];
    }
    else{
        [dicEntity setObject:@"0" forKey:DTOLEAD_disableSms];
    }
    if (isMeeting) {
        [dicEntity setObject:@"1" forKey:DTOLEAD_disableMeeting];
    }
    else{
        [dicEntity setObject:@"0" forKey:DTOLEAD_disableMeeting];
    }
    
    
    //xac dinh chuc danh
    if (selectPersonJobIndex>=0) {
        [dicEntity setObject:[[listArrPersonJob objectAtIndex:selectPersonJobIndex] objectForKey:DTOSYSCAT_sysCatId] forKey:DTOLEAD_personalJob];
    }
    //nghe nghiep
    if (selectPersonPositionIndex>=0) {
        [dicEntity setObject:[[listArrPersonPosition objectAtIndex:selectPersonPositionIndex] objectForKey:DTOSYSCAT_sysCatId] forKey:DTOLEAD_personalPosition];
    }
    
    
    if (self.segSex.selectedSegmentIndex == 0) {
        [dicEntity setObject:@"Nam" forKey:DTOLEAD_sex];
    }else{
        [dicEntity setObject:@"Nữ" forKey:DTOLEAD_sex];
    }
    
    if (self.segSex.selectedSegmentIndex == 0) {
        [dicEntity setObject:@"0" forKey:DTOLEAD_marialStatus];
    }else{
        [dicEntity setObject:@"1" forKey:DTOLEAD_marialStatus];
    }
    
    [dicEntity setObject:[StringUtil trimString:_txtMonthlyIncom.text] forKey:DTOLEAD_monthlyIncome];
    [dicEntity setObject:[StringUtil trimString:_txtTotalassets.text] forKey:DTOLEAD_assetTotal];
    [dicEntity setObject:@"0" forKey:DTOLEAD_leadType];
    [dicEntity setObject:@"1" forKey:DTOLEAD_status];
    [dicEntity setObject:[DateUtil formatDate:[NSDate new] :@"yyyy-MM-dd HH:mm:ss.S"] forKey:DTOLEAD_updatedDate];
    
    if (self.dataSend) {
        
        [dicEntity setObject:[_dataSend objectForKey:DTOLEAD_id] forKey:DTOLEAD_id];
    }else{
        [dicEntity setObject:IntToStr([dtoLeadProcess getClientId]) forKey:DTOLEAD_clientLeadId];
    }
    succsess = [dtoLeadProcess insertToDBWithEntity:dicEntity];
    
    if (succsess) {
        //Thong bao cap nhat thanh cong va thoat
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thông báo" message:@"Cập nhật thành công, tiếp tục nhập?" delegate:self cancelButtonTitle:@"Không" otherButtonTitles:@"Có", nil];
        alert.tag = 5;
        [alert show];
        
    }else{
        //khong bao nhap loi - lien he quan tri
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thông báo" message:@"Sảy ra lỗi, vui lòng thử lại hoặc gửi log đến quản trị" delegate:self cancelButtonTitle:@"Thoát" otherButtonTitles:nil];
        alert.tag = 6;
        [alert show];
    }
    
}

-(void) actionClose:(id)sender{
    
}

-(void) homeBack:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0 && alertView.tag ==1) {
        
        
    }
    if (succsess && alertView.tag == 5 && buttonIndex == 0) { //thong bao dong form
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    if (succsess && alertView.tag == 5 && buttonIndex == 1) {
        //reset lai form
        [self resetForm];
    }
}

-(void) resetForm {
    for (UIView *viewTemp in self.bodyMainView.subviews) {
        
        for (UIView *viewSubTemp in viewTemp.subviews) {
            
            if ([viewSubTemp isKindOfClass:[UITextView class]]) {
                ((UITextView*) viewSubTemp).text = @"";
            }
            if ([viewSubTemp isKindOfClass:[UITextField class]]) {
                ((UITextField*) viewSubTemp).text = @"";
            }
            
        }
    }
    selectPersonJobIndex = -1;
    selectPersonPositionIndex = -1;
    succsess = false;
    
    [self hiddenKeyBoard];
    
}

-(void) hiddenKeyBoard {
    for (UIView *viewTemp in _bodyMainView.subviews) {
        for (UIView *subViewTemp in viewTemp.subviews) {
            
            if([subViewTemp isKindOfClass:[UITextField class]]){
                [(UITextField *)subViewTemp resignFirstResponder];
            }
            
            
        }
    }
}


- (IBAction)actionChoicePersonalJob:(id)sender {
    
    //hide all key
    [self hiddenKeyBoard];
    
    SELECTED_TAG = TAG_SELECT_PERSONAL_JOB;
//    SelectIndexViewController *detail = [[SelectIndexViewController alloc] initWithNibName:@"SelectIndexViewController" bundle:nil];
//    
//    detail.selectIndex = selectPersonJobIndex;
//    
//    detail.listData = [listArrPersonJob valueForKey:DTOSYSCAT_name];
//    
//    self.listPopover = [[UIPopoverController alloc]initWithContentViewController:detail];
//    CGRect popoverFrame = _btnPersonalJob.frame;
//    
//    detail.delegate =(id<SelectIndexDelegate>) self;
//    self.listPopover.delegate = (id<UIPopoverControllerDelegate>)self;
//    [self.listPopover setPopoverContentSize:CGSizeMake(320,250) animated:NO];
//    [self.listPopover presentPopoverFromRect:popoverFrame inView:self.viewExpandInfo permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
}
- (IBAction)actionChoicePersonalPosition:(id)sender {
    
    //hide all key
    [self hiddenKeyBoard];
    
//    SELECTED_TAG = TAG_SELECT_PERSONAL_POSITION;
//    SelectIndexViewController *detail = [[SelectIndexViewController alloc] initWithNibName:@"SelectIndexViewController" bundle:nil];
//    
//    detail.selectIndex = selectPersonPositionIndex;
//    
//    detail.listData = [listArrPersonPosition valueForKey:DTOSYSCAT_name];
//    
//    self.listPopover = [[UIPopoverController alloc]initWithContentViewController:detail];
//    CGRect popoverFrame = _btnPersonalPosition.frame;
//    
//    detail.delegate =(id<SelectIndexDelegate>) self;
//    self.listPopover.delegate = (id<UIPopoverControllerDelegate>)self;
//    [self.listPopover setPopoverContentSize:CGSizeMake(320,250) animated:NO];
//    [self.listPopover presentPopoverFromRect:popoverFrame inView:self.viewMainBodyInfo permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

#pragma mark check valid data


#pragma mark UITextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.txtName) {
        [textField resignFirstResponder];
        
        [self.txtNumberIdentity becomeFirstResponder];
        
        return NO;
    }
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (textField == self.txtName) {
        return YES;
    }
    
    //    float height = 190;
    //    if (textField == _txtTotalassets || textField == _txtAddress) {
    //        height = 230;
    //    }
    //
    //    [UIView beginAnimations:nil context:NULL];
    //    [UIView setAnimationDuration:0.25f];
    //
    //    CGRect frame = self.mainView.frame;
    //    frame.origin.y = frame.origin.y - height;
    //    [self.mainView setFrame:frame];
    //
    //    [UIView commitAnimations];
    
    return  YES;
    
}// return NO to disallow editing.

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}// became first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return  YES;
}// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    //    if (textField == self.txtName) {
    //        return;
    //    }
    //
    //    float height = 190;
    //    if (textField == _txtTotalassets || textField == _txtAddress) {
    //        height = 230;
    //    }
    //
    //    [UIView beginAnimations:nil context:NULL];
    //    [UIView setAnimationDuration:0.25f];
    //    CGRect frame = self.mainView.frame;
    //    frame.origin.y = frame.origin.y + height;
    //    [self.mainView setFrame:frame];
    //
    //    [UIView commitAnimations];
    
}// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return  YES;
}// return NO to not change text

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}// called when clear button pressed. return NO to ignore (no notifications)
//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    return  YES;
//}// called when 'return' key pressed. return NO to ignore.


#pragma mark SelectIndexDelegate

-(void) selectAtIndex:(NSInteger)index{
    
    if (self.listPopover) {
        [ self.listPopover dismissPopoverAnimated:YES];
    }
    
    switch (SELECTED_TAG) {
        case TAG_SELECT_PERSONAL_POSITION:
        {
            selectPersonPositionIndex = index;
            if (index<listArrPersonPosition.count) {
                NSDictionary *dic = [listArrPersonPosition objectAtIndex:index];
                _txtPersonPosition.text = [dic objectForKey:DTOSYSCAT_name];
            }
        }
            break;
        case TAG_SELECT_PERSONAL_JOB:{
            selectPersonJobIndex = index;
            if (index<listArrPersonJob.count) {
                NSDictionary *dic = [listArrPersonJob objectAtIndex:index];
                _txtJob.text = [dic objectForKey:DTOSYSCAT_name];
            }
        }
            break;
            
        default:
            break;
    }
    
}


#pragma mark UITextField


// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}
// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    if (kbSize.width>0) {
        heightKeyboard = kbSize.width;
    }
    
    
    self.bodyMainView.contentSize = CGSizeMake(self.bodyMainView.frame.size.width, self.bodyMainView.frame.size.height + heightKeyboard);
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, heightKeyboard, 0.0);
    self.bodyMainView.contentInset = contentInsets;
    self.bodyMainView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    //CGRect aRect = self.view.frame;
    CGRect aRect = CGRectMake(0, 0, 1024, 768);
    aRect.size.height -= kbSize.width;
    if (!CGRectContainsPoint(aRect, _txt.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, _txt.frame.origin.y-heightKeyboard);
        [self.bodyMainView setContentOffset:scrollPoint animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    
    if(self.bodyMainView.contentSize.height>self.bodyMainView.frame.size.height){
        self.bodyMainView.contentSize = CGSizeMake(self.bodyMainView.frame.size.width, self.bodyMainView.frame.size.height - heightKeyboard);
        
        
        UIEdgeInsets contentInsets = UIEdgeInsetsZero;
        self.bodyMainView.contentInset = contentInsets;
        self.bodyMainView.scrollIndicatorInsets = contentInsets;
    }
}
- (IBAction)actionAddAdress:(id)sender {
    
    //chọn địa điểm
    
    //neu la luc them moi
    
    //neu la luc sua
    
    TestMapViewController *detail = [[TestMapViewController alloc] initWithNibName:@"TestMapViewController" bundle:nil];
    
    if (self.dataSend) {
        if (![StringUtil stringIsEmpty:[self.dataSend objectForKey:DTOACCOUNT_lat]]) {
            float fLon = [[self.dataSend objectForKey:DTOACCOUNT_lon] floatValue];
            float fLan =[[self.dataSend objectForKey:DTOACCOUNT_lat] floatValue];
            detail.lan = fLan;
            detail.lon = fLon;
            //viewController.address = [dicData objectForKey:DTOLEAD_address];
            if ([StringUtil stringIsEmpty:[dicData objectForKey:DTOACCOUNT_address]]) {
                detail.address = [dicData objectForKey:DTOACCOUNT_address];
            }else{
                detail.address = @"";
            }
            
        }
    }
    
    detail.typeMapView = typeMapView_Choice;
    detail.selectMapDelegate = self;
    [self presentViewController:detail animated:YES completion:nil];
    
}

#pragma mark SelectMap Delegate
//-(void) selectAddress:(GMSAddress *)addressObj{
//    
//    NSLog(@"coordinate.latitude=%f", addressObj.coordinate.latitude);
//    NSLog(@"coordinate.longitude=%f", addressObj.coordinate.longitude);
//    NSLog(@"thoroughfare=%@", addressObj.thoroughfare);
//    NSLog(@"locality=%@", addressObj.locality);
//    NSLog(@"subLocality=%@", addressObj.subLocality);
//    NSLog(@"administrativeArea=%@", addressObj.administrativeArea);
//    NSLog(@"postalCode=%@", addressObj.postalCode);
//    NSLog(@"country=%@", addressObj.country);
//    NSLog(@"lines=%@", addressObj.lines);
//    
//    
//    _longitude = addressObj.coordinate.longitude;
//    _latitude = addressObj.coordinate.latitude;
//    
//    
//    
//    if (addressObj.lines.count>0) {
//        self.txtAddress.text =[addressObj.lines objectAtIndex:0];
//    }
//    
//}

- (IBAction)actionCheckMobile:(id)sender {
    if(isPhone==NO){
        isPhone=YES;
        [_btnCheckMobile setImage:[UIImage imageNamed:@"checkbox_ticked.png"] forState:UIControlStateNormal];
    }
    else if(isPhone==YES){
        isPhone=NO;
        [_btnCheckMobile setImage:[UIImage imageNamed:@"checkbox_not_ticked.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)actionCheckMail:(id)sender {
    if(isEmail==NO){
        isEmail=YES;
        [_btnCheckEmail setImage:[UIImage imageNamed:@"checkbox_ticked.png"] forState:UIControlStateNormal];
    }
    else if(isEmail==YES){
        isEmail=NO;
        [_btnCheckEmail setImage:[UIImage imageNamed:@"checkbox_not_ticked.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)actionCheckSMS:(id)sender {
    if (isSMS==NO) {
        isSMS=YES;
        [_btnCheckSMS setImage:[UIImage imageNamed:@"checkbox_ticked.png"] forState:UIControlStateNormal];
    }
    else if(isSMS==YES){
        isSMS=NO;
        [_btnCheckSMS setImage:[UIImage imageNamed: @"checkbox_not_ticked.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)actionChoiceDateOfBirth:(id)sender {
    
    [self hiddenKeyBoard];
    
    if (self.txtDateOfBirth.text.length==0) {
        dateBirthday = [DateUtil getDateFromString:@"01/01/2000" :FORMAT_DATE];
    }else{
        dateBirthday = [DateUtil getDateFromString:self.txtDateOfBirth.text :FORMAT_DATE];
    }
    
    //SELECTED_DATE_TAG = TAG_SELECT_DATE_BIRTHDAY;
    CalendarPickerViewController *detail = [[CalendarPickerViewController alloc] initWithNibName:@"CalendarPickerViewController" bundle:nil];
    detail.dateSelected = dateBirthday;
    self.listPopover = [[UIPopoverController alloc]initWithContentViewController:detail];
    CGRect popoverFrame = self.btnBirthDay.frame;
    
    detail.delegateDatePicker =(id<CalendarSelectDatePickerDelegate>) self;
    [self.listPopover setPopoverContentSize:CGSizeMake(320, 260) animated:NO];
    
    
    [self.listPopover presentPopoverFromRect:popoverFrame inView:self.viewMainBodyInfo permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

#pragma mark select date
-(void) selectDatePickerWithDate:(NSDate *)date
{
    
    self.txtDateOfBirth.text = [NSString stringWithFormat:@"%@",
                                [df stringFromDate:date]];
    dateBirthday = date;
    
}

-(void) dismissPopoverView
{
    if ([self.listPopover isPopoverVisible])
        [self.listPopover dismissPopoverAnimated:YES];
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
