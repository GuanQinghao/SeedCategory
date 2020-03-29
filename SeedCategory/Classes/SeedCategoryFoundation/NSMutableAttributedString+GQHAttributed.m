//
//  NSMutableAttributedString+GQHAttributed.m
//  Seed
//
//  Created by Mac on 2018/12/24.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "NSMutableAttributedString+GQHAttributed.h"


@implementation NSMutableAttributedString (GQHAttributed)

/// 属性字符串修改指定字符串属性
/// @param string 指定的字符串
/// @param font 新属性字体
/// @param color 新属性字体颜色
- (NSMutableAttributedString *)qh_attributedStringBy:(NSString *)string withFont:(UIFont *)font color:(UIColor *)color {
    
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
+ (NSMutableAttributedString *)qh_attributedStringWith:(NSString *)string headIndent:(CGFloat)head tailIndent:(CGFloat)tail {
    
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
