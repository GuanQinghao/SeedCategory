//
//  NSDate+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "NSDate+SeedCategory.h"


@implementation NSDate (SeedCategory)

/// 时间格式化单例
+ (NSDateFormatter *)s_defaultDateFormatter {
    
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        formatter = [[NSDateFormatter alloc] init];
        // 设置日历为公历
        [formatter setCalendar:[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian]];
    });
    
    return formatter;
}

/// 枚举类型值(NSString)
/// @param type 时间格式化样式
+ (NSString *)s_formatTypeStringWith:(SeedDateFormatType)type {
    
    switch (type) {
            
        case SeedDateFormatTypeChinese:
            return @"yyyy年MM月dd日 HH时mm分ss秒";
        case SeedDateFormatTypeHyphen:
            return @"yyyy-MM-dd HH:mm:ss";
        case SeedDateFormatTypeSlash:
            return @"yyyy/MM/dd HH:mm:ss";
        case SeedDateFormatTypeChineseYearMonthDay:
            return @"yyyy年MM月dd日";
        case SeedDateFormatTypeHyphenYearMonthDay:
            return @"yyyy-MM-dd";
        case SeedDateFormatTypeSlashYearMonthDay:
            return @"yyyy/MM/dd";
        case SeedDateFormatTypeChineseMonthDay:
            return @"MM月dd日";
        case SeedDateFormatTypeSlashMonthDay:
            return @"MM/dd";
        case SeedDateFormatTypeHyphenMonthDay:
            return @"MM-dd";
        case SeedDateFormatTypeChineseHourMinuteSecond:
            return @"HH时mm分ss秒";
        case SeedDateFormatTypeChineseHourMinute:
            return @"HH时mm分";
        case SeedDateFormatTypeColonHourMinuteSecond:
            return @"HH:mm:ss";
        case SeedDateFormatTypeColonHourMinute:
            return @"HH:mm";
    }
}

/// 获取网络标准时间
+ (NSDate *)s_standardDate {
    
    NSString *URLString = @"http://m.baidu.com";
    URLString = [URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    __block NSDate *date = [NSDate date];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
        NSString *result = [res.allHeaderFields objectForKey:@"Date"];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"eee dd MMM yyyy HH:mm:ss z"];
        date = [formatter dateFromString:result];
    }];
    
    [dataTask resume];
    
    return date;
}

/// 时间戳(1970 单位秒)格式化为时间差
/// @param timeStamp 时间戳(1970 单位秒)
+ (NSString *)s_formatTimeDifferenceWith:(NSTimeInterval)timeStamp {
    
    // 第一步，获取当前系统的时间戳
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    // 第二步，计算时间戳差值
    NSTimeInterval diff = timeInterval - timeStamp;
    // 第三步，根据时间戳设置样式
    NSString *string;
    NSInteger result = 0;
    
    if (diff < 60) {
        
        string = [NSString stringWithFormat:@"刚刚"];
    } else if ((result = diff / 60) < 60) {
        
        string = [NSString stringWithFormat:@"%ld分钟前", result];
    } else if ((result = result / 60) < 24) {
        
        string = [NSString stringWithFormat:@"%ld小时前", result];
    } else if ((result = result / 24) < 30) {
        
        string = [NSString stringWithFormat:@"%ld天前",result];
    } else if ((result = result / 30) < 12) {
        
        string = [NSString stringWithFormat:@"%ld月前",result];
    } else {
        
        result = result / 12;
        string = [NSString stringWithFormat:@"%ld年前",result];
    }
    
    return  string;
}

/// 时间戳(1970 单位秒)格式化为指定字符串
/// @param timeStamp 时间戳(1970 单位秒)
/// @param type 时间格式化样式
+ (NSString *)s_formatDateStringWithTimeStamp:(NSTimeInterval)timeStamp type:(SeedDateFormatType)type {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp/1000];
    
    NSDateFormatter *dateFormatter = NSDate.s_defaultDateFormatter;
    dateFormatter.dateFormat = [self s_formatTypeStringWith:type];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

/// 字符串格式化为时间戳(1970 单位秒)
/// @param dateString 时间字符串
/// @param type 时间格式化样式
+ (NSTimeInterval)s_formatTimeStampWithDateString:(NSString *)dateString type:(SeedDateFormatType)type {
    
    // 把字符串格式化为时间
    NSDate *date = [self s_formatDateWithDateString:dateString type:type];
    // 时间转时间戳
    NSTimeInterval timeStamp = [date timeIntervalSince1970];
    
    return timeStamp;
}

/// 字符串格式化为时间类型
/// @param dateString 时间字符串
/// @param type 时间格式化样式
+ (NSDate *)s_formatDateWithDateString:(NSString *)dateString type:(SeedDateFormatType)type {
    
    // 设置日期格式化
    NSDateFormatter *dateFormatter = NSDate.s_defaultDateFormatter;
    dateFormatter.dateFormat = [self s_formatTypeStringWith:type];
    // 根据日期字符串获取日期
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    return date;
}

/// 时间格式化为指定字符串
/// @param date 时间
/// @param type 时间格式化样式
+ (NSString *)s_formatDateStringWithDate:(NSDate *)date type:(SeedDateFormatType)type {
    
    // 设置日期格式化
    NSDateFormatter *dateFormatter = NSDate.s_defaultDateFormatter;
    dateFormatter.dateFormat = [self s_formatTypeStringWith:type];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

/// 某年的天数
/// @param year 年份
+ (NSInteger)s_daysForYear:(NSString *)year {
    
    // 普通闰年: 能被4整除
    // 世纪闰年: 能被400整除
    // 例: 1991 1996 2000 2100
    if ((year.integerValue%4 == 0 && year.integerValue%100 != 0) || year.integerValue%100 == 0) {
        
        // 闰年
        return 366;
    }
    
    // 平年
    return 365;
}

/// 某月的天数
/// @param year 年份
/// @param month 月份
+ (NSInteger)s_daysForYear:(NSString *)year month:(NSString *)month {
    
    // 月份判断
    if (month.integerValue < 1 || month.integerValue > 12) {
        
        return 0;
    }
    
    NSArray *days = @[@"31",@"28",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31"];
    if ((year.integerValue%4 == 0 && year.integerValue%100 != 0) || year.integerValue%100 == 0) {
        
        // 闰年
        days = @[@"31",@"29",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31"];
    }
    
    NSString *day = days[month.integerValue - 1];
    
    return day.integerValue;
}

/// 某天的星期(1-7)(周日是第1天，周六是第7天)
/// @param date 某天
+ (NSInteger)s_weekdayOfDate:(NSDate *)date {
    
    if (!date) {
        
        return 0;
    }
    
    NSCalendar *calendar;
    NSInteger unit;
    
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    // 添加日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDateComponents *components = [calendar components:unit fromDate:date];
    
    return [components weekday];
}

/// 未来七天/一周
+ (NSArray *)s_nextSevenDays {
    
    // 天数
    NSInteger count = 7;
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 时间格式化 - yyyy-MM-dd
    NSDateFormatter *dateFormatter = NSDate.s_defaultDateFormatter;
    dateFormatter.dateFormat = [self s_formatTypeStringWith:SeedDateFormatTypeHyphenYearMonthDay];
    
    // 结果
    NSMutableArray *dayArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < count; i++) {
        
        // 未来的某一天
        NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday) fromDate:[NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24 * i]];
        NSDate *date = [calendar dateFromComponents:components];
        
        // 获取年月日
        NSString *dayString = [dateFormatter stringFromDate:date];
        
        [dayArray addObject:dayString];
    }
    
    return dayArray;
}

/// 过去七天/一周
+ (NSArray *)s_lastSevenDays {
    
    // 天数
    NSInteger count = 7;
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 时间格式化 - yyyy-MM-dd
    NSDateFormatter *dateFormatter = NSDate.s_defaultDateFormatter;
    dateFormatter.dateFormat = [self s_formatTypeStringWith:SeedDateFormatTypeHyphenYearMonthDay];
    
    // 结果
    NSMutableArray *dayArray = [NSMutableArray array];
    
    for (NSInteger i = (1 - count); i < 1; i++) {
        
        // 过去的某一天
        NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday) fromDate:[NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24 * i]];
        NSDate *date = [calendar dateFromComponents:components];
        
        // 获取年月日
        NSString *dayString = [dateFormatter stringFromDate:date];
        
        [dayArray addObject:dayString];
    }
    
    return dayArray;
}

/// 是否为当前年
- (BOOL)s_isThisYear {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger thisYear = [calendar component:NSCalendarUnitYear fromDate: [NSDate date]];
    NSInteger year = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return year == thisYear;
}

/// 是否是当前月
- (BOOL)s_isThisMonth {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger thisMonth = [calendar component:NSCalendarUnitMonth fromDate: [NSDate date]];
    NSInteger month = [calendar component:NSCalendarUnitMonth fromDate:self];
    
    return month == thisMonth;
}

/// 是否是昨天
- (BOOL)s_isYesterday {
    
    NSDateFormatter *dateFormatter = NSDate.s_defaultDateFormatter;
    dateFormatter.dateFormat = [NSDate s_formatTypeStringWith:SeedDateFormatTypeHyphenYearMonthDay];
    
    NSString *nowString = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *nowDate = [dateFormatter dateFromString:nowString];
    
    NSString *dateString = [dateFormatter stringFromDate:self];
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *components = [calendar components:unit fromDate:date toDate:nowDate options:0];
    
    return components.year == 0 && components.month == 0 && components.day == 1;
}

/// 是否是今天
- (BOOL)s_isToday {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *nowComponents = [calendar components:unit fromDate: [NSDate date]];
    NSDateComponents *components = [calendar components:unit fromDate:self];
    
    return nowComponents.year == components.year && nowComponents.month == components.month && nowComponents.day == components.day;
}

/// 是否为明天
- (BOOL)s_isTomorrow {
    
    NSDateFormatter *dateFormatter = NSDate.s_defaultDateFormatter;
    dateFormatter.dateFormat = [NSDate s_formatTypeStringWith:SeedDateFormatTypeHyphenYearMonthDay];
    
    NSString *nowString = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *nowDate = [dateFormatter dateFromString:nowString];
    
    NSString *dateString = [dateFormatter stringFromDate:self];
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *components = [calendar components:unit fromDate:date toDate:nowDate options:0];
    
    return components.year == 0 && components.month == 0 && components.day == -1;
}

@end
