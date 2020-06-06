//
//  NSObject+GQHValidator.m
//  Seed
//
//  Created by Mac on 2019/7/5.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import "NSObject+GQHValidator.h"


@implementation NSObject (GQHValidator)

/// 版本号格式
/// @param object 任意对象
+ (BOOL)qh_isValidVersion:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"\\d+(\\.\\d+)*";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 密码以字母开头  只包含"字母" "数字" "下划线"  长度 6~18
/// @param object 任意对象
+ (BOOL)qh_isValidPassword:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^[a-zA-Z][a-zA-Z0-9_]{5,17}$";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 移动、联通、电信手机号
/// @param object 任意对象
+ (BOOL)qh_isValidMobile:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        // 移动号段正则表达式
        NSString *reg_CM = @"^((13[4-9])|(198)|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        
        // 联通号段正则表达式
        NSString *reg_CU = @"^((13[0-2])|(166)|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        
        // 电信号段正则表达式
        NSString *reg_CT = @"^((133)|(153)|(199)|(177)|(18[0,1,9]))\\d{8}$";
        
        NSPredicate *pred_CM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reg_CM];
        BOOL isMatch_CM = [pred_CM evaluateWithObject:object];
        
        NSPredicate *pred_CU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reg_CU];
        BOOL isMatch_CU = [pred_CU evaluateWithObject:object];
        
        NSPredicate *pred_CT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reg_CT];
        BOOL isMatch_CT = [pred_CT evaluateWithObject:object];
        
        return (isMatch_CM || isMatch_CU || isMatch_CT);
    }
    
    return NO;
}

/// 验证码 (6位数字)
/// @param object 任意对象
+ (BOOL)qh_isValidCAPTCHA:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^[0-9]{6}"; // 六位数字
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 银行卡号
/// @param object 任意对象
+ (BOOL)qh_isValidBankCardNumber:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^(\\d{16}|\\d{19})$"; // 银行卡号16位或19位
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 电子邮箱地址
/// @param object 任意对象
+ (BOOL)qh_isValidEmail:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 身份证 (15位和18位)
/// @param object 任意对象
+ (BOOL)qh_isValidIdentityCardNumber:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex15 = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
        NSPredicate *predicate15 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex15];
        
        NSString *regex18 = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
        NSPredicate *predicate18 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex18];
        
        return ([predicate15 evaluateWithObject:self] || [predicate18 evaluateWithObject:object]);
    }
    
    return NO;
}

/// 纯中文字符
/// @param object 任意对象
+ (BOOL)qh_isOnlyChinese:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^[\u4e00-\u9fa5]*$"; // 只有中文字符
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 纯数字
/// @param object 任意对象
+ (BOOL)qh_isOnlyNumber:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^[0-9]*$";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 浮点数
/// @param object 任意对象
+ (BOOL)qh_isValidDecimal:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^[0-9]+\\.[0-9]+$";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 字符串(含空字符串)
/// @param object 任意对象
+ (BOOL)qh_isValidString:(id)object {
    
    if (![object isKindOfClass:[NSString class]]) {
        
        return NO;
    }
    
    return YES;
}

/// 非空字符串
/// @param object 任意对象
+ (BOOL)qh_isNotNullString:(id)object {
    
    if (![object isKindOfClass:[NSString class]]) {
        
        return NO;
    }
    
    if ([object isEqualToString:@""]) {
        
        return NO;
    }
    
    return YES;
}

/// 非空字典
/// @param object 任意对象
+ (BOOL)qh_isValidDictionary:(id)object {
    
    if (![object isKindOfClass:[NSDictionary class]]) {
        
        return NO;
    }
    
    if ([object count] <= 0) {
        
        return NO;
    }
    
    return YES;
}

/// 非空数组
/// @param object 任意对象
+ (BOOL)qh_isValidArray:(id)object {
    
    if (![object isKindOfClass:[NSArray class]]) {
        
        return NO;
    }
    
    if ([object count] <= 0) {
        
        return NO;
    }
    
    return YES;
}

/// 是否含有表情符号(emoji)
/// @param object 任意对象
+ (BOOL)qh_isStringWithEmoji:(id)object {
    
    if (![object isKindOfClass:[NSString class]]) {
        
        return NO;
    }
    
    __block BOOL result = NO;
    
    [object enumerateSubstringsInRange:NSMakeRange(0, [object length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        
        const unichar firstChar = [substring characterAtIndex:0];
        
        // 解码代理对 (surrogate pair)
        if (0xd800 <= firstChar && firstChar <= 0xdbff) {
            
            if (substring.length > 1) {
                
                const unichar nextChar = [substring characterAtIndex:1];
                const int uc = ((firstChar - 0xd800) * 0x400) + (nextChar - 0xdc00) + 0x10000;
                if (0x1d00 <= uc && uc <= 0x1f77f) {
                    
                    result = YES;
                }
            }
        } else if (substring.length > 1) {
            
            const unichar nextChar = [substring characterAtIndex:1];
            
            if (nextChar == 0x20e3) {
                
                result = YES;
            }
        } else {
            
            if (0x2100 <= firstChar && firstChar <= 0x27ff) {
                
                result = YES;
            } else if (0x2B05 <= firstChar && firstChar <= 0x2b07) {
                
                result = YES;
            } else if (0x2934 <= firstChar && firstChar <= 0x2935) {
                
                result = YES;
            } else if (0x3297 <= firstChar && firstChar <= 0x3299) {
                
                result = YES;
            } else if (firstChar == 0xa9 || firstChar == 0xae || firstChar == 0x303d || firstChar == 0x3030 || firstChar == 0x2b55 || firstChar == 0x2b1c || firstChar == 0x2b1b || firstChar == 0x2b50) {
                
                result = YES;
            }
        }
    }];
    
    return result;
}

/// 对象内容的null、Null、NSNull转为@""
/// @param object 任意对象
+ (id)qh_filterNull:(id)object {
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        
        NSArray *keyArray = [object allKeys];
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [keyArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            id subObject = [object objectForKey:obj];
            subObject = [self qh_filterNull:subObject];
            [dict setObject:subObject forKey:obj];
        }];
        
        return dict;
    } else if ([object isKindOfClass:[NSArray class]]) {
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
        NSArray *objectArray = [NSArray arrayWithArray:object];
        [objectArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            id subObject = [NSObject qh_filterNull:obj];
            [array addObject:subObject];
        }];
        
        return array;
    } else if ([object isKindOfClass:[NSString class]]) {
        
        return object;
    } else if ([object isKindOfClass:[NSNull class]]) {
        
        return @"";
    } else {
        
        return object;
    }
}

@end
