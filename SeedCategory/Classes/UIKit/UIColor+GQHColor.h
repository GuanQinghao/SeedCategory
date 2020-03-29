//
//  UIColor+GQHColor.h
//  Seed
//
//  Created by GuanQinghao on 21/03/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIColor (GQHColor)

#pragma mark - Converter

/**
 RGB颜色
 
 @param red 红色R (0~255)
 @param green 绿色G (0~255)
 @param blue 蓝色B (0~255)
 @return RGB颜色
 */
+ (UIColor *)qh_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue;

/**
 RGBA颜色
 
 @param red 红色R (0~255)
 @param green 绿色G (0~255)
 @param blue 蓝色B (0~255)
 @param alpha 透明度A (0.0~1.0)
 @return RGBA颜色
 */
+ (UIColor *)qh_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;

/**
 HSB颜色
 
 @param hue 色相H (0~360)
 @param saturation 饱和度S (0~100)
 @param brightness 亮度B (0~100)
 @return HSB颜色
 */
+ (UIColor *)qh_colorWithHue:(NSUInteger)hue saturation:(NSUInteger)saturation brightness:(NSUInteger)brightness;

/**
 HSBA颜色
 
 @param hue 色相H (0~360)
 @param saturation 饱和度S (0~100)
 @param brightness 亮度B (0~100)
 @param alpha 透明度A (0.0~1.0)
 @return HSBA颜色
 */
+ (UIColor *)qh_colorWithHue:(NSUInteger)hue saturation:(NSUInteger)saturation brightness:(NSUInteger)brightness alpha:(CGFloat)alpha;

/**
 HEX颜色
 
 @param hexString 十六进制字符串
 @return HEX颜色
 */
+ (UIColor *)qh_colorWithHexString:(NSString *)hexString;

/**
 HEXA颜色
 
 @param hexString 十六进制字符串
 @param alpha 透明度A (0.0~1.0)
 @return HEXA颜色
 */
+ (UIColor *)qh_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 HEX颜色
 
 @param hexValue 十六进制值
 @return HEX颜色
 */
+ (UIColor *)qh_colorWithHexValue:(uint32_t)hexValue;

/**
 HEXA颜色
 
 @param hexValue 十六进制值
 @param alpha 透明度A (0.0~1.0)
 @return HEXA颜色
 */
+ (UIColor *)qh_colorWithHexValue:(uint32_t)hexValue alpha:(CGFloat)alpha;

/**
 随机颜色
 
 @return 随机颜色
 */
+ (UIColor *)qh_randomColor;

/**
 渐变色
 
 @param colors 渐变颜色数组
 @param startPoint 渐变起点
 @param endPoint 渐变终点
 @return 渐变色
 */
+ (UIColor *)qh_gradientColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
