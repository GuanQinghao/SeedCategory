//
//  NSString+GQHFormatter.m
//  Seed
//
//  Created by GuanQinghao on 16/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "NSString+GQHFormatter.h"


@implementation NSString (GQHFormatter)

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

@end
