//
//  LogUtil.h
//  Voffice2.1
//
//  Created by VTIT on 9/10/13.
//
//

#import <Foundation/Foundation.h>

@interface LogUtil : NSObject

+(NSString*) createFileNameWithDate : (NSDate *) date;
+(void) writeLogWithContent : (NSString*) content;
+(NSString*) readLogWithDate : (NSDate*) date;
+(void) writeLogWithException:(NSException *)ex;


@end
