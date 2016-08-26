//
//  MyLogger.h
//  RecordPlay
//
//  Created by mario on 12-6-26.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#if DEBUG

// LOG Console (without args)
#define LOGC(message)         [MyLogger logc:(message) \
                                        file:[[NSString stringWithUTF8String:__FILE__] lastPathComponent] \
                                        line:__LINE__]
// LOG Console (with Args)
#define LOGCA(format, ...)    [MyLogger logc:[NSString stringWithFormat:(format), ##__VA_ARGS__] \
                                        file:[[NSString stringWithUTF8String:__FILE__] lastPathComponent] \
                                        line:__LINE__]
// LOG File (without args)
#define LOGF(message)         [MyLogger logf:(message) \
                                        file:[[NSString stringWithUTF8String:__FILE__] lastPathComponent] \
                                        line:__LINE__]
// LOG File (with Args)
#define LOGFA(format, ...)    [MyLogger logf:[NSString stringWithFormat:(format), ##__VA_ARGS__] \
                                        file:[[NSString stringWithUTF8String:__FILE__] lastPathComponent] \
                                        line:__LINE__]
// LOG Console and File (without args)
#define LOGCF(message)        LOGC(message);LOGF(message)

// LOG Console and File (with Args)
#define LOGCFA(format, ...)   LOGCA(format, __VA_ARGS__);LOGFA(format, __VA_ARGS__)

#elif ALPHA

#define LOGC(message)        
#define LOGCA(format, ...)    
#define LOGF(message)         [MyLogger logf:(message) \
                                        file:[[NSString stringWithUTF8String:__FILE__] lastPathComponent] \
                                        line:__LINE__]
// LOG File (with Args)
#define LOGFA(format, ...)    [MyLogger logf:[NSString stringWithFormat:(format), ##__VA_ARGS__] \
                                        file:[[NSString stringWithUTF8String:__FILE__] lastPathComponent] \
                                        line:__LINE__]
// LOG Console and File (without args)
#define LOGCF(message)        LOGC(message);LOGF(message)

// LOG Console and File (with Args)
#define LOGCFA(format, ...)   LOGCA(format, __VA_ARGS__);LOGFA(format, __VA_ARGS__)

#else

#define LOGC(message);
#define LOGCA(format, ...);
#define LOGF(message);
#define LOGFA(format, ...);
#define LOGCF(message);
#define LOGCFA(format, ...)

#endif

//==========================================================================================================

// crash
#define CRASH(message)              [MyLogger crash:message]
#define CRASHA(format, ...)         [MyLogger crash:[NSString stringWithFormat:(format), ##__VA_ARGS__]]

// except

#define EXCEP(message)      [MyLogger except:message]
#define EXCEPA(format,...)  [MyLogger except:[NSString stringWithFormat:(format), ##__VA_ARGS__]]

//==========================================================================================================

// exception
#if DEBUG || ALPHA

#define XThrowIfError(expression, operation)    \
                                            do {                                        \
                                                    OSStatus __err = expression;            \
                                                    if (__err) {                            \
                                                        NSError *__nserr = [NSError errorWithDomain:NSOSStatusErrorDomain code:__err userInfo:nil]; \
                                                        @throw [NSException exceptionWithName:operation reason:[__nserr localizedFailureReason] userInfo:nil];  \
                                                    }                                       \
                                            } while (0)

#define XPrintIfError(expression, operation)    \
                                            do {                                        \
                                                    OSStatus __err = expression;            \
                                                    if (__err) {                              \
                                                    NSLog(@"%@:%d: %@ error: %d '%c%c%c%c'", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, operation, (signed int)__err, (short)((__err>>24)&255), (short)((__err>>16)&255), (short)((__err>>8)&255), (short)(__err&255));            \
                                                    }                                       \
                                            } while (0)

#define XPrintIfFalse(expression, operation)    \
                                            do {                                        \
                                                    BOOL __ret = expression;                \
                                                    if (!__ret) {                             \
                                                            NSLog(operation);                   \
                                                    }                                       \
                                            } while (0)

#else

#define XThrowIfError(expression, operation)    expression

#define XPrintIfError(expression, operation)    expression

#define XPrintIfFalse(expression, operation)    expression

#endif

// debug time
#ifdef DEBUG

#define DO_DEBUG_TIME_END(file, line)     { NSTimeInterval __debug_time_end = [[NSDate date] timeIntervalSince1970];\
                                NSLog(@"%@:%d: DEBUG TIME: %f", file, line, __debug_time_end - __debug_time_begin);}

#define DEBUG_TIME_BEGIN      NSTimeInterval __debug_time_begin = [[NSDate date] timeIntervalSince1970];
#define DEBUG_TIME_END        DO_DEBUG_TIME_END([[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__)

#define DO_PRINT_TIME(file, line)   NSLog(@"%@:%d: nowtime %f", file, line, [[NSDate date] timeIntervalSince1970]);
#define PRINT_TIME      DO_PRINT_TIME([[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__)

#else

#define DEBUG_TIME_BEGIN      ;
#define DEBUG_TIME_END        ;
#define PRINT_TIME            ;

#endif

//==========================================================================================================
#import <UIKit/UIKit.h>

#if __has_feature(objc_arc)
#define XMRelease(v)
#else
#define XMRelease(v)    [v release]
#endif

@interface MyLogger : NSObject {

}

+ (void)redirectLogConsoleToFile:(BOOL)status overWrite:(BOOL)write;

+ (void)logc:(NSString*)format file:(NSString*)file line:(int)line; // log to console
+ (void)logf:(NSString*)format file:(NSString*)file line:(int)line; // log to file
+ (NSString *)logfileContent;

+ (BOOL)deleteLogfile;

+ (NSString *)logFilePath;

+ (NSString *)crashfileDirectory;
+ (void)crash:(NSString*)format;
+ (NSString *)crashfileContent;
+ (void)deleteCrashfile;
+ (void)archiveCrashfile;
+ (NSString *)crashFilePath;

+ (void)except:(NSString *)format;

+ (void)except:(NSString *)format withData:(NSData*)data;

+ (NSString*)exceptionFileDirectory;

+ (NSString*)exceptionFileContent;

+ (void)deleteExceptionfile;

@end
