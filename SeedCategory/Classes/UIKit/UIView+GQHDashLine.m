//
//  UIView+GQHDashLine.m
//  Seed
//
//  Created by Mac on 2019/8/1.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import "UIView+GQHDashLine.h"


@implementation UIView (GQHDashLine)

/**
 绘制虚线, 建议在layout后调用
 
 @param dashLines 虚线所有的拐点
 @param width 虚线的宽度
 @param color 虚线的颜色
 @param lengths 虚线的样式
 */
- (void)qh_dashLines:(NSArray<NSValue *> *)dashLines width:(CGFloat)width color:(UIColor *)color lengths:(NSArray<NSNumber *> *)lengths {
    
    CAShapeLayer *dashLineShapeLayer = [CAShapeLayer layer];
    
    // 虚线填充色
    [dashLineShapeLayer setFillColor:[UIColor clearColor].CGColor];
    // 虚线颜色
    [dashLineShapeLayer setStrokeColor:color.CGColor];
    // 虚线线宽
    [dashLineShapeLayer setLineWidth:width];
    // 虚线顶端样式
    [dashLineShapeLayer setLineCap:kCALineCapRound];
    // 虚线相交模式
    [dashLineShapeLayer setLineJoin:kCALineJoinRound];
    
    // 虚线样式
    [dashLineShapeLayer setLineDashPattern:lengths];
    
    // 虚线绘制路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 虚线所有拐点
    [dashLines enumerateObjectsUsingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (0 == idx) {
            
            CGPoint point = [obj CGPointValue];
            // 虚线起点
            CGPathMoveToPoint(path, NULL, point.x, point.y);
        } else {
            
            CGPoint point = [obj CGPointValue];
            // 虚线折点
            CGPathAddLineToPoint(path, NULL, point.x, point.y);
        }
    }];
    
    [dashLineShapeLayer setPath:path];
    CGPathRelease(path);
    
    // 添加虚线
    [self.layer addSublayer:dashLineShapeLayer];
}

@end
