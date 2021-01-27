//
//  NSObject+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

/**
 使用NSObject分类的原因是被检查的对象存在以下几种情况:
 1、非字符串类(NSNULL,NSNull)
 2、空字符串(nil,NULL)
 */

@interface NSObject (SeedCategory)

#pragma mark - property

/// 控制台输出属性代码
/// @param dictionary 属性字典
+ (void)s_outputPropertyCodeWithDictionary:(NSDictionary *)dictionary;

#pragma mark - swizzling

/// 设置方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 设置的方法名
+ (BOOL)s_overrideMethod:(SEL)originalSel withMethod:(SEL)alterSel;

/// 设置类方法的实现
/// @param originalSel 原始类方法名
/// @param alterSel 设置的类方法名
+ (BOOL)s_overrideClassMethod:(SEL)originalSel withMethod:(SEL)alterSel;

/// 交换两个方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 交换后的方法名
+ (BOOL)s_exchangeMethod:(SEL)originalSel withMethod:(SEL)alterSel;

/// 交换两个类方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 交换后的方法名
+ (BOOL)s_exchangeClassMethod:(SEL)originalSel withMethod:(SEL)alterSel;

#pragma mark - validator

/// 版本号格式
/// @param object 任意对象
+ (BOOL)s_isValidVersion:(id)object;

/// 密码以字母开头  只包含"字母" "数字" "下划线"  长度 6~18
/// @param object 任意对象
+ (BOOL)s_isValidPassword:(id)object;

/// 移动、联通、电信手机号
/// @param object 任意对象
+ (BOOL)s_isValidMobile:(id)object;

/// 验证码 (6位数字)
/// @param object 任意对象
+ (BOOL)s_isValidCAPTCHA:(id)object;

/// 银行卡号
/// @param object 任意对象
+ (BOOL)s_isValidBankCardNumber:(id)object;

/// 电子邮箱地址
/// @param object 任意对象
+ (BOOL)s_isValidEmail:(id)object;

/// 身份证 (15位和18位)
/// @param object 任意对象
+ (BOOL)s_isValidIdentityCardNumber:(id)object;

/// 纯中文字符
/// @param object 任意对象
+ (BOOL)s_isOnlyChinese:(id)object;

/// 纯数字
/// @param object 任意对象
+ (BOOL)s_isOnlyNumber:(id)object;

/// 浮点数
/// @param object 任意对象
+ (BOOL)s_isValidDecimal:(id)object;

/// 字符串(含空字符串)
/// @param object 任意对象
+ (BOOL)s_isValidString:(id)object;

/// 非空字符串
/// @param object 任意对象
+ (BOOL)s_isNotNullString:(id)object;

/// 非空字典
/// @param object 任意对象
+ (BOOL)s_isValidDictionary:(id)object;

/// 非空数组
/// @param object 任意对象
+ (BOOL)s_isValidArray:(id)object;

/// 是否是表情符号(emoji)
/// @param object 任意对象
+ (BOOL)s_isEmoji:(id)object;

/// 字符串是否含有表情符号(emoji)
/// @param object 任意对象
+ (BOOL)s_isStringContainsEmoji:(id)object;

/// 过滤表情符号(emoji)
/// @param object 任意对象
+ (NSString *)s_filterEmoji:(id)object;

/// 对象内容的null、Null、NSNull转为@""
/// @param object 任意对象
+ (id)s_filterNull:(id)object;

/// 延迟执行
/// @param seconds 延迟时间
/// @param handler 延迟执行
+ (void)s_delay:(double)seconds executing:(nullable void (^)(void))handler;

/// Objective-C对象转JSON字符串
- (NSString *)s_toJSONString;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

///数组打印
@interface NSArray (SeedPrint)

- (NSString *)s_debugDescription;

- (NSString *)s_descriptionWithLocale:(id)locale;

- (NSString *)s_descriptionWithLocale:(id)locale indent:(NSUInteger)level;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

/// 字典打印
@interface NSDictionary (SeedPrint)

- (NSString *)s_debugDescription;

- (NSString *)s_descriptionWithLocale:(id)locale;

- (NSString *)s_descriptionWithLocale:(id)locale indent:(NSUInteger)level;

@end

NS_ASSUME_NONNULL_END
