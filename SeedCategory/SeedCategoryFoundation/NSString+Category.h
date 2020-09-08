//
//  NSString+Category.h
//
//  Created by GuanQinghao on 08/09/2020.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Category)

/// 手机号隐藏格式化 (保留前三位后四位)
/// @param mobile 手机号
+ (nullable NSString *)qh_formatterSecretStringWithMobile:(NSString *)mobile;

/// 身份证/银行卡/信用卡格式化 (保留前四位后四位)
/// @param cardNumber 身份证/银行卡/信用卡卡号
+ (nullable NSString *)qh_formatterSecretStringWithCardNumber:(NSString *)cardNumber;

/// 数量转中文单位
/// @param value 数量值
+ (NSString *)qh_formatterChineseAmountStringWithValue:(CGFloat)value;

/// 计算文本的大小
/// @param font 文本字体
/// @param maxSize 最大size
- (CGSize)qh_formatterSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/// MD5加密 32位小写16进制
/// @param string 需要加密的字符串
+ (nullable NSString *)qh_encryptWithMD5:(NSString *)string;

/// 是否大于某一版本
/// @param version 某一版本
- (BOOL)qh_newerThan:(NSString *)version;

/// 是否大于或等于某一版本
/// @param version 某一版本
- (BOOL)qh_newerThanOrEqualTo:(NSString *)version;

/// 是否小于某一版本
/// @param version 某一版本
- (BOOL)qh_olderThan:(NSString *)version;

/// 是否小于或等于某一版本
/// @param version 某一版本
- (BOOL)qh_olderThanOrEqualTo:(NSString *)version;


/// 安全截取字符串
/// @param from 截取起始位置
- (nullable NSString *)qh_safetySubstringFromIndex:(NSUInteger)from;

/// 安全截取字符串
/// @param to 截取结束位置
- (nullable NSString *)qh_safetySubstringToIndex:(NSUInteger)to;

/// 安全截取字符串
/// @param range 截取range范围
- (nullable NSString *)qh_safetySubstringWithRange:(NSRange)range;


@end

NS_ASSUME_NONNULL_END

