//
//  Constants.h
//  CRMOneIphone
//
//  Created by viettel on 2/9/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#ifndef CRMOneIphone_Constants_h
#define CRMOneIphone_Constants_h

#define FORMAT_TIME @"HH:mm"
#define FORMAT_DATE @"dd/MM/yyyy"
#define FORMAT_DATE_AND_TIME @"yyyy-MM-dd HH:mm:ss.S"

#define PAGESIZE 10
#define HEIGHT_SELECT_INDEX_ROW 44


#define TAG_CONTROL_LINE 511 //tag cua control muon hien thi line phia duoi
#define TAG_DELETE_ITEM 11

/*
 *ios version
 */
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_OS_7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

/*
 *screen size
 */
#define IPHONE_SCREEN_SIZE_35INCH  ([SDiPhoneVersion deviceSize] == iPhone35inch)   
#define IPHONE_SCREEN_SIZE_4INCH  ([SDiPhoneVersion deviceSize] == iPhone4inch) 
#define IPHONE_SCREEN_SIZE_47INCH  ([SDiPhoneVersion deviceSize] == iPhone47inch)
#define IPHONE_SCREEN_SIZE_55INCH  ([SDiPhoneVersion deviceSize] == iPhone55inch)
#define IPHONE_SCREEN_SIZE_UNKNOW  ([SDiPhoneVersion deviceSize] == UnknownSize)


/*
 *key
 */
#define POST_USERNAME @"username"
#define DATABASE_NAME @"bisone.sqlite" //ten csdl


/*
 *function 
 */
#define IntToStr(int) [NSString stringWithFormat:@"%d", int]
#define Int32ToStr(int) [NSString stringWithFormat:@"%ld", int]
#define Int64ToStr(int) [NSString stringWithFormat:@"%lld", int]
#define FloatToStr(float) [NSString stringWithFormat:@"%f", float]
#define ObjectToStr(id) [NSString stringWithFormat:@"%@", id]

#endif
