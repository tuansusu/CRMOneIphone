//
//  FileManagerUtil.m
//  Voffice2.1
//
//  Created by Tran Van Bang on 8/7/13.
//
//

#import "FileManagerUtil.h"

@implementation FileManagerUtil

+ (NSString*) getPathWithWithName : (NSString *) fileName
{
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* foofile = [documentsPath stringByAppendingPathComponent:fileName];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:foofile];
    if (fileExists) {
        return foofile;
    }
    return nil;
}

+ (BOOL) checkExitFileWithName : (NSString *) fileName
{
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* foofile = [documentsPath stringByAppendingPathComponent:fileName];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:foofile];
    
    return fileExists;
}

+ (void) removeFileWithName : (NSString *) fileName
{
    if ([FileManagerUtil checkExitFileWithName:fileName]) {
        NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString* deteleFile = [documentsPath stringByAppendingPathComponent:fileName];
        //NSLog(@"deteleFile = %@",deteleFile);
        [[NSFileManager defaultManager] removeItemAtPath: deteleFile error: nil];
    }
   

}


+ (void) removeFilesFromDocuments {
	NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
	NSFileManager* fm = [[NSFileManager alloc] init];
	NSDirectoryEnumerator* en = [fm enumeratorAtPath:path];
	NSError* err = nil;
	BOOL res;
	NSString* file;
	while (file = [en nextObject]) {
        
		if ([file rangeOfString:@".txt"].location == NSNotFound) {
			res = [fm removeItemAtPath:[path stringByAppendingPathComponent:file] error:&err];
			if (!res && err) {
				//NSLog(@"oops: %@", err);
			}
		}
	}
}

@end
