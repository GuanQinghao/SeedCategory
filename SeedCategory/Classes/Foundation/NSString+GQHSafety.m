//
//  NSString+GQHSafety.m
//  Seed
//
//  Created by GuanQinghao on 24/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "NSString+GQHSafety.h"


@implementation NSString (GQHSafety)

/// 安全截取字符串
/// @param from 截取起始位置
- (NSString *)qh_safetySubstringFromIndex:(NSUInteger)from {
    
    if (from < self.length) {
        
        return [self substringFromIndex:from];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return nil;
    }
}

/// 安全截取字符串
/// @param to 截取结束位置
- (NSString *)qh_safetySubstringToIndex:(NSUInteger)to {
    
    if (to < self.length) {
        
        return [self substringToIndex:to];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return nil;
    }
}

/// 安全截取字符串
/// @param range 截取range范围
- (NSString *)qh_safetySubstringWithRange:(NSRange)range {
    
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    
    if (location < self.length) {
        
        if (location + length <= self.length) {
            
            return [self substringWithRange:range];
        } else {
            
            length = self.length - location;
            return [self substringWithRange:NSMakeRange(location, length)];
        }
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return nil;
    }
}

@end


@implementation NSMutableString (GQHSafety)

/// 指定位置安全插入字符串
/// @param aString 要插入的字符串
/// @param location 指定位置
- (void)qh_safetyInsertString:(NSString *)aString atIndex:(NSUInteger)location {
    
    if (aString && location < self.length) {
        
        [self insertString:aString atIndex:location];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 字符串后安全拼接字符串
/// @param aString 要拼接的字符串
- (void)qh_safetyAppendString:(NSString *)aString {
    
    if (aString) {
        
        [self appendString:aString];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 安全修改可变字符串的字符内容
/// @param aString 要修改的字符串
- (void)qh_safetySetString:(NSString *)aString {
    
    if (aString) {
        
        [self setString:aString];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 安全删除区间内的字符
/// @param range 要删除的字符串range范围
- (void)qh_safetyDeleteCharactersInRange:(NSRange)range {
    
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    
    if (location < self.length) {
        
        if (location + length <= self.length) {
            
            [self deleteCharactersInRange:range];
        } else {
            
            length = self.length - location;
            [self deleteCharactersInRange:NSMakeRange(location, length)];
        }
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

@end
