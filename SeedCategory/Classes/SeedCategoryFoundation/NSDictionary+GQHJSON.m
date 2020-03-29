//
//  NSDictionary+GQHJSON.m
//  Seed
//
//  Created by Mac on 2018/9/28.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "NSDictionary+GQHJSON.h"
#import <objc/message.h>


@implementation NSDictionary (GQHJSON)

/// JSON字符串转字典
/// @param JSON JSON字符串
+ (NSDictionary*)qh_dictionaryWithJSON:(NSString*)JSON {
    
    if (JSON && JSON.length > 0) {
        
        NSData *data = [JSON dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *error;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (error) {
            
            NSAssert(error, @"解析失败!");
            return nil;
        }
        
        return dictionary;
    }
    
    return nil;
}

/// 字典转JSON字符串
- (NSString *)qh_JSONString {
    
    NSError *error = [NSError new];
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *JSON = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    JSON = [JSON stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
    JSON = [JSON stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    JSON = [JSON stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return JSON;
}

@end


#pragma mark --控制台输出
/// 交换方法
static inline void qh_swizzleSelector(Class class, SEL originalSelector, SEL alterSelector) {
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method alterMethod = class_getInstanceMethod(class, alterSelector);
    
    BOOL isAdded = class_addMethod(class, originalSelector, method_getImplementation(alterMethod), method_getTypeEncoding(alterMethod));
    if (isAdded) {
        
        class_replaceMethod(class, alterSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        
        method_exchangeImplementations(originalMethod, alterMethod);
    }
}


@implementation NSObject (GQHPrint)

/// Objective-C对象转JSON字符串
- (NSString *)qh_toJSONString {
    
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


///数组打印
@implementation NSArray (GQHPrint)

- (NSString *)qh_debugDescription {
    
    NSString *JSONString = [self qh_toJSONString];
    if (!JSONString) {
        
        return [self qh_debugDescription];
    }
    
    return JSONString;
}

- (NSString *)qh_descriptionWithLocale:(id)locale {
    
    NSString *JSONString = [self qh_toJSONString];
    if (!JSONString) {
        
        return [self qh_descriptionWithLocale:locale];
    }
    
    return JSONString;
}

- (NSString *)qh_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    NSString *JSONString = [self qh_toJSONString];
    if (!JSONString) {
        
        return [self qh_descriptionWithLocale:locale indent:level];
    }
    
    return JSONString;
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        qh_swizzleSelector(class, @selector(debugDescription), @selector(qh_debugDescription));
        qh_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(qh_descriptionWithLocale:));
        qh_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(qh_descriptionWithLocale:indent:));
    });
}

@end


/// 字典打印
@implementation NSDictionary (GQHPrint)

- (NSString *)qh_debugDescription {
    
    NSString *JSONString = [self qh_toJSONString];
    if (!JSONString) {
        
        return [self qh_debugDescription];
    }
    
    return JSONString;
}

- (NSString *)qh_descriptionWithLocale:(id)locale {
    
    NSString *JSONString = [self qh_toJSONString];
    if (!JSONString) {
        
        return [self qh_descriptionWithLocale:locale];
    }
    
    return JSONString;
}

- (NSString *)qh_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    NSString *JSONString = [self qh_toJSONString];
    if (!JSONString) {
        
        return [self qh_descriptionWithLocale:locale indent:level];
    }
    
    return JSONString;
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        qh_swizzleSelector(class, @selector(debugDescription), @selector(qh_debugDescription));
        qh_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(qh_descriptionWithLocale:));
        qh_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(qh_descriptionWithLocale:indent:));
    });
}

@end
