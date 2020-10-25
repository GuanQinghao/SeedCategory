//
//  NSNumber+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/25.
//

#import "NSNumber+SeedCategory.h"


@implementation NSNumber (SeedCategory)

+ (NSString *)s_formatThousandsAmountWith:(NSNumber *)number {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    // 保留小数输出
    formatter.numberStyle = NSNumberFormatterRoundFloor;
    // 保留两位小数
    [formatter setPositiveFormat:@"###,##0.00"];
    
    NSString *result = @"";
    
    if (number) {
        
        result = [NSString stringWithFormat:@"%@",[formatter stringFromNumber:number]];
    }
    
    return  result;
}

@end
