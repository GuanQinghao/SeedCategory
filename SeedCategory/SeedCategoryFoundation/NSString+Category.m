//
//  NSString+Category.m
//
//  Created by GuanQinghao on 08/09/2020.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Category)



/// 手机号隐藏格式化 (保留前三位后四位)
/// @param mobile 手机号
+ (NSString *)qh_formatterSecretStringWithMobile:(NSString *)mobile {
    
    if (mobile) {
        
        NSString *aMobile = [mobile stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSMutableString *mString = [NSMutableString stringWithString:aMobile];
        
        if (11 == mString.length) {
            
            for (NSInteger i = 3; i < (mString.length - 4); i++) {
                
                [mString replaceCharactersInRange:NSMakeRange(i, 1) withString:@"*"];
            }
            
            return mString;
        }
    }
    
    return nil;
}

/// 身份证/银行卡/信用卡格式化 (保留前四位后四位)
/// @param cardNumber 身份证/银行卡/信用卡卡号
+ (NSString *)qh_formatterSecretStringWithCardNumber:(NSString *)cardNumber {
    
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
+ (NSString *)qh_formatterChineseAmountStringWithValue:(CGFloat)value {
    
    if ((int)(floor(value) / 100000000)) {
        
        return [NSString stringWithFormat:@"%.0f亿",(floor(value) / 100000000)];
    } else if ((int)(floor(value) / 10000)) {
        
        return [NSString stringWithFormat:@"%.0f万",(floor(value) / 10000)];
    } else {
        
        return [NSString stringWithFormat:@"%.0f",value];
    }
}

/// 计算文本的大小
/// @param font 文本字体
/// @param maxSize 最大size
- (CGSize)qh_formatterSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    
    NSDictionary *attributeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    
    CGRect rect = [self boundingRectWithSize:maxSize options:options attributes:attributeDictionary context:nil];
    CGSize size = CGSizeMake(ceil(rect.size.width), ceil(rect.size.height));
    
    return size;
}

/// MD5加密 32位小写16进制
/// @param string 需要加密的字符串
+ (NSString *)qh_encryptWithMD5:(NSString *)string {
    
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

/// 是否大于某一版本
/// @param version 某一版本
- (BOOL)qh_newerThan:(NSString *)version {
    
    return [self compare:version] == NSOrderedDescending;
}

/// 是否大于或等于某一版本
/// @param version 某一版本
- (BOOL)qh_newerThanOrEqualTo:(NSString *)version {
    
    NSComparisonResult result = [self compare:version];
    
    return result == NSOrderedDescending || result == NSOrderedSame;
}

/// 是否小于某一版本
/// @param version 某一版本
- (BOOL)qh_olderThan:(NSString *)version {
    
    return [self compare:version] == NSOrderedAscending;
}

/// 是否小于或等于某一版本
/// @param version 某一版本
- (BOOL)qh_olderThanOrEqualTo:(NSString *)version {
    
    NSComparisonResult result = [self compare:version];
    
    return result == NSOrderedAscending || result == NSOrderedSame;
}

/// 版本号比较
/// @param version 版本号
- (NSComparisonResult)compare:(NSString *)version {
    
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
