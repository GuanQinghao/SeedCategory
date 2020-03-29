//
//  UIView+GQHFrame.m
//  Seed
//
//  Created by GuanQinghao on 12/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "UIView+GQHFrame.h"
#import <objc/message.h>


/// 全局常量-视图单倍外边距
CGFloat const GQHFrameSingleMargin = 12.0f;
/// 全局常量-视图双倍外边距
CGFloat const GQHFrameDoubleMargin = 2 * GQHFrameSingleMargin;


@implementation UIView (GQHFrame)

- (void)setQh_x:(CGFloat)qh_x {
    
    CGRect rect = self.frame;
    rect.origin.x = qh_x;
    self.frame = rect;
}

- (CGFloat)qh_x {
    
    return CGRectGetMinX(self.frame);
}

- (void)setQh_y:(CGFloat)qh_y {
    
    CGRect rect = self.frame;
    rect.origin.y = qh_y;
    self.frame = rect;
}

- (CGFloat)qh_y {
    
    return CGRectGetMinY(self.frame);
}

- (void)setQh_width:(CGFloat)qh_width {
    
    CGRect rect = self.frame;
    rect.size.width = qh_width;
    self.frame = rect;
}

- (CGFloat)qh_width {
    
    return CGRectGetWidth(self.frame);
}

- (void)setQh_height:(CGFloat)qh_height {
    
    CGRect rect = self.frame;
    rect.size.height = qh_height;
    self.frame = rect;
}

- (CGFloat)qh_height {
    
    return CGRectGetHeight(self.frame);
}

- (void)setQh_left:(CGFloat)qh_left {
    
    CGRect rect = self.frame;
    rect.origin.x = qh_left;
    self.frame = rect;
}

- (CGFloat)qh_left {
    
    return CGRectGetMinX(self.frame);
}

- (void)setQh_right:(CGFloat)qh_right {
    
    CGRect rect = self.frame;
    rect.size.width = qh_right - rect.origin.x;
    self.frame = rect;
}

- (CGFloat)qh_right {
    
    return CGRectGetMaxX(self.frame);
}

- (void)setQh_top:(CGFloat)qh_top {
    
    CGRect rect = self.frame;
    rect.origin.y = qh_top;
    self.frame = rect;
}

- (CGFloat)qh_top {
    
    return CGRectGetMinY(self.frame);
}

- (void)setQh_bottom:(CGFloat)qh_bottom {
    
    CGRect rect = self.frame;
    rect.size.height = qh_bottom - rect.origin.y;
    self.frame = rect;
}

- (CGFloat)qh_bottom {
    
    return CGRectGetMaxY(self.frame);
}

- (void)setQh_alignLeft:(CGFloat)qh_alignLeft {
    
    [self setQh_left:qh_alignLeft];
}

- (CGFloat)qh_alignLeft {
    
    return [self qh_left];
}

- (void)setQh_alignRight:(CGFloat)qh_alignRight {
    
    CGRect rect = self.frame;
    rect.origin.x = qh_alignRight - rect.size.width;
    self.frame = rect;
}

- (CGFloat)qh_alignRight {
    
    return [self qh_right];
}

- (void)setQh_alignTop:(CGFloat)qh_alignTop {
    
    [self setQh_top:qh_alignTop];
}

- (CGFloat)qh_alignTop {
    
    return [self qh_top];
}

- (void)setQh_alignBottom:(CGFloat)qh_alignBottom {
    
    CGRect rect = self.frame;
    rect.origin.y = qh_alignBottom - rect.size.height;
    self.frame = rect;
}

- (CGFloat)qh_alignBottom {
    
    return [self qh_bottom];
}

- (void)setQh_centerX:(CGFloat)qh_centerX {
    
    self.center = CGPointMake(qh_centerX, self.center.y);
}

- (CGFloat)qh_centerX {
    
    return self.center.x;
}

- (void)setQh_centerY:(CGFloat)qh_centerY {
    
    self.center = CGPointMake(self.center.x, qh_centerY);
}

- (CGFloat)qh_centerY {
    
    return self.center.y;
}

- (void)setQh_originPoint:(CGPoint)qh_originPoint {
    
    CGRect rect = self.frame;
    rect.origin = qh_originPoint;
    self.frame = rect;
}

- (CGPoint)qh_originPoint {
    
    return self.frame.origin;
}

- (void)setQh_size:(CGSize)qh_size {
    
    CGRect rect = self.frame;
    rect.size = qh_size;
    self.frame = rect;
}

- (CGSize)qh_size {
    
    return self.frame.size;
}

- (void)setQh_resizeCenter:(CGSize)qh_resizeCenter {
    
    CGPoint center = self.center;
    
    CGRect rect = self.frame;
    rect.size = qh_resizeCenter;
    self.frame = rect;
    
    self.center = center;
}

- (CGSize)qh_resizeCenter {
    
    return self.qh_size;
}

- (void)setQh_resizeTop:(CGSize)qh_resizeTop {
    
    CGFloat x = self.qh_x + 0.5 * (self.qh_width - qh_resizeTop.width);
    CGFloat y = self.qh_y;
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = qh_resizeTop;
    self.frame = rect;
    
    self.qh_originPoint = origin;
}

- (CGSize)qh_resizeTop {
    
    return self.qh_size;
}

- (void)setQh_resizeBottom:(CGSize)qh_resizeBottom {
    
    CGFloat x = self.qh_x + 0.5 * (self.qh_width - qh_resizeBottom.width);
    CGFloat y = self.qh_y + (self.qh_height - qh_resizeBottom.height);
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = qh_resizeBottom;
    self.frame = rect;
    
    self.qh_originPoint = origin;
}

- (CGSize)qh_resizeBottom {
    
    return self.qh_size;
}

- (void)setQh_resizeLeft:(CGSize)qh_resizeLeft {
    
    CGFloat x = self.qh_x;
    CGFloat y = self.qh_y + 0.5 * (self.qh_height - qh_resizeLeft.height);
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = qh_resizeLeft;
    self.frame = rect;
    
    self.qh_originPoint = origin;
}

- (CGSize)qh_resizeLeft {
    
    return self.qh_size;
}

- (void)setQh_resizeRight:(CGSize)qh_resizeRight {
    
    CGFloat x = self.qh_x + (self.qh_width - qh_resizeRight.width);
    CGFloat y = self.qh_y + 0.5 * (self.qh_height - qh_resizeRight.height);
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = qh_resizeRight;
    self.frame = rect;
    
    self.qh_originPoint = origin;
}

- (CGSize)qh_resizeRight {
    
    return self.qh_size;
}

- (void)setQh_resizeTopLeft:(CGSize)qh_resizeTopLeft {
    
    CGPoint origin = self.frame.origin;
    
    CGRect rect = self.frame;
    rect.size = qh_resizeTopLeft;
    self.frame = rect;
    
    self.qh_originPoint = origin;
}

- (CGSize)qh_resizeTopLeft {
    
    return self.qh_size;
}

- (void)setQh_resizeTopRight:(CGSize)qh_resizeTopRight {
    
    CGFloat x = self.qh_x + (self.qh_width - qh_resizeTopRight.width);
    CGFloat y = self.qh_y;
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = qh_resizeTopRight;
    self.frame = rect;
    
    self.qh_originPoint = origin;
}

- (CGSize)qh_resizeTopRight {
    
    return self.qh_size;
}

- (void)setQh_resizeBottomLeft:(CGSize)qh_resizeBottomLeft {
    
    CGFloat x = self.qh_x;
    CGFloat y = self.qh_y + (self.qh_height - qh_resizeBottomLeft.height);
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = qh_resizeBottomLeft;
    self.frame = rect;
    
    self.qh_originPoint = origin;
}

- (CGSize)qh_resizeBottomLeft {
    
    return self.qh_size;
}

- (void)setQh_resizeBottomRight:(CGSize)qh_resizeBottomRight {
    
    CGFloat x = self.qh_x + (self.qh_width - qh_resizeBottomRight.width);
    CGFloat y = self.qh_y + (self.qh_height - qh_resizeBottomRight.height);
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = qh_resizeBottomRight;
    self.frame = rect;
    
    self.qh_originPoint = origin;
}

- (CGSize)qh_resizeBottomRight {
    
    return self.qh_size;
}

- (CGFloat)qh_contentAreaWidth {
    
    return [self qh_safeAreaWidth];
}

- (CGFloat)qh_contentAreaHeight {
    
    return [self qh_safeAreaHeight] - [self qh_navigationBarHeight] - [self qh_tabBarHeight];
}

- (CGFloat)qh_safeAreaWidth {
    
    if (@available(iOS 11.0, *)) {
        
        return CGRectGetWidth(UIApplication.sharedApplication.delegate.window.safeAreaLayoutGuide.layoutFrame);
    }
    
    return CGRectGetWidth(UIApplication.sharedApplication.delegate.window.bounds);
}

- (CGFloat)qh_safeAreaHeight {
    
    if (@available(iOS 11.0, *)) {
        
        return CGRectGetHeight(UIApplication.sharedApplication.delegate.window.safeAreaLayoutGuide.layoutFrame);
    }
    
    return CGRectGetHeight(UIApplication.sharedApplication.delegate.window.bounds);
}

- (CGFloat)qh_statusBarHeight {
    
    if (@available(iOS 13, *)) {
        
        return CGRectGetHeight(UIApplication.sharedApplication.keyWindow.windowScene.statusBarManager.statusBarFrame);
    } else {
        
        return CGRectGetHeight(UIApplication.sharedApplication.statusBarFrame);
    }
}

- (CGFloat)qh_navigationBarHeight {
    
    return 44.0f;
}

- (CGFloat)qh_tabBarHeight {
    
    return 49.0f;
}

- (CGFloat)qh_homeIndicatorHeight {
    
    if (@available(iOS 11.0, *)) {
        
        return UIApplication.sharedApplication.delegate.window.safeAreaInsets.bottom;
    }
    
    return 0.0f;
}

/**
 视图切圆角
 
 @param radius 圆角半径
 @param corners 圆角位置
 */
- (void)qh_cornerWithRaius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

#pragma mark - 视图继承关系
/**
 移除所有子视图
 */
- (void)qh_removeAllSubviews {
    
    while (self.subviews.count) {
        
        [self.subviews.lastObject removeFromSuperview];
    }
}

/**
 查询子视图(子视图的子视图)
 
 @param className 子视图类名字符串
 @return 子视图
 */
- (UIView *)qh_subViewOfClassName:(NSString *)className {
    
    for (UIView *subView in self.subviews) {
        
        if ([NSStringFromClass(subView.class) isEqualToString:className]) {
            
            return subView;
        }
        
        // 子视图的子视图
        UIView *result = [subView qh_subViewOfClassName:className];
        if (result) {
            
            return result;
        }
    }
    
    return nil;
}

/**
 查询子视图(子视图的子视图)
 
 @param classType 子视图类型
 @return 子视图
 */
- (UIView *)qh_subViewOfClassType:(Class)classType {
    
    for (UIView *subView in self.subviews) {
        
        if ([subView isKindOfClass:classType]) {
            
            if ([subView isKindOfClass: [UIScrollView class]]) {
                
                NSString *classNameString = NSStringFromClass(subView.class);
                
                if ([subView.superview isKindOfClass:[UITableView class]] == NO && [subView.superview isKindOfClass:[UITableViewCell class]] == NO && [classNameString hasPrefix:@"_"] == NO) {
                    
                    return subView;
                }
            } else {
                
                return subView;
            }
        }
        
        // 子视图的子视图
        UIView *result = [subView qh_subViewOfClassType:classType];
        if (result) {
            
            return result;
        }
    }
    
    return nil;
}

/**
 查询父视图
 
 @param classType 父视图类型
 @return 父视图
 */
- (UIView *)qh_superviewOfClassType:(Class)classType {
    
    UIView *superview = self.superview;
    
    while (superview) {
        
        if ([superview isKindOfClass:classType]) {
            
            if ([superview isKindOfClass: [UIScrollView class]]) {
                
                NSString *classNameString = NSStringFromClass([superview class]);
                
                if ([superview.superview isKindOfClass:[UITableView class]] == NO && [superview.superview isKindOfClass:[UITableViewCell class]] == NO && [classNameString hasPrefix:@"_"] == NO) {
                    
                    return superview;
                }
            } else {
                
                return superview;
            }
        }
        
        return superview = superview.superview;
    }
    
    return nil;
}

@end


#pragma mark - 视图控制器
@implementation UIView (GQHController)

/**
 视图的视图控制器
 
 @return 视图控制器
 */
- (UIViewController *)qh_currentViewController {
    
    UIResponder *next = [self nextResponder];
    
    do {
        
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
        }
        
        next = [next nextResponder];
    } while (next != nil);
    
    return nil;
}

/**
 视图导航控制器
 
 @return 视图导航控制器
 */
- (UINavigationController *)qh_navigationController {
    
    return [self qh_currentViewController].navigationController;
}

@end
