//
//  CAAnimation+GQHAnimation.h
//  Seed
//
//  Created by Mac on 2019/2/26.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


NS_ASSUME_NONNULL_BEGIN

@interface CAAnimation (GQHAnimation)

/**
 晃动动画效果
 
 @param layer 动画层
 @param repeat 动画重复次数, 可能为小数，默认为0
 @param duration 动画持续时间, 默认为0
 @return 晃动动画效果
 */
+ (CAKeyframeAnimation *)qh_shakeAnimationWithLayer:(CALayer *)layer repeat:(CGFloat)repeat duration:(CGFloat)duration;

/**
 弹性动画效果
 
 @param layer 动画层
 @param repeat 动画重复次数, 可能为小数，默认为0
 @param duration 动画持续时间, 默认为0
 @return 弹性动画效果
 */
+ (CAKeyframeAnimation *)qh_bounceAnimationWithLayer:(CALayer *)layer repeat:(CGFloat)repeat duration:(CGFloat)duration;

/**
 缩放动画效果
 
 @param start 缩放起始大小, 初始为1
 @param end 缩放结束大小
 @param repeat 动画重复次数, 可能为小数，默认为0
 @param duration 动画持续时间, 默认为0
 @return 缩放动画效果
 */
+ (CABasicAnimation *)qh_scaleAnimationWithScaleFrom:(CGFloat)start to:(CGFloat)end repeat:(CGFloat)repeat duration:(CGFloat)duration;

/**
 呼吸动画效果
 
 @param repeat 动画重复次数, 可能为小数，默认为0
 @param duration 动画持续时间, 默认为0
 @return 呼吸动画效果
 */
+ (CABasicAnimation *)qh_breatheAnimationWithRepeat:(CGFloat)repeat duration:(CGFloat)duration;

@end

NS_ASSUME_NONNULL_END
