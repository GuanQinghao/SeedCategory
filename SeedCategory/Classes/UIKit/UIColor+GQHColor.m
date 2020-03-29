//
//  UIColor+GQHColor.m
//  Seed
//
//  Created by GuanQinghao on 21/03/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "UIColor+GQHColor.h"


@implementation UIColor (GQHColor)

#pragma mark - Constant

#pragma mark - Converter

/**
 RGB颜色
 
 @param red 红色R (0~255)
 @param green 绿色G (0~255)
 @param blue 蓝色B (0~255)
 @return RGB颜色
 */
+ (UIColor *)qh_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue {
    
    return [self qh_colorWithRed:red green:green blue:blue alpha:1.0f];
}

/**
 RGBA颜色
 
 @param red 红色R (0~255)
 @param green 绿色G (0~255)
 @param blue 蓝色B (0~255)
 @param alpha 透明度A (0.0~1.0)
 @return RGBA颜色
 */
+ (UIColor *)qh_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha {
    
    alpha = (alpha < 0.0f) ? 0.0f : ((alpha > 1.0f) ? 1.0f : alpha);
    
    if (red < 256 && green < 256 && red < 256) {
        
        return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha/1.0f];
    } else {
        
        return [UIColor clearColor];
    }
}

/**
 HSB颜色
 
 @param hue 色相H (0~360)
 @param saturation 饱和度S (0~100)
 @param brightness 亮度B (0~100)
 @return HSB颜色
 */
+ (UIColor *)qh_colorWithHue:(NSUInteger)hue saturation:(NSUInteger)saturation brightness:(NSUInteger)brightness {
    
    return [self qh_colorWithHue:hue saturation:saturation brightness:brightness alpha:1.0f];
}

/**
 HSBA颜色
 
 @param hue 色相H (0~360)
 @param saturation 饱和度S (0~100)
 @param brightness 亮度B (0~100)
 @param alpha 透明度A (0.0~1.0)
 @return HSBA颜色
 */
+ (UIColor *)qh_colorWithHue:(NSUInteger)hue saturation:(NSUInteger)saturation brightness:(NSUInteger)brightness alpha:(CGFloat)alpha {
    
    alpha = (alpha < 0.0f) ? 0.0f : ((alpha > 1.0f) ? 1.0f : alpha);
    
    hue = (hue > 360) ? 360 : hue;
    saturation = (saturation > 100) ? 100 : saturation;
    brightness = (brightness > 100) ? 100 : brightness;
    
    return [UIColor colorWithHue:hue/360.0f saturation:saturation/100.0f brightness:brightness/100.0f alpha:alpha/1.0f];
}

/**
 HEX颜色
 
 @param hexString 十六进制字符串
 @return HEX颜色
 */
+ (UIColor *)qh_colorWithHexString:(NSString *)hexString {
    
    return [self qh_colorWithHexString:hexString alpha:1.0f];
}

/**
 HEXA颜色
 
 @param hexString 十六进制字符串
 @param alpha 透明度A (0.0~1.0)
 @return HEXA颜色
 */
+ (UIColor *)qh_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6 || [cString length] > 8) {
        
        return [UIColor clearColor];
    }
    
    if ([cString hasPrefix:@"0X"]) {
        
        cString = [cString substringFromIndex:2];
    }
    
    if ([cString hasPrefix:@"#"]) {
        
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] != 6) {
        
        return [UIColor clearColor];
    }
    
    NSRange range = NSMakeRange(0, 2);
    NSString *redString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *greenString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *blueString = [cString substringWithRange:range];
    
    unsigned int red;
    unsigned int green;
    unsigned int blue;
    
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    
    return [self qh_colorWithRed:red green:green blue:blue alpha:alpha];
}

/**
 HEX颜色
 
 @param hexValue 十六进制值
 @return HEX颜色
 */
+ (UIColor *)qh_colorWithHexValue:(uint32_t)hexValue {
    
    return [self qh_colorWithHexValue:hexValue alpha:1.0f];
}

/**
 HEXA颜色
 
 @param hexValue 十六进制值
 @param alpha 透明度A (0.0~1.0)
 @return HEXA颜色
 */
+ (UIColor *)qh_colorWithHexValue:(uint32_t)hexValue alpha:(CGFloat)alpha {
    
    int red = (hexValue & 0xFF0000) >> 16;
    int green = (hexValue & 0xFF00) >> 8;
    int blue = (hexValue & 0xFF) >> 0;
    
    return [self qh_colorWithRed:red green:green blue:blue alpha:alpha];
}

/**
 随机颜色
 
 @return 随机颜色
 */
+ (UIColor *)qh_randomColor {
    
    NSUInteger red = arc4random()%256;
    NSUInteger green = arc4random()%256;
    NSUInteger blue = arc4random()%256;
    
    return [self qh_colorWithRed:red green:green blue:blue];
}

/**
 渐变色
 
 @param colors 渐变颜色数组
 @param startPoint 渐变起点
 @param endPoint 渐变终点
 @return 渐变色
 */
+ (UIColor *)qh_gradientColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    
    if (colors.count <= 0) {
        
        return UIColor.blackColor;
    }
    
    NSMutableArray *CGColors = [NSMutableArray array];
    
    // UIColor -> CGColor
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [CGColors addObject:(id)obj.CGColor];
    }];
    
    double width =  fabs(endPoint.x - startPoint.x);
    double height = fabs(endPoint.y - startPoint.y);
    
    width = width ? : 1.0f;
    height = height ? : 1.0f;
    
    CGSize size = CGSizeMake(width, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)CGColors, NULL);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

@end
