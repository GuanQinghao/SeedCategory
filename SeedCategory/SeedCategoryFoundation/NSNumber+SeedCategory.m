//
//  NSNumber+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/25.
//

#import "NSNumber+SeedCategory.h"


@implementation NSNumber (SeedCategory)

/// 数值对象转千分位金额字符串(保留两位小数)
/// @param number 数对象
+ (NSString *)s_formatterThousandsAmountStringWith:(NSNumber *)number {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    // 保留小数输出
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    // 保留两位小数
    [formatter setPositiveFormat:@"###,##0.00"];
    
    NSString *result = @"";
    
    if (number != nil) {
        
        result = [NSString stringWithFormat:@"%@",[formatter stringFromNumber:number]];
    }
    
    return  result;
}

@end
