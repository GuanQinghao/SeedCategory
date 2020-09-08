//
//  NSString+GQHSafety.h
//  Seed
//
//  Created by GuanQinghao on 24/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@interface NSMutableString (GQHSafety)

/// 指定位置安全插入字符串
/// @param aString 要插入的字符串
/// @param location 指定位置
- (void)qh_safetyInsertString:(NSString *)aString atIndex:(NSUInteger)location;

/// 字符串后安全拼接字符串
/// @param aString 要拼接的字符串
- (void)qh_safetyAppendString:(NSString *)aString;

/// 安全修改可变字符串的字符内容
/// @param aString 要修改的字符串
- (void)qh_safetySetString:(NSString *)aString;

/// 安全删除区间内的字符
/// @param range 要删除的字符串range范围
- (void)qh_safetyDeleteCharactersInRange:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
