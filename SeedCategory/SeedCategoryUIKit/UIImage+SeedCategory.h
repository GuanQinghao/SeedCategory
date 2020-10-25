//
//  UIImage+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <UIKit/UIKit.h>


/// 翻转方向
typedef NS_ENUM(NSUInteger, SeedFlipDirection) {
    
    /// 垂向翻转
    SeedFlipDirectionVertical,
    /// 水平翻转
    SeedFlipDirectionHorizontal,
};


NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SeedCategory)

/// 获取纯色图片
/// @param color 颜色
+ (nullable UIImage *)s_imageWithColor:(UIColor *)color;

/// 获取指定大小的纯色图片
/// @param color 颜色
/// @param size 指定大小
+ (nullable UIImage *)s_imageWithColor:(UIColor *)color size:(CGSize)size;

/// base64编码转图片
/// @param encode base64编码
+ (nullable UIImage *)s_imageWithBase64:(NSString *)encode;

/// 截图/截屏
/// @param view 源视图
+ (nullable UIImage *)s_imageFromView:(__kindof UIView *)view;

/// 带边框的圆形图片
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
/// @param image 图片
+ (nullable UIImage *)s_imageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor image:(UIImage *)image;

/// 压缩图片到指定大小(质量和尺寸)
/// @param image 图片
/// @param maxValue 指定大小(单位KB)
+ (NSData *)s_compressImage:(UIImage *)image toKilobytes:(NSUInteger)maxValue;

/// 根据字符串生成条形码图片
/// @param string 条形码图片字符串
/// @param size 条形码图片大小
+ (UIImage *)s_barCodeImageWithString:(NSString *)string size:(CGFloat)size;

/// 根据字符串生成二维码图片
/// @param string 二维码图片字符串
/// @param size 二维码图片大小
+ (UIImage *)s_QRCodeImageWithString:(NSString *)string size:(CGFloat)size;

/// 视频某个时刻的屏幕快照
/// @param URLString 网络视频地址
/// @param interval 时刻(秒)
+ (nullable UIImage *)s_screenshotForVideo:(NSString *)URLString at:(NSTimeInterval)interval;

/// 生成GIF图片
/// @param data gif数据
+ (nullable UIImage *)s_animateGIFWithData:(NSData *)data;

/// 图片转base64编码
- (NSString *)s_base64;

/// 将彩色图片转换成灰度图片
- (nullable UIImage *)s_imageWithGrayscale;

/// 旋转图片
/// @param degrees 旋转角度
- (UIImage *)s_imageRotatedWithDegrees:(CGFloat)degrees;

/// 翻转图片
/// @param direction 翻转方向
- (UIImage *)s_imageFlipedWithDirection:(SeedFlipDirection)direction;

/// 缩放图片到指定尺寸
/// @param size 指定尺寸
- (nullable UIImage *)s_imageRescaledWithSize:(CGSize)size;

/// 添加图片水印
/// @param rect 水印的位置
/// @param anImage 图片的水印
- (UIImage *)s_watermarkInRect:(CGRect)rect image:(nullable UIImage *)anImage;

/// 添加文字水印
/// @param rect 水印位置
/// @param aString 图片的文字水印
- (UIImage *)s_watermarkInRect:(CGRect)rect string:(nullable NSAttributedString *)aString;

/// 显示图片水印 - 原图水印要求: 深色深且高透明度
- (UIImage *)s_watermarkCanVisible;

@end

NS_ASSUME_NONNULL_END
