//
//  NSString+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString (SeedCategory)

/// 手机号隐藏格式化 (保留前三位后四位)
/// @param mobile 手机号
+ (nullable NSString *)s_formatMobileWith:(NSString *)mobile;

/// 身份证/银行卡/信用卡格式化 (保留前四位后四位)
/// @param cardNumber 身份证/银行卡/信用卡卡号
+ (nullable NSString *)s_formatCardNumberWith:(NSString *)cardNumber;

/// 数量转中文单位
/// @param value 数量值
+ (NSString *)s_formatChineseAmountWith:(CGFloat)value;

/// MD5加密 32位小写16进制
/// @param string 需要加密的字符串
+ (nullable NSString *)s_encryptWithMD5:(NSString *)string;

/// 计算文本的大小
/// @param font 文本字体
/// @param maxSize 最大size
- (CGSize)s_formatSizeWith:(UIFont *)font maxSize:(CGSize)maxSize;

/// 是否大于某一版本
/// @param version 某一版本
- (BOOL)s_newerThan:(NSString *)version;

/// 是否大于或等于某一版本
/// @param version 某一版本
- (BOOL)s_newerThanOrEqualTo:(NSString *)version;

/// 是否小于某一版本
/// @param version 某一版本
- (BOOL)s_olderThan:(NSString *)version;

/// 是否小于或等于某一版本
/// @param version 某一版本
- (BOOL)s_olderThanOrEqualTo:(NSString *)version;

/// 安全截取字符串
/// @param from 截取起始位置
- (nullable NSString *)s_substringFromIndex:(NSUInteger)from;

/// 安全截取字符串
/// @param to 截取结束位置
- (nullable NSString *)s_substringToIndex:(NSUInteger)to;

/// 安全截取字符串
/// @param range 截取range范围
- (nullable NSString *)s_substringWithRange:(NSRange)range;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSMutableString (SeedCategory)

/// 指定位置安全插入字符串
/// @param aString 要插入的字符串
/// @param location 指定位置
- (void)s_insertString:(NSString *)aString atIndex:(NSUInteger)location;

/// 字符串后安全拼接字符串
/// @param aString 要拼接的字符串
- (void)s_appendString:(NSString *)aString;

/// 安全修改可变字符串的字符内容
/// @param aString 要修改的字符串
- (void)s_setString:(NSString *)aString;

/// 安全删除区间内的字符
/// @param range 要删除的字符串range范围
- (void)s_deleteCharactersInRange:(NSRange)range;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (SeedCategory)

/// 属性字符串修改指定字符串属性
/// @param string 指定的字符串
/// @param font 新属性字体
/// @param color 新属性字体颜色
- (NSMutableAttributedString *)s_attributedStringBy:(NSString *)string withFont:(UIFont *)font color:(UIColor *)color;

/// 字符串添加缩进
/// @param string 字符串
/// @param head 头部缩进
/// @param tail 尾部缩进(>0)
+ (NSMutableAttributedString *)s_attributedStringWith:(NSString *)string headIndent:(CGFloat)head tailIndent:(CGFloat)tail;

@end

NS_ASSUME_NONNULL_END
