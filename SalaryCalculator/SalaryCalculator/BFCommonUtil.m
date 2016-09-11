//
//  BFCommonUtil.m
//  SpringExhibition
//
//  Created by Dennis on 4/7/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "BFCommonUtil.h"
#import <UIKit/UIKit.h>

@implementation BFCommonUtil

+ (float)getIOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}


+ (BOOL)isLandscape
{
   
    return UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation);
}


+ (BOOL)isPortrait
{
    return UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation);
}


+ (NSString *)getDeviceName
{
    return [[UIDevice currentDevice] name];
}


+ (float)getBatteryLevel
{
    return [[UIDevice currentDevice] batteryLevel];
}


+ (BFDate)getTranslatedDate:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [cal components:unitFlags fromDate:date];
    
    BFDate translatedDate = {components.year, components.month, components.day, components.hour, components.minute, components.second};
    return translatedDate;
}


+ (NSDate *)dateFromString:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}


+ (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}



+ (NSString *)formatStringFromDictionry:(NSDictionary *)dic
{
    NSMutableString *str = [NSMutableString string];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *temp = [NSString stringWithFormat:@"%@: %@\n", key, obj];
        [str appendString:temp];
    }];
    return [NSString stringWithFormat:@"%@", str];
}


@end
