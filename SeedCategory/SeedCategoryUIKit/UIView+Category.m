//
//  UIView+Category.m
//  Expecta
//
//  Created by GuanQinghao on 2020/9/20.
//

#import "UIView+Category.h"

@implementation UIView (Category)

#pragma mark - frame

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

#pragma mark - animation

/// 弹性振动动画
/// @param layer 动画层
/// @param type 动画类型
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

/// 弹性缩放动画
/// @param layer 动画层
/// @param type 动画类型
+ (void)qh_animateScaledWithLayer:(CALayer *)layer type:(GQHAnimationScaledType)type {
    
    NSNumber *scaleInOut = (type == GQHAnimationScaledTypeInOut) ? @(1.20f) : @(0.80f);
    NSNumber *scaleOutIn = (type == GQHAnimationScaledTypeInOut) ? @(0.80f) : @(1.20f);
    
    [UIView animateWithDuration:0.15f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [layer setValue:scaleInOut forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.15f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [layer setValue:scaleOutIn forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.1f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                
                [layer setValue:@(1.0f) forKeyPath:@"transform.scale"];
            } completion:nil];
        }];
    }];
}

#pragma mark - inheritance

/// 移除所有子视图
- (void)qh_removeAllSubviews {
    
    while (self.subviews.count) {
        
        [self.subviews.lastObject removeFromSuperview];
    }
}

/// 查询子视图(子视图的子视图)
/// @param className 子视图类名字符串
- (NSArray<__kindof UIView *> *)qh_subviewsOfClassName:(NSString *)className {
    
    NSMutableArray *subviewArray = [NSMutableArray array];
    
    for (UIView *subview in self.subviews) {
        
        if ([NSStringFromClass(subview.class) isEqualToString:className]) {
            
            [subviewArray addObject:subview];
        }
        
        // 子视图的子视图
        [subviewArray addObjectsFromArray:[subview qh_subviewsOfClassName:className]];
    }
    
    return [subviewArray copy];
}

/// 查询子视图(子视图的子视图)
/// @param classType 子视图类型
- (NSArray<__kindof UIView *> *)qh_subviewsOfClassType:(Class)classType {
    
    NSMutableArray *subviewArray = [NSMutableArray array];
    
    for (UIView *subview in self.subviews) {
        
        if ([subview isKindOfClass:classType]) {
            
            if ([subview isKindOfClass: [UIScrollView class]]) {
                
                NSString *classNameString = NSStringFromClass(subview.class);
                
                if ([subview.superview isKindOfClass:[UITableView class]] == NO && [subview.superview isKindOfClass:[UITableViewCell class]] == NO && [classNameString hasPrefix:@"_"] == NO) {
                    
                    [subviewArray addObject:subview];
                }
            } else {
                
                [subviewArray addObject:subview];
            }
        }
        
        // 子视图的子视图
        [subviewArray addObjectsFromArray:[subview qh_subviewsOfClassType:classType]];
    }
    
    return [subviewArray copy];
}

/// 查询父视图
/// @param classType 父视图类型
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

#pragma mark - inheritance

/// 视图的视图控制器
- (UIViewController *)qh_currentViewController {
    
    UIResponder *next = [self nextResponder];
    
    do {
        
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
        }
        
        next = [next nextResponder];
    } while (next);
    
    return nil;
}

/// 视图导航控制器
- (UINavigationController *)qh_navigationController {
    
    return [self qh_currentViewController].navigationController;
}

#pragma mark - badge


#pragma mark - other

/// 绘制虚线, 建议在layout后调用
/// @param dashLines 虚线所有的拐点
/// @param width 虚线的宽度
/// @param color 虚线的颜色
/// @param lengths 虚线的样式
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

/// 视图切圆角
/// @param radius 圆角半径
/// @param corners 圆角位置
- (void)qh_cornerWithRaius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

@end
