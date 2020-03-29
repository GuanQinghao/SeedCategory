//
//  UIImage+GQHImage.h
//  Seed
//
//  Created by GuanQinghao on 21/03/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 图片翻转方向
 
 - GQHFlipDirectionVertical: 垂直翻转
 - GQHFlipDirectionHorizontal: 水平翻转
 */
typedef NS_ENUM(NSUInteger,GQHFlipDirection) {
    
    GQHFlipDirectionVertical,
    GQHFlipDirectionHorizontal
};


NS_ASSUME_NONNULL_BEGIN

@interface UIImage (GQHImage)

/**
 将彩色图片转换成灰度图片
 
 @return 灰度图片
 */
- (UIImage *)qh_imageWithGrayscale;

/**
 旋转图片
 
 @param degrees 旋转角度
 @return 旋转后的图片
 */
- (UIImage *)qh_imageRotatedWithDegrees:(CGFloat)degrees;

/**
 翻转图片
 
 @param direction 翻转方向(水平翻转或垂向翻转)
 @return 翻转后的图片
 */
- (UIImage *)qh_imageFlipedWithDirection:(GQHFlipDirection)direction;

/**
 缩放图片到指定尺寸
 
 @param size 指定尺寸
 @return 指定尺寸的图片
 */
- (UIImage *)qh_imageRescaledWithSize:(CGSize)size;

/**
 获取纯色图片
 
 @param color 颜色
 @return 纯色图片
 */
+ (UIImage *)qh_imageWithColor:(UIColor *)color;

/**
 获取指定大小的纯色图片
 
 @param color 颜色
 @param size 指定大小
 @return 指定大小的纯色图片
 */
+ (UIImage *)qh_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 截图/截屏
 
 @param view 源视图
 @return 截图/截屏
 */
+ (UIImage *)qh_imageFromView:(__kindof UIView *)view;

/**
 带边框的圆形图片
 
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @param image 图片
 @return 带边框的圆形图片
 */
+ (UIImage *)qh_imageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor image:(UIImage *)image;

/**
 压缩图片到指定大小(质量和尺寸)
 
 @param image 图片
 @param maxValue 指定大小(单位KB)
 @return 图片数据
 */
+ (NSData *)qh_compressImage:(UIImage *)image toKilobytes:(NSUInteger)maxValue;

/**
 根据字符串生成条形码图片
 
 @param string 条形码图片字符串
 @param size 条形码图片大小
 @return 条形码图片
 */
+ (UIImage *)qh_barCodeImageWithString:(NSString *)string size:(CGFloat)size;

/**
 根据字符串生成二维码图片
 
 @param string 二维码图片字符串
 @param size 二维码图片大小
 @return 二维码图片
 */
+ (UIImage *)qh_QRCodeImageWithString:(NSString *)string size:(CGFloat)size;

/**
 base64编码转图片
 
 @param encode base64编码
 @return 图片对象
 */
+ (UIImage *)qh_imageWithBase64:(NSString *)encode;

/**
 图片转base64编码
 
 @return base64编码
 */
- (NSString *)qh_base64;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface UIImage (GQHGIF)

/**
 生成GIF图片
 
 @param data gif数据
 @return GIF图片
 */
+ (UIImage *)qh_animateGIFWithData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface UIImage (GQHWatermark)

/**
 添加图片水印
 
 @param rect 水印的位置
 @param anImage 图片的水印
 @return 带水印的图片
 */
- (nonnull UIImage *)qh_watermarkInRect:(CGRect)rect image:(nullable UIImage *)anImage;

/**
 添加文字水印
 
 @param rect 水印位置
 @param aString 图片的文字水印
 @return 带文字水印的图片
 */
- (nonnull UIImage *)qh_watermarkInRect:(CGRect)rect string:(nullable NSAttributedString *)aString;

/**
 显示图片水印
 原图水印要求: 深色深且高透明度
 
 @return 显示水印的图片
 */
- (nonnull UIImage *)qh_watermarkCanVisible;

@end

NS_ASSUME_NONNULL_END
