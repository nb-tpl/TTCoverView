//
//  SgrSandbox.m
//  plu_temp
//
//  Created by li hongdan on 12-11-27.
//  Copyright (c) 2012年 ifeng. All rights reserved.
//

#import "SgrSandbox.h"

@implementation SgrSandbox

+ (NSString *)appPath{
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSAdminApplicationDirectory, NSUserDomainMask, YES);
    
    return [paths objectAtIndex:0];
}
+ (NSString *)docPath{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)documentPath{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)libPrePath{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Preference"];
}
+ (NSString *)libCachePath{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    //    //NSLog(@"%@",paths);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
}

+ (NSString *)libPath{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    
    return [paths objectAtIndex:0];
    
}
+ (NSString *)tmpPath{
    //  NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    //    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/tmp"];
    return   NSTemporaryDirectory();
}

+ (NSString *)touch:(NSString *)path{
    if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:path] )
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:path
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:NULL];
    }
    return path;
}

+ (NSString *)mkdir:(NSString *)path{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDir = NO;
    
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    
    if ( !(isDir == YES && existed == YES) ) {
        // 在 Document 目录下创建一个 head 目录
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return path;
}

+ (BOOL)dirExistsAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL existed = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if ( isDir == YES && existed == YES) {
        return YES;
    }
    return NO;
}

+ (void)remove:(NSString *)path{
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}


@end
