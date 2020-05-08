//
//  NSDate+GQHFormatter.h
//  Seed
//
//  Created by GuanQinghao on 2018/8/5.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 时间格式样式
 
 - GQHDateTimeFormatterTypeChinese: yyyy年MM月dd日 HH时mm分ss秒
 - GQHDateTimeFormatterTypeHyphen: yyyy-MM-dd HH:mm:ss
 - GQHDateTimeFormatterTypeSlash: yyyy/MM/dd HH:mm:ss
 - GQHDateTimeFormatterTypeChineseYearMonthDay: yyyy年MM月dd日
 - GQHDateTimeFormatterTypeHyphenYearMonthDay: yyyy-MM-dd
 - GQHDateTimeFormatterTypeSlashYearMonthDay: yyyy/MM/dd
 - GQHDateTimeFormatterTypeChineseMonthDay: MM月dd日
 - GQHDateTimeFormatterTypeSlashMonthDay: MM/dd
 - GQHDateTimeFormatterTypeHyphenMonthDay: MM-dd
 - GQHDateTimeFormatterTypeChineseHourMinuteSecond: HH时mm分ss秒
 - GQHDateTimeFormatterTypeChineseHourMinute: HH时mm分
 - GQHDateTimeFormatterTypeColonHourMinuteSecond: HH:mm:ss
 - GQHDateTimeFormatterTypeColonHourMinute: HH:mm
 */
typedef NS_ENUM(NSUInteger, GQHDateTimeFormatterType) {
    
    GQHDateTimeFormatterTypeChinese,
    GQHDateTimeFormatterTypeHyphen,
    GQHDateTimeFormatterTypeSlash,
    GQHDateTimeFormatterTypeChineseYearMonthDay,
    GQHDateTimeFormatterTypeHyphenYearMonthDay,
    GQHDateTimeFormatterTypeSlashYearMonthDay,
    GQHDateTimeFormatterTypeChineseMonthDay,
    GQHDateTimeFormatterTypeSlashMonthDay,
    GQHDateTimeFormatterTypeHyphenMonthDay,
    GQHDateTimeFormatterTypeChineseHourMinuteSecond,
    GQHDateTimeFormatterTypeChineseHourMinute,
    GQHDateTimeFormatterTypeColonHourMinuteSecond,
    GQHDateTimeFormatterTypeColonHourMinute,
};


NS_ASSUME_NONNULL_BEGIN

@interface NSDate (GQHFormatter)

/// 是否为当前年
- (BOOL)qh_isThisYear;

/// 是否是当前月
- (BOOL)qh_isThisMonth;

/// 是否是昨天
- (BOOL)qh_isYesterday;

/// 是否是今天
- (BOOL)qh_isToday;

/// 是否为明天
- (BOOL)qh_isTomorrow;


/// 时间格式化单例
+ (NSDateFormatter *)qh_defaultDateFormatter;

/// 时间戳(1970 单位秒)格式化为时间差
/// @param timeStamp 时间戳(1970 单位秒)
+ (NSString *)qh_formatterTimeDifferenceWith:(NSTimeInterval)timeStamp;

/// 时间戳(1970 单位秒)格式化为指定字符串
/// @param timeStamp 时间戳(1970 单位秒)
/// @param formatterType 时间格式化样式
+ (NSString *)qh_formatterDateStringWithTimeStamp:(NSTimeInterval)timeStamp formatter:(GQHDateTimeFormatterType)formatterType;

/// 字符串格式化为时间戳(1970 单位秒)
/// @param dateString 时间字符串
/// @param formatterType 时间格式化样式
+ (NSTimeInterval)qh_formatterTimeStampWithDateString:(NSString *)dateString formatter:(GQHDateTimeFormatterType)formatterType;

/// 字符串格式化为时间类型
/// @param dateString 时间字符串
/// @param formatterType 时间格式化样式
+ (NSDate *)qh_formatterDateWithDateString:(NSString *)dateString formatter:(GQHDateTimeFormatterType)formatterType;

/// 时间格式化为指定字符串
/// @param date 时间
/// @param formatterType 时间格式化样式
+ (NSString *)qh_formatterDateStringWithDate:(NSDate *)date formatter:(GQHDateTimeFormatterType)formatterType;

/// 某年的天数
/// @param year 年份
+ (NSInteger)qh_daysForYear:(NSString *)year;

/// 某月的天数
/// @param year 年份
/// @param month 月份
+ (NSInteger)qh_daysForYear:(NSString *)year month:(NSString *)month;

/// 某天的星期(1-7)
/// @param date 某天
+ (NSInteger)qh_weekdayOfDate:(NSDate *)date;

/// 枚举类型值(NSString)
/// @param formatterType 时间格式化样式
+ (NSString *)qh_formatterTypeStringWith:(GQHDateTimeFormatterType)formatterType;

/// 未来七天/一周
+ (NSArray *)qh_nextSevenDays;

/// 过去七天/一周
+ (NSArray *)qh_lastSevenDays;

@end

NS_ASSUME_NONNULL_END
