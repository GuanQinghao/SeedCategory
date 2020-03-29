//
//  UIView+GQHDashLine.h
//  Seed
//
//  Created by Mac on 2019/8/1.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIView (GQHDashLine)

/**
 绘制虚线, 建议在layout后调用
 
 @param dashLines 虚线所有的拐点
 @param width 虚线的宽度
 @param color 虚线的颜色
 @param lengths 虚线的样式
 */
- (void)qh_dashLines:(NSArray<NSValue *> *)dashLines width:(CGFloat)width color:(UIColor *)color lengths:(NSArray<NSNumber *> *)lengths;

@end

NS_ASSUME_NONNULL_END
