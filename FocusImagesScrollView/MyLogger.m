//
//  Logger.c
//  RecordPlay
//
//  Created by mario on 12-6-26.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyLogger.h"
#define kExceptionFile      @"except.txt"
@implementation MyLogger

+ (void)redirectLogConsoleToFile:(BOOL)status overWrite:(BOOL)write
{
    if(status){
        NSString *logPath = [NSTemporaryDirectory() stringByAppendingFormat:@"log.txt"];
        if(write)
            freopen([logPath fileSystemRepresentation],"w+",stderr);
        else
            freopen([logPath fileSystemRepresentation],"a+",stderr);
    }
}

+ (void)logc:(NSString *)format file:(NSString *)file line:(int)line
{
    NSLog(@"%@:%d: %@", file, line, format);
}

+ (void)logf:(NSString *)format file:(NSString *)file line:(int)line
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *timeStr = [dateFormatter stringFromDate:[NSDate date]];
    //[dateFormatter release];
    XMRelease(dateFormatter);
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingFormat:@"log.txt"];
    NSString *message = [NSString stringWithFormat:@"[%@] %@:%d: %@\n", timeStr, file, line, format];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath] == NO) {
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:[message dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    }
    else {
        NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:filePath];
        [fh seekToEndOfFile];
        [fh writeData:[message dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
}

+ (NSString *)logfileContent
{
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingFormat:@"log.txt"];
    NSString *logstr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    return logstr;
}

+ (BOOL)deleteLogfile
{
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingFormat:@"log.txt"];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        if(error)
            return NO;
    }
    return YES;
}

+ (NSString *)logFilePath
{
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingFormat:@"log.txt"];
    
    return filePath;
}

+ (NSString *)crashfileDirectory
{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [array objectAtIndex:0];
    NSString *dir = [cacheDir stringByAppendingPathComponent:@"crash"];
    [[NSFileManager defaultManager] createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil];
    
    return dir;
}

+ (void)crash:(NSString *)format
{
    NSString *dir = [MyLogger crashfileDirectory];
    NSString *path = [dir stringByAppendingPathComponent:@"crash.txt"];
    NSString *message = [NSString stringWithFormat:@"%@\n", format];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path] == NO) {
        [[NSFileManager defaultManager] createFileAtPath:path contents:[message dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    }
    else {
        NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:path];
        @try {
            [fh seekToEndOfFile];
            [fh writeData:[message dataUsingEncoding:NSUTF8StringEncoding]];
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
     
    }
}

+ (NSString *)crashfileContent
{
    NSString *dir = [MyLogger crashfileDirectory];
    NSString *path = [dir stringByAppendingPathComponent:@"crash.txt"];
    
    NSString *logstr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    return logstr;
}

+ (void)deleteCrashfile
{
    NSString *dir = [MyLogger crashfileDirectory];
    NSString *path = [dir stringByAppendingPathComponent:@"crash.txt"];

    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

+ (NSString *)exceptionFileDirectory
{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [array objectAtIndex:0];
    NSString *dir = [cacheDir stringByAppendingPathComponent:@"except"];
    [[NSFileManager defaultManager] createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil];
    
    return dir;
}

+ (void)except:(NSString *)format
{
    NSString *dir = [MyLogger exceptionFileDirectory];
    NSString *path = [dir stringByAppendingPathComponent:kExceptionFile];
    NSString *message = [NSString stringWithFormat:@"%@\n", format];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path] == NO) {
        [[NSFileManager defaultManager] createFileAtPath:path contents:[message dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    }
    else {
        NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:path];
        @try {
            [fh seekToEndOfFile];
            [fh writeData:[message dataUsingEncoding:NSUTF8StringEncoding]];
            [fh closeFile];
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
        
    }
}

+ (void)except:(NSString *)format withData:(NSData*)data
{

    NSString *dir = [MyLogger exceptionFileDirectory];
    NSString *path = [dir stringByAppendingPathComponent:kExceptionFile];
    NSString *message = [NSString stringWithFormat:@"%@\n", format];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path] == NO) {
        [[NSFileManager defaultManager] createFileAtPath:path contents:[message dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    }
    else {
        NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:path];
        @try {
            [fh seekToEndOfFile];
            [fh writeData:[message dataUsingEncoding:NSUTF8StringEncoding]];
            [fh writeData:data];
            [fh closeFile];
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
        
    }
    
}


+ (NSString *)exceptionFileContent
{
    NSString *dir = [MyLogger exceptionFileDirectory];
    NSString *path = [dir stringByAppendingPathComponent:kExceptionFile];
    
    NSString *logstr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    return logstr;
}

+ (void)deleteExceptionfile
{
    NSString *dir = [MyLogger exceptionFileDirectory];
    NSString *path = [dir stringByAppendingPathComponent:kExceptionFile];
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    if(error){
        LOGC(@"remove file failed");
    }

}


+ (void)archiveCrashfile
{
    NSData *data = [NSData dataWithContentsOfFile:[MyLogger crashFilePath]];
    if (data.length > 0) {
        for (int i=0; ; ++i) {
            NSString *name = [NSString stringWithFormat:@"crash-%d.txt", i];
            NSString *path = [[MyLogger crashfileDirectory] stringByAppendingPathComponent:name];
            
            if ([[NSFileManager defaultManager] fileExistsAtPath:path] == NO) {
                [data writeToFile:path atomically:YES];
                
                break;
            }
        }
    }
}

+ (NSString *)crashFilePath
{
    NSString *dir = [MyLogger crashfileDirectory];
    NSString *path = [dir stringByAppendingPathComponent:@"crash.txt"];
    
    return path;
}

@end