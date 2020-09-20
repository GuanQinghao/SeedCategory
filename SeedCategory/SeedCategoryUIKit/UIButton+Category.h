//
//  UIButton+Category.h
//  Expecta
//
//  Created by GuanQinghao on 2020/9/20.
//

#import <UIKit/UIKit.h>

/// 按钮图文排版方式
typedef NS_ENUM(NSUInteger, GQHButtonGraphicLayoutStyle) {
    
    /// 上图下字
    GQHButtonGraphicLayoutStyleVerticalDefault,
    /// 上字下图
    GQHButtonGraphicLayoutStyleVerticalOpposite,
    /// 左图右字
    GQHButtonGraphicLayoutStyleHorizontalDefault,
    /// 左字右图
    GQHButtonGraphicLayoutStyleHorizontalOpposite
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Category)

/// 按钮图文排版样式 (枚举)
@property (nonatomic, assign) GQHButtonGraphicLayoutStyle qh_buttonGraphicLayoutStyle;

/// 按钮图文间距
@property (nonatomic, assign) float qh_buttonGraphicLayoutSpacing;

/// 点击事件时间间隔
@property (nonatomic, assign) NSTimeInterval qh_timeIntervalOnclick;

@end

NS_ASSUME_NONNULL_END
