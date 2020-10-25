//
//  UIColor+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIColor (SeedCategory)

/// RGB颜色
/// @param red 红色R (0~255)
/// @param green 绿色G (0~255)
/// @param blue 蓝色B (0~255)
+ (UIColor *)s_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue;

/// RGBA颜色
/// @param red 红色R (0~255)
/// @param green 绿色G (0~255)
/// @param blue 蓝色B (0~255)
/// @param alpha 透明度A (0.0~1.0)
+ (UIColor *)s_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;

/// HSB颜色
/// @param hue 色相H (0~360)
/// @param saturation 饱和度S (0~100)
/// @param brightness 亮度B (0~100)
+ (UIColor *)s_colorWithHue:(NSUInteger)hue saturation:(NSUInteger)saturation brightness:(NSUInteger)brightness;

/// HSBA颜色
/// @param hue 色相H (0~360)
/// @param saturation 饱和度S (0~100)
/// @param brightness 亮度B (0~100)
/// @param alpha 透明度A (0.0~1.0)
+ (UIColor *)s_colorWithHue:(NSUInteger)hue saturation:(NSUInteger)saturation brightness:(NSUInteger)brightness alpha:(CGFloat)alpha;

/// HEX颜色
/// @param hexString 十六进制字符串
+ (UIColor *)s_colorWithHexString:(NSString *)hexString;

/// HEXA颜色
/// @param hexString 十六进制字符串
/// @param alpha 透明度A (0.0~1.0)
+ (UIColor *)s_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/// HEX颜色
/// @param hexValue 十六进制值
+ (UIColor *)s_colorWithHexValue:(uint32_t)hexValue;

/// HEXA颜色
/// @param hexValue 十六进制值
/// @param alpha 透明度A (0.0~1.0)
+ (UIColor *)s_colorWithHexValue:(uint32_t)hexValue alpha:(CGFloat)alpha;

/// 随机颜色
+ (UIColor *)s_randomColor;

/// 渐变色
/// @param colors 渐变颜色数组
/// @param start 渐变起点
/// @param end 渐变终点
+ (UIColor *)s_colorWith:(NSArray<UIColor *> *)colors start:(CGPoint)start end:(CGPoint)end;

@end

NS_ASSUME_NONNULL_END
