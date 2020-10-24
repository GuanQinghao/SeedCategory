//
//  NSObject+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "NSObject+SeedCategory.h"
#import <objc/message.h>


@implementation NSObject (SeedCategory)

#pragma mark - property

/// 控制台输出属性代码
/// @param dictionary 属性字典
+ (void)s_outputPropertyCodeWithDictionary:(NSDictionary *)dictionary {
    
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        
        return ;
    }
    
    if ([dictionary count] <= 0) {
        
        return ;
    }
    
    NSMutableString *autoCode = [NSMutableString string];
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *property;
        
        //
        if ([obj isKindOfClass:[NSNumber class]]) {
            
            property = [NSString stringWithFormat:@"/**\n <#Description#>\n*/\n@property (nonatomic, strong) NSNumber *%@;", key];
        }
        //
        if ([obj isKindOfClass:[NSArray class]]) {
            
            property = [NSString stringWithFormat:@"/**\n <#Description#>\n*/\n@property (nonatomic, strong) NSArray *%@;", key];
        }
        //
        if ([obj isKindOfClass:[NSDictionary class]]) {
            
            property = [NSString stringWithFormat:@"/**\n <#Description#>\n*/\n@property (nonatomic, strong) NSDictionary *%@;", key];
        }
        //
        if ([obj isKindOfClass:[NSString class]]) {
            
            property = [NSString stringWithFormat:@"/**\n <#Description#>\n*/\n@property (nonatomic, copy) NSString *%@;", key];
        }
        //
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
            property = [NSString stringWithFormat:@"/**\n <#Description#>\n*/\n@property (nonatomic, assign) BOOL %@;", key];
        }
        
        if (property.length > 0) {
            
            [autoCode appendFormat:@"\n%@\n",property];
        }
    }];
    
#ifdef DEBUG
    NSLog(@"%@",autoCode);
#endif
    
}

#pragma mark - swizzling

/// 设置方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 设置的方法名
+ (BOOL)s_overrideMethod:(SEL)originalSel withMethod:(SEL)alterSel {
    
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    if (!originalMethod) {
        
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(originalSel), [self class]);
        return NO;
    }
    
    Method alterMethod = class_getInstanceMethod(self, alterSel);
    if (!alterMethod) {
        
        NSLog(@"alter method %@ not found for class %@", NSStringFromSelector(alterSel), [self class]);
        return NO;
    }
    
    method_setImplementation(originalMethod, class_getMethodImplementation(self, alterSel));
    
    return YES;
}

/// 设置类方法的实现
/// @param originalSel 原始类方法名
/// @param alterSel 设置的类方法名
+ (BOOL)s_overrideClassMethod:(SEL)originalSel withMethod:(SEL)alterSel {
    
    Class class = object_getClass((id)self);
    return [class s_overrideMethod:originalSel withMethod:alterSel];
}

/// 交换两个方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 交换后的方法名
+ (BOOL)s_exchangeMethod:(SEL)originalSel withMethod:(SEL)alterSel {
    
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    if (!originalMethod) {
        
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(originalSel), [self class]);
        return NO;
    }
    
    Method alterMethod = class_getInstanceMethod(self, alterSel);
    if (!alterMethod) {
        
        NSLog(@"alter method %@ not found for class %@", NSStringFromSelector(alterSel), [self class]);
        return NO;
    }
    
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel),class_getInstanceMethod(self, alterSel));
    
    return YES;
}

/// 交换两个类方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 交换后的方法名
+ (BOOL)s_exchangeClassMethod:(SEL)originalSel withMethod:(SEL)alterSel {
    
    Class class = object_getClass((id)self);
    return [class s_exchangeMethod:originalSel withMethod:alterSel];
}

#pragma mark - validator

/// 版本号格式
/// @param object 任意对象
+ (BOOL)s_isValidVersion:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"\\d+(\\.\\d+)*";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 密码以字母开头  只包含"字母" "数字" "下划线"  长度 6~18
/// @param object 任意对象
+ (BOOL)s_isValidPassword:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^[a-zA-Z][a-zA-Z0-9_]{5,17}$";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 移动、联通、电信手机号
/// @param object 任意对象
+ (BOOL)s_isValidMobile:(id)object {
    
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
+ (BOOL)s_isValidCAPTCHA:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^[0-9]{6}"; // 六位数字
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 银行卡号
/// @param object 任意对象
+ (BOOL)s_isValidBankCardNumber:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^(\\d{16}|\\d{19})$"; // 银行卡号16位或19位
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 电子邮箱地址
/// @param object 任意对象
+ (BOOL)s_isValidEmail:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 身份证 (15位和18位)
/// @param object 任意对象
+ (BOOL)s_isValidIdentityCardNumber:(id)object {
    
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
+ (BOOL)s_isOnlyChinese:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^[\u4e00-\u9fa5]*$"; // 只有中文字符
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 纯数字
/// @param object 任意对象
+ (BOOL)s_isOnlyNumber:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^[0-9]*$";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 浮点数
/// @param object 任意对象
+ (BOOL)s_isValidDecimal:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *regex = @"^[0-9]+\\.[0-9]+$";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        
        return [predicate evaluateWithObject:object];
    }
    
    return NO;
}

/// 字符串(含空字符串)
/// @param object 任意对象
+ (BOOL)s_isValidString:(id)object {
    
    if (![object isKindOfClass:[NSString class]]) {
        
        return NO;
    }
    
    return YES;
}

/// 非空字符串
/// @param object 任意对象
+ (BOOL)s_isNotNullString:(id)object {
    
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
+ (BOOL)s_isValidDictionary:(id)object {
    
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
+ (BOOL)s_isValidArray:(id)object {
    
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
+ (BOOL)s_isStringWithEmoji:(id)object {
    
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
+ (id)s_filterNull:(id)object {
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        
        NSArray *keyArray = [object allKeys];
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [keyArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            id subObject = [object objectForKey:obj];
            subObject = [self s_filterNull:subObject];
            [dict setObject:subObject forKey:obj];
        }];
        
        return dict;
    } else if ([object isKindOfClass:[NSArray class]]) {
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
        NSArray *objectArray = [NSArray arrayWithArray:object];
        [objectArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            id subObject = [NSObject s_filterNull:obj];
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

/// 延迟执行
/// @param seconds 延迟时间
/// @param handler 延迟执行
+ (void)s_delay:(double)seconds executing:(nullable void (^)(void))handler {
    
    seconds = (seconds > 0.0f) ? seconds : 0.0f;
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^(void){
        
        if (handler) {
            
            handler();
        }
    });
}

/// Objective-C对象转JSON字符串
- (NSString *)s_toJSONString {
    
    if (![NSJSONSerialization isValidJSONObject:self]) {
        
        return nil;
    }
    
    NSError *error = nil;
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error || !JSONData) {
        
        return nil;
    }
    
    NSString *JSONString = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    
    return JSONString;
}

@end



@implementation NSObject (GQHPrint)

/// Objective-C对象转JSON字符串
- (NSString *)s_toJSONString {
    
    if (![NSJSONSerialization isValidJSONObject:self]) {
        
        return nil;
    }
    
    NSError *error = nil;
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error || !JSONData) {
        
        return nil;
    }
    
    NSString *JSONString = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    
    return JSONString;
}

@end


#pragma mark --控制台数组和字典打印输出
/// 交换方法
static inline void s_swizzleSelector(Class class, SEL originalSelector, SEL alterSelector) {
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method alterMethod = class_getInstanceMethod(class, alterSelector);
    
    BOOL isAdded = class_addMethod(class, originalSelector, method_getImplementation(alterMethod), method_getTypeEncoding(alterMethod));
    if (isAdded) {
        
        class_replaceMethod(class, alterSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        
        method_exchangeImplementations(originalMethod, alterMethod);
    }
}

///数组打印
@implementation NSArray (SeedPrint)

- (NSString *)s_debugDescription {
    
    NSString *JSONString = [self s_toJSONString];
    if (!JSONString) {
        
        return [self s_debugDescription];
    }
    
    return JSONString;
}

- (NSString *)s_descriptionWithLocale:(id)locale {
    
    NSString *JSONString = [self s_toJSONString];
    if (!JSONString) {
        
        return [self s_descriptionWithLocale:locale];
    }
    
    return JSONString;
}

- (NSString *)s_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    NSString *JSONString = [self s_toJSONString];
    if (!JSONString) {
        
        return [self s_descriptionWithLocale:locale indent:level];
    }
    
    return JSONString;
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        s_swizzleSelector(class, @selector(debugDescription), @selector(s_debugDescription));
        s_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(s_descriptionWithLocale:));
        s_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(s_descriptionWithLocale:indent:));
    });
}

@end

/// 字典打印
@implementation NSDictionary (SeedPrint)

- (NSString *)s_debugDescription {
    
    NSString *JSONString = [self s_toJSONString];
    if (!JSONString) {
        
        return [self s_debugDescription];
    }
    
    return JSONString;
}

- (NSString *)s_descriptionWithLocale:(id)locale {
    
    NSString *JSONString = [self s_toJSONString];
    if (!JSONString) {
        
        return [self s_descriptionWithLocale:locale];
    }
    
    return JSONString;
}

- (NSString *)s_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    NSString *JSONString = [self s_toJSONString];
    if (!JSONString) {
        
        return [self s_descriptionWithLocale:locale indent:level];
    }
    
    return JSONString;
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        s_swizzleSelector(class, @selector(debugDescription), @selector(s_debugDescription));
        s_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(s_descriptionWithLocale:));
        s_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(s_descriptionWithLocale:indent:));
    });
}

@end
