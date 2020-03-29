//
//  UIButton+GQHButton.h
//  Seed
//
//  Created by Mac on 2018/7/5.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 按钮图文排版方式
 
 - GQHButtonGraphicLayoutStyleVerticalDefault: 上图下字
 - GQHButtonGraphicLayoutStyleVerticalOpposite: 上字下图
 - GQHButtonGraphicLayoutStyleHorizontalDefault: 左图右字
 - GQHButtonGraphicLayoutStyleHorizontalOpposite: 左字右图
 */
typedef NS_ENUM(NSUInteger, GQHButtonGraphicLayoutStyle) {
    
    
    GQHButtonGraphicLayoutStyleVerticalDefault = 0,
    GQHButtonGraphicLayoutStyleVerticalOpposite,
    GQHButtonGraphicLayoutStyleHorizontalDefault,
    GQHButtonGraphicLayoutStyleHorizontalOpposite
};


@interface UIButton (GQHButton)

/**
 按钮图文排版样式 (枚举)
 */
@property (nonatomic, assign) GQHButtonGraphicLayoutStyle qh_buttonGraphicLayoutStyle;

/**
 按钮图文间距
 */
@property (nonatomic, assign) float qh_buttonGraphicLayoutSpacing;

/**
 点击事件时间间隔
 */
@property (nonatomic, assign) NSTimeInterval qh_timeIntervalOnclick;

@end
