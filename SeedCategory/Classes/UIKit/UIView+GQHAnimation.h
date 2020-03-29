//
//  UIView+GQHAnimation.h
//  Seed
//
//  Created by GuanQinghao on 30/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, GQHAnimationShakedType) {
    
    /// 上下振动
    GQHAnimationShakedTypeVertical,
    /// 左右振动
    GQHAnimationShakedTypeHorizontal
};

typedef NS_ENUM(NSUInteger, GQHAnimationScaledType) {
    
    /// 先放大后缩小弹性变化
    GQHAnimationScaledTypeInOut,
    /// 先缩小后放大弹性缩放
    GQHAnimationScaledTypeOutIn
};

@interface UIView (GQHAnimation)

/// 弹性振动动画
+ (void)qh_animateShakedWithLayer:(CALayer *)layer type:(GQHAnimationShakedType)type;

/// 弹性缩放动画
+ (void)qh_animateScaledWithLayer:(CALayer *)layer type:(GQHAnimationScaledType)type;

@end
