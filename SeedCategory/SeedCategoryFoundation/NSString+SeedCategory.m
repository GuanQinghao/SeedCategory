//
//  NSString+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "NSString+SeedCategory.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (SeedCategory)

#pragma mark - class method

/// 手机号隐藏格式化 (保留前三位后四位)
/// @param mobile 手机号
+ (NSString *)s_formatMobileWith:(NSString *)mobile {
    
    if (mobile) {
        
        NSString *checked = [mobile stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSMutableString *result = [NSMutableString stringWithString:checked];
        
        if (11 == result.length) {
            
            for (NSInteger i = 3; i < (result.length - 4); i++) {
                
                [result replaceCharactersInRange:NSMakeRange(i, 1) withString:@"*"];
            }
            
            return result;
        }
    }
    
    return nil;
}

/// 身份证/银行卡/信用卡格式化 (保留前四位后四位)
/// @param cardNumber 身份证/银行卡/信用卡卡号
+ (NSString *)s_formatCardNumberWith:(NSString *)cardNumber {
    
    if (cardNumber) {
        
        NSString *aCardNumber = [cardNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSMutableString *mString = [NSMutableString stringWithString:aCardNumber];
        
        if (mString.length < 8) {
            
            return nil;
        }
        
        for (NSInteger i = 4; i < (mString.length - 4); i++) {
            
            NSRange range = NSMakeRange(i, 1);
            [mString replaceCharactersInRange:range withString:@"*"];
        }
        
        return mString;
    }
    
    return nil;
}

/// 数量转中文单位
/// @param value 数量值
+ (NSString *)s_formatChineseAmountWith:(CGFloat)value {
    
    if ((int)(floor(value) / 100000000)) {
        
        return [NSString stringWithFormat:@"%.0f亿",(floor(value) / 100000000)];
    } else if ((int)(floor(value) / 10000)) {
        
        return [NSString stringWithFormat:@"%.0f万",(floor(value) / 10000)];
    } else {
        
        return [NSString stringWithFormat:@"%.0f",value];
    }
}

/// MD5加密 32位小写16进制
/// @param string 需要加密的字符串
+ (NSString *)s_encryptWithMD5:(NSString *)string {
    
    if (!string) {
        
        return nil;
    }
    
    // 转换为UTF8字符串
    const char *cString = [string UTF8String];
    
    // 16位数组
    unsigned char cipher[CC_MD5_DIGEST_LENGTH];
    
    // 系统封装好的加密方法 将UTF8字符串转换成16进制数列(不可逆过程)
    CC_MD5(cString, (CC_LONG)strlen(cString), cipher);
    
    // 32位字符串
    NSMutableString *cipherString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    // 32位16进制字符串
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        
        // 小写
        [cipherString appendFormat:@"%02x",cipher[i]];
        // 大写
        //[cipherString appendFormat:@"%02X",cipher[i]];
    }
    
    return cipherString;
}

/// 计算文本的大小
/// @param font 文本字体
/// @param maxSize 最大size
- (CGSize)s_formatSizeWith:(UIFont *)font maxSize:(CGSize)maxSize {
    
    NSDictionary *attributeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    
    CGRect rect = [self boundingRectWithSize:maxSize options:options attributes:attributeDictionary context:nil];
    CGSize size = CGSizeMake(ceil(rect.size.width), ceil(rect.size.height));
    
    return size;
}

/// 是否大于某一版本
/// @param version 某一版本
- (BOOL)s_newerThan:(NSString *)version {
    
    return [self s_compare:version] == NSOrderedDescending;
}

/// 是否大于或等于某一版本
/// @param version 某一版本
- (BOOL)s_newerThanOrEqualTo:(NSString *)version {
    
    NSComparisonResult result = [self s_compare:version];
    
    return result == NSOrderedDescending || result == NSOrderedSame;
}

/// 是否小于某一版本
/// @param version 某一版本
- (BOOL)s_olderThan:(NSString *)version {
    
    return [self s_compare:version] == NSOrderedAscending;
}

/// 是否小于或等于某一版本
/// @param version 某一版本
- (BOOL)s_olderThanOrEqualTo:(NSString *)version {
    
    NSComparisonResult result = [self s_compare:version];
    
    return result == NSOrderedAscending || result == NSOrderedSame;
}

/// 版本号比较
/// @param version 版本号
- (NSComparisonResult)s_compare:(NSString *)version {
    
    NSArray *leftVersion = [self componentsSeparatedByString:@"."];
    NSArray *rightVersion = [version componentsSeparatedByString:@"."];
    
    // 比较次数
    NSInteger count = MAX(leftVersion.count, rightVersion.count);
    
    for (NSInteger i = 0; i < count; i++) {
        
        // 版本某位上的值
        NSInteger left = (i < leftVersion.count) ? [leftVersion[i] integerValue] : 0;
        // 版本某位上的值
        NSInteger right = (i < rightVersion.count) ? [rightVersion[i] integerValue] : 0;
        
        if (left > right) {
            
            // 降序
            return NSOrderedDescending;
        } else if ( left < right) {
            
            // 升序
            return NSOrderedAscending;
        }
    }
    
    return NSOrderedSame;
}

/// 安全截取字符串
/// @param from 截取起始位置
- (NSString *)s_substringFromIndex:(NSUInteger)from {
    
    if (from < self.length) {
        
        return [self substringFromIndex:from];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return nil;
    }
}

/// 安全截取字符串
/// @param to 截取结束位置
- (NSString *)s_substringToIndex:(NSUInteger)to {
    
    if (to < self.length) {
        
        return [self substringToIndex:to];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return nil;
    }
}

/// 安全截取字符串
/// @param range 截取range范围
- (NSString *)s_substringWithRange:(NSRange)range {
    
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


@implementation NSMutableString (SeedCategory)

/// 指定位置安全插入字符串
/// @param aString 要插入的字符串
/// @param location 指定位置
- (void)s_insertString:(NSString *)aString atIndex:(NSUInteger)location {
    
    if (aString && location < self.length) {
        
        [self insertString:aString atIndex:location];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 字符串后安全拼接字符串
/// @param aString 要拼接的字符串
- (void)s_appendString:(NSString *)aString {
    
    if (aString) {
        
        [self appendString:aString];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 安全修改可变字符串的字符内容
/// @param aString 要修改的字符串
- (void)s_setString:(NSString *)aString {
    
    if (aString) {
        
        [self setString:aString];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 安全删除区间内的字符
/// @param range 要删除的字符串range范围
- (void)s_deleteCharactersInRange:(NSRange)range {
    
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


@implementation NSMutableAttributedString (SeedCategory)

/// 属性字符串修改指定字符串属性
/// @param string 指定的字符串
/// @param font 新属性字体
/// @param color 新属性字体颜色
- (NSMutableAttributedString *)s_attributedStringBy:(NSString *)string withFont:(UIFont *)font color:(UIColor *)color {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    NSRange range = [self.string rangeOfString:string];
    [attributedString addAttribute:NSFontAttributeName value:font range:range];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    return attributedString;
}

/// 字符串添加缩进
/// @param string 字符串
/// @param head 头部缩进
/// @param tail 尾部缩进(>0)
+ (NSMutableAttributedString *)s_attributedStringWith:(NSString *)string headIndent:(CGFloat)head tailIndent:(CGFloat)tail {
    
    NSMutableParagraphStyle *style = [NSParagraphStyle defaultParagraphStyle].mutableCopy;
    // 对齐方式
    style.alignment = NSTextAlignmentJustified;
    // 首行缩进
    style.firstLineHeadIndent = head;
    // 头部缩进
    style.headIndent = head;
    // 尾部缩进
    style.tailIndent = -tail;
    
    return [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSParagraphStyleAttributeName:style}];
}

@end
