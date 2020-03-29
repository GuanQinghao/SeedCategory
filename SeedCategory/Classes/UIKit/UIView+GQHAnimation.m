//
//  UIView+GQHAnimation.m
//  Seed
//
//  Created by GuanQinghao on 30/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "UIView+GQHAnimation.h"


@implementation UIView (GQHAnimation)

+ (void)qh_animateShakedWithLayer:(CALayer *)layer type:(GQHAnimationShakedType)type {
    
    CGPoint position = [layer position];
    CGPoint start = CGPointMake(position.x, position.y);
    CGPoint end = CGPointMake(position.x, position.y);
    
    if (type == GQHAnimationShakedTypeHorizontal) {
        
        start.x = start.x - 10.0f;
        end.x = end.x + 10.0f;
    } else {
        
        start.y = start.y - 10.0f;
        end.y = end.y + 10.0f;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    animation.fromValue = [NSValue valueWithCGPoint:start];
    animation.toValue = [NSValue valueWithCGPoint:end];
    animation.autoreverses = YES;
    animation.duration = 0.08f;
    animation.repeatCount = 2;
    [layer addAnimation:animation forKey:nil];
}

+ (void)qh_animateScaledWithLayer:(CALayer *)layer type:(GQHAnimationScaledType)type {
    
    NSNumber *scaleInOut = (type == GQHAnimationScaledTypeInOut) ? @(1.20) : @(0.80);
    NSNumber *scaleOutIn = (type == GQHAnimationScaledTypeInOut) ? @(0.80) : @(1.20);
    
    [UIView animateWithDuration:0.15f delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [layer setValue:scaleInOut forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.15f delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [layer setValue:scaleOutIn forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.1f delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                
                [layer setValue:@(1.0) forKeyPath:@"transform.scale"];
            } completion:nil];
        }];
    }];
}

@end
