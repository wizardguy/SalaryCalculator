//
//  BFCommonUtil.h
//  SpringExhibition
//
//  Created by Dennis on 4/7/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <assert.h>
#import <pthread.h>

#ifndef ONLINE_VERSION
#define NSLog(format, ...) do {                                                 \
fprintf(stderr, "<%s : %d> %s\n",                                               \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "-------\n");                                               \
} while (0)

#else
#define NSLog(...) {}
#endif


//System version utils
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//大于等于7.0的ios版本
#define iOS7_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
//大于等于7.1的ios版本
#define iOS7_1_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.1")
//大于等于8.0的ios版本
#define iOS8_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")
//大于等于8.2的ios版本
#define iOS8_2_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.2")
//大于等于9.0的ios版本
#define iOS9_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0")

//小于ios9的ios版本
#define iOS_LESS_THAN_9 SYSTEM_VERSION_LESS_THAN(@"9.0")
//小于ios8的ios版本
#define iOS_LESS_THAN_8 SYSTEM_VERSION_LESS_THAN(@"8.0")


#define WS(weakSelf)    __weak __typeof(&*self)weakSelf = self

static inline BOOL BFThreadIsMain()
{
    return 0 != pthread_main_np();
}

#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

#define IsNilOrNull(_ref)           (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

#define kBFAssertThreadIsMain NSAssert(ACThreadIsMain(),@"current thread is not main thread");


#define BFGetString(s) (((s) && [(s) length] !=0) ? (s) : @"" )


static inline NSString* BFCombineFormatString(NSString* format, ...)
{
    if(!format){
        return nil;
    }
    va_list arglist;
    va_start(arglist, format);
    NSString *outStr = [[NSString alloc] initWithFormat:format arguments:arglist];
    va_end(arglist);
    return outStr;
}

#define kACWeightBlackColor  [UIColor colorWithRed:0x22/0xff green:0x18/0xff blue:0x14/0xff alpha:1.0f]

#define kACLightBlackColor  [UIColor colorWithRed:0x59/0xff green:0x57/0xff blue:0x57/0xff alpha:1.0f]

#define kACWeightGrayColor  [UIColor colorWithRed:0x9d/0xff green:0x9d/0xff blue:0x9e/0xff alpha:1.0f]

#define kACLightGrayColor  [UIColor colorWithRed:0xcd/0xff green:0xce/0xff blue:0xce/0xff alpha:1.0f]


typedef struct _BFDate {
    NSInteger year;
    NSInteger month;
    NSInteger day;
    NSInteger hour;
    NSInteger minute;
    NSInteger second;
} BFDate;


@interface BFCommonUtil : NSObject

+ (float)getIOSVersion;

+ (BOOL)isLandscape;

+ (BOOL)isPortrait;

+ (NSString *)getDeviceName;

+ (float)getBatteryLevel;

+ (BFDate)getTranslatedDate:(NSDate *)date;

+ (NSDate *)dateFromString:(NSString *)dateString;

+ (NSString *)stringFromDate:(NSDate *)date;

+ (NSString *)formatStringFromDictionry:(NSDictionary *)dic;

@end
