//
//  NSNumber+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/25.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (SeedCategory)

/// 数值转千分位金额字符串
/// @param number 数对象
+ (NSString *)s_formatThousandsAmountWith:(NSNumber *)number;

@end

NS_ASSUME_NONNULL_END
