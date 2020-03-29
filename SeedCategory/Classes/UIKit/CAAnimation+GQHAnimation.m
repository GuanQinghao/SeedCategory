//
//  CAAnimation+GQHAnimation.m
//  Seed
//
//  Created by Mac on 2019/2/26.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import "CAAnimation+GQHAnimation.h"


@implementation CAAnimation (GQHAnimation)

/**
 晃动动画效果
 
 @param layer 动画层
 @param repeat 动画重复次数, 可能为小数，默认为0
 @param duration 动画持续时间, 默认为0
 @return 晃动动画效果
 */
+ (CAKeyframeAnimation *)qh_shakeAnimationWithLayer:(CALayer *)layer repeat:(CGFloat)repeat duration:(CGFloat)duration {
    
    CGPoint positon = layer.position;
    CGSize size = layer.bounds.size;
    CGFloat offset = 0.25f * size.width;
    
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animation];
    keyframe.keyPath = @"position";
    keyframe.values = @[
                        [NSValue valueWithCGPoint:CGPointMake(positon.x, positon.y)],
                        [NSValue valueWithCGPoint:CGPointMake(positon.x - offset, positon.y)],
                        [NSValue valueWithCGPoint:CGPointMake(positon.x, positon.y)],
                        [NSValue valueWithCGPoint:CGPointMake(positon.x + offset, positon.y)],
                        [NSValue valueWithCGPoint:CGPointMake(positon.x, positon.y)]
                        ];
    keyframe.repeatCount = repeat;
    keyframe.duration = duration;
    keyframe.fillMode = kCAFillModeForwards;
    
    return keyframe;
}

/**
 弹性动画效果
 
 @param layer 动画层
 @param repeat 动画重复次数, 可能为小数，默认为0
 @param duration 动画持续时间, 默认为0
 @return 弹性动画效果
 */
+ (CAKeyframeAnimation *)qh_bounceAnimationWithLayer:(CALayer *)layer repeat:(CGFloat)repeat duration:(CGFloat)duration {
    
    CGPoint positon = layer.position;
    CGSize size = layer.bounds.size;
    CGFloat offset = 0.25f * size.height;
    
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animation];
    keyframe.keyPath = @"position";
    keyframe.values = @[
                        [NSValue valueWithCGPoint:CGPointMake(positon.x, positon.y)],
                        [NSValue valueWithCGPoint:CGPointMake(positon.x, positon.y - offset)],
                        [NSValue valueWithCGPoint:CGPointMake(positon.x, positon.y)],
                        [NSValue valueWithCGPoint:CGPointMake(positon.x, positon.y + offset)],
                        [NSValue valueWithCGPoint:CGPointMake(positon.x, positon.y)]
                        ];
    keyframe.repeatCount = repeat;
    keyframe.duration = duration;
    keyframe.fillMode = kCAFillModeForwards;
    
    return keyframe;
}

/**
 缩放动画效果
 
 @param start 缩放起始大小, 初始为1
 @param end 缩放结束大小
 @param repeat 动画重复次数, 可能为小数，默认为0
 @param duration 动画持续时间, 默认为0
 @return 缩放动画效果
 */
+ (CABasicAnimation *)qh_scaleAnimationWithScaleFrom:(CGFloat)start to:(CGFloat)end repeat:(CGFloat)repeat duration:(CGFloat)duration {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @(start);
    animation.toValue = @(end);
    animation.duration = duration;
    animation.autoreverses = YES;
    animation.repeatCount = repeat;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}

/**
 呼吸动画效果
 
 @param repeat 动画重复次数, 可能为小数，默认为0
 @param duration 动画持续时间, 默认为0
 @return 呼吸动画效果
 */
+ (CABasicAnimation *)qh_breatheAnimationWithRepeat:(CGFloat)repeat duration:(CGFloat)duration {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(1.0f);
    animation.toValue = @(0.3f);
    animation.duration = duration;
    animation.autoreverses = YES;
    animation.repeatCount = repeat;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    return animation;
}

@end
