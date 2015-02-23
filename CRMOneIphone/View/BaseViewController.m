//
//  BaseViewController.m
//  IphoneFramework
//
//  Created by Tran Van Bang on 6/3/13.
//  Copyright (c) 2012 Viettel. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    numOfSmallWaiting = 0;
    
    
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //self.view.backgroundColor = [UIColor blackColor];

}



//waiting network
- (void) presentSmallWaiting {
	numOfSmallWaiting ++;
    [SVProgressHUD show];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void) dismissSmallWaiting {
	numOfSmallWaiting --;
	if (numOfSmallWaiting < 0) {
		numOfSmallWaiting = 0;
	}
	if (numOfSmallWaiting > 0) {
        [SVProgressHUD show];
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	} else {
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [SVProgressHUD dismiss];
	}
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.

}


-(void) displayNotConnectInternet{

    // Make toast with a title
    [self.view makeToast:@"Mất kết nối internet hoặc không tìm thấy máy chủ"
                duration:3.0
                position:@"bottom"
                   title:@"Cảnh báo !"];

}

-(void) displayErrorData{
    
    // Make toast with a title
    [self.view makeToast:@"Có lỗi dữ liệu trả về từ máy chủ"
                duration:3.0
                position:@"bottom"
                   title:@"Cảnh báo !"];
    
}


//
-(void) doException : (NSException *) ex{
    //ghi loi cho nguoi dung va thong bao
    [LogUtil writeLogWithException:ex];
    //thong bao loi chung chung
    [self.view makeToast:@"Có lỗi xảy ra."
                duration:3.0
                position:@"bottom"
                   title:@"Cảnh báo !"];
}

-(void) doException : (NSException *) ex withMessage : (NSString*) strMessage{
    //ghi loi cho nguoi dung va thong bao
    [LogUtil writeLogWithException:ex];
    //
    [self.view makeToast:strMessage
                duration:3.0
                position:@"bottom"
                   title:@"Cảnh báo !"];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        return YES;
    }
    else if (interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        return YES;
    }
    
    else
        return NO;
    
}

#pragma mark set bottom
/*set bottom line*/
-(void) setBottomLineDetail: (UIView*) scrollViewTemp {
    //NSArray *arrayLabelToSetBottomLine = [scrollViewTemp vi]
    
    for (UIView *viewSub in [scrollViewTemp subviews]) {
        if (viewSub.tag == TAG_CONTROL_LINE) {
            [self addBottomLineWithBottomControl:viewSub.frame withInControl:scrollViewTemp];
        }
    }
}

-(void) addBottomLineWithBottomControl : (CGRect) bottomViewFrame withInControl : (UIView*) containView {
    
    UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, bottomViewFrame.origin.y + bottomViewFrame.size.height, containView.frame.size.width, BORDER_WITH)];
    viewLine.backgroundColor = BORDER_COLOR;
    [viewLine setBorderWithOption:1];
    [containView addSubview:viewLine];
    
}

-(void) setToDisplayImage : (UIView*) viewContainImage{
    for (UIView *viewTemp in viewContainImage.subviews) {
        
        if ([viewTemp isKindOfClass:[UIImageView class]]) {
            
            [((UIImageView*) viewTemp) setAlpha:1.0f];
        }
        
        [self setToDisplayImage:viewTemp];
        
    }
}

@end
