//
//  UIButton+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <UIKit/UIKit.h>


/// 按钮图文排版方式
typedef NS_ENUM(NSUInteger, SeedButtonGraphicLayoutStyle) {
    
    /// 文字靠左
    SeedButtonGraphicLayoutStyleTextLeft,
    /// 文字靠右
    SeedButtonGraphicLayoutStyleTextRight,
    
    /// 文字靠上
    SeedButtonGraphicLayoutStyleTextTop,
    /// 文字靠下
    SeedButtonGraphicLayoutStyleTextBottom,
};


NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SeedCategory)

/// 设置按钮的图文样式
/// @param style 图文样式
/// @param spacing 图文间距
/// @param operation 图文设置回调(在回调中设置图片和文字)
- (void)s_setGraphicStyle:(SeedButtonGraphicLayoutStyle)style spacing:(CGFloat)spacing withOperation:(void (^)(UIButton *button))operation;

@end

NS_ASSUME_NONNULL_END
