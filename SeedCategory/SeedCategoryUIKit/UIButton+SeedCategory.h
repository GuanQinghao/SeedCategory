//
//  UIButton+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <UIKit/UIKit.h>


/// 按钮图文排版方式
typedef NS_ENUM(NSUInteger, SeedButtonGraphicLayoutStyle) {
    
    /// 上图下字
    SeedButtonGraphicLayoutStyleVerticalDefault,
    /// 上字下图
    SeedButtonGraphicLayoutStyleVerticalOpposite,
    /// 左图右字
    SeedButtonGraphicLayoutStyleHorizontalDefault,
    /// 左字右图
    SeedButtonGraphicLayoutStyleHorizontalOpposite
};


NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SeedCategory)

/// 按钮图文排版样式 (枚举)
@property (nonatomic, assign) SeedButtonGraphicLayoutStyle s_graphicLayoutStyle;

/// 按钮图文间距
@property (nonatomic, assign) float s_graphicLayoutSpacing;

/// 点击事件时间间隔
@property (nonatomic, assign) NSTimeInterval s_intervalOnClick;

@end

NS_ASSUME_NONNULL_END
