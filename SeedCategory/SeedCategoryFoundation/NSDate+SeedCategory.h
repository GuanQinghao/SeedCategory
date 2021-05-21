//
//  NSDate+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, SeedDateFormatType) {
    
    SeedDateFormatTypeChinese,                  // yyyy年MM月dd日 HH时mm分ss秒
    SeedDateFormatTypeHyphen,                   // yyyy-MM-dd HH:mm:ss
    SeedDateFormatTypeSlash,                    // yyyy/MM/dd HH:mm:ss
    SeedDateFormatTypeChineseYearMonthDay,      // yyyy年MM月dd日
    SeedDateFormatTypeHyphenYearMonthDay,       // yyyy-MM-dd
    SeedDateFormatTypeSlashYearMonthDay,        // yyyy/MM/dd
    SeedDateFormatTypeChineseMonthDay,          // MM月dd日
    SeedDateFormatTypeSlashMonthDay,            // MM/dd
    SeedDateFormatTypeHyphenMonthDay,           // MM-dd
    SeedDateFormatTypeChineseHourMinuteSecond,  // HH时mm分ss秒
    SeedDateFormatTypeChineseHourMinute,        // HH时mm分
    SeedDateFormatTypeColonHourMinuteSecond,    // HH:mm:ss
    SeedDateFormatTypeColonHourMinute,          // HH:mm
};


NS_ASSUME_NONNULL_BEGIN

@interface NSDate (SeedCategory)

/// 时间格式化单例
+ (NSDateFormatter *)s_defaultDateFormatter;

/// 枚举类型值(NSString)
/// @param type 时间格式化样式
+ (NSString *)s_formatTypeStringWith:(SeedDateFormatType)type;

/// 获取网络标准时间
+ (NSDate *)s_standardDate;

/// 时间戳(1970 单位秒)格式化为时间差
/// @param timeStamp 时间戳(1970 单位秒)
+ (NSString *)s_formatTimeDifferenceWith:(NSTimeInterval)timeStamp;

/// 时间戳(1970 单位秒)格式化为指定字符串
/// @param timeStamp 时间戳(1970 单位秒)
/// @param type 时间格式化样式
+ (NSString *)s_formatDateStringWithTimeStamp:(NSTimeInterval)timeStamp type:(SeedDateFormatType)type;

/// 字符串格式化为时间戳(1970 单位秒)
/// @param dateString 时间字符串
/// @param type 时间格式化样式
+ (NSTimeInterval)s_formatTimeStampWithDateString:(NSString *)dateString type:(SeedDateFormatType)type;

/// 字符串格式化为时间类型
/// @param dateString 时间字符串
/// @param type 时间格式化样式
+ (NSDate *)s_formatDateWithDateString:(NSString *)dateString type:(SeedDateFormatType)type;

/// 时间格式化为指定字符串
/// @param date 时间
/// @param type 时间格式化样式
+ (NSString *)s_formatDateStringWithDate:(NSDate *)date type:(SeedDateFormatType)type;

/// 某年的天数
/// @param year 年份
+ (NSInteger)s_daysForYear:(NSString *)year;

/// 某月的天数
/// @param year 年份
/// @param month 月份
+ (NSInteger)s_daysForYear:(NSString *)year month:(NSString *)month;

/// 某天的星期(1-7)(周日是第1天，周六是第7天)
/// @param date 某天
+ (NSInteger)s_weekdayOfDate:(NSDate *)date;

/// 未来七天/一周
+ (NSArray *)s_nextSevenDays;

/// 过去七天/一周
+ (NSArray *)s_lastSevenDays;

/// 是否为当前年
- (BOOL)s_isThisYear;

/// 是否是当前月
- (BOOL)s_isThisMonth;

/// 是否是昨天
- (BOOL)s_isYesterday;

/// 是否是今天
- (BOOL)s_isToday;

/// 是否为明天
- (BOOL)s_isTomorrow;

@end

NS_ASSUME_NONNULL_END
