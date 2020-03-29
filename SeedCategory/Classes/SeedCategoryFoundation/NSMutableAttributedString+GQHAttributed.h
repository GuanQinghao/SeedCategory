//
//  NSMutableAttributedString+GQHAttributed.h
//  Seed
//
//  Created by Mac on 2018/12/24.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (GQHAttributed)

/// 属性字符串修改指定字符串属性
/// @param string 指定的字符串
/// @param font 新属性字体
/// @param color 新属性字体颜色
- (NSMutableAttributedString *)qh_attributedStringBy:(NSString *)string withFont:(UIFont *)font color:(UIColor *)color;

/// 字符串添加缩进
/// @param string 字符串
/// @param head 头部缩进
/// @param tail 尾部缩进(>0)
+ (NSMutableAttributedString *)qh_attributedStringWith:(NSString *)string headIndent:(CGFloat)head tailIndent:(CGFloat)tail;

@end

NS_ASSUME_NONNULL_END
