//
//  UIView+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "UIView+SeedCategory.h"


@implementation UIView (SeedCategory)

#pragma mark - frame

- (void)setS_x:(CGFloat)s_x {
    
    CGRect rect = self.frame;
    rect.origin.x = s_x;
    self.frame = rect;
}

- (CGFloat)s_x {
    
    return CGRectGetMinX(self.frame);
}

- (void)setS_y:(CGFloat)s_y {
    
    CGRect rect = self.frame;
    rect.origin.y = s_y;
    self.frame = rect;
}

- (CGFloat)s_y {
    
    return CGRectGetMinY(self.frame);
}

- (void)setS_width:(CGFloat)s_width {
    
    CGRect rect = self.frame;
    rect.size.width = s_width;
    self.frame = rect;
}

- (CGFloat)s_width {
    
    return CGRectGetWidth(self.frame);
}

- (void)setS_height:(CGFloat)s_height {
    
    CGRect rect = self.frame;
    rect.size.height = s_height;
    self.frame = rect;
}

- (CGFloat)s_height {
    
    return CGRectGetHeight(self.frame);
}

- (void)setS_left:(CGFloat)s_left {
    
    CGRect rect = self.frame;
    rect.origin.x = s_left;
    self.frame = rect;
}

- (CGFloat)s_left {
    
    return CGRectGetMinX(self.frame);
}

- (void)setS_right:(CGFloat)s_right {
    
    CGRect rect = self.frame;
    rect.size.width = s_right - rect.origin.x;
    self.frame = rect;
}

- (CGFloat)s_right {
    
    return CGRectGetMaxX(self.frame);
}

- (void)setS_top:(CGFloat)s_top {
    
    CGRect rect = self.frame;
    rect.origin.y = s_top;
    self.frame = rect;
}

- (CGFloat)s_top {
    
    return CGRectGetMinY(self.frame);
}

- (void)setS_bottom:(CGFloat)s_bottom {
    
    CGRect rect = self.frame;
    rect.size.height = s_bottom - rect.origin.y;
    self.frame = rect;
}

- (CGFloat)s_bottom {
    
    return CGRectGetMaxY(self.frame);
}

- (void)setS_alignLeft:(CGFloat)s_alignLeft {
    
    [self setS_left:s_alignLeft];
}

- (CGFloat)s_alignLeft {
    
    return [self s_left];
}

- (void)setS_alignRight:(CGFloat)s_alignRight {
    
    CGRect rect = self.frame;
    rect.origin.x = s_alignRight - rect.size.width;
    self.frame = rect;
}

- (CGFloat)s_alignRight {
    
    return [self s_right];
}

- (void)setS_alignTop:(CGFloat)s_alignTop {
    
    [self setS_top:s_alignTop];
}

- (CGFloat)s_alignTop {
    
    return [self s_top];
}

- (void)setS_alignBottom:(CGFloat)s_alignBottom {
    
    CGRect rect = self.frame;
    rect.origin.y = s_alignBottom - rect.size.height;
    self.frame = rect;
}

- (CGFloat)s_alignBottom {
    
    return [self s_bottom];
}

- (void)setS_centerX:(CGFloat)s_centerX {
    
    self.center = CGPointMake(s_centerX, self.center.y);
}

- (CGFloat)s_centerX {
    
    return self.center.x;
}

- (void)setS_centerY:(CGFloat)s_centerY {
    
    self.center = CGPointMake(self.center.x, s_centerY);
}

- (CGFloat)s_centerY {
    
    return self.center.y;
}

- (void)setS_originPoint:(CGPoint)s_originPoint {
    
    CGRect rect = self.frame;
    rect.origin = s_originPoint;
    self.frame = rect;
}

- (CGPoint)s_originPoint {
    
    return self.frame.origin;
}

- (void)setS_size:(CGSize)s_size {
    
    CGRect rect = self.frame;
    rect.size = s_size;
    self.frame = rect;
}

- (CGSize)s_size {
    
    return self.frame.size;
}

- (void)setS_resizeCenter:(CGSize)s_resizeCenter {
    
    CGPoint center = self.center;
    
    CGRect rect = self.frame;
    rect.size = s_resizeCenter;
    self.frame = rect;
    
    self.center = center;
}

- (CGSize)s_resizeCenter {
    
    return self.s_size;
}

- (void)setS_resizeTop:(CGSize)s_resizeTop {
    
    CGFloat x = self.s_x + 0.5 * (self.s_width - s_resizeTop.width);
    CGFloat y = self.s_y;
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = s_resizeTop;
    self.frame = rect;
    
    self.s_originPoint = origin;
}

- (CGSize)s_resizeTop {
    
    return self.s_size;
}

- (void)setS_resizeBottom:(CGSize)s_resizeBottom {
    
    CGFloat x = self.s_x + 0.5 * (self.s_width - s_resizeBottom.width);
    CGFloat y = self.s_y + (self.s_height - s_resizeBottom.height);
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = s_resizeBottom;
    self.frame = rect;
    
    self.s_originPoint = origin;
}

- (CGSize)s_resizeBottom {
    
    return self.s_size;
}

- (void)setS_resizeLeft:(CGSize)s_resizeLeft {
    
    CGFloat x = self.s_x;
    CGFloat y = self.s_y + 0.5 * (self.s_height - s_resizeLeft.height);
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = s_resizeLeft;
    self.frame = rect;
    
    self.s_originPoint = origin;
}

- (CGSize)s_resizeLeft {
    
    return self.s_size;
}

- (void)setS_resizeRight:(CGSize)s_resizeRight {
    
    CGFloat x = self.s_x + (self.s_width - s_resizeRight.width);
    CGFloat y = self.s_y + 0.5 * (self.s_height - s_resizeRight.height);
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = s_resizeRight;
    self.frame = rect;
    
    self.s_originPoint = origin;
}

- (CGSize)s_resizeRight {
    
    return self.s_size;
}

- (void)setS_resizeTopLeft:(CGSize)s_resizeTopLeft {
    
    CGPoint origin = self.frame.origin;
    
    CGRect rect = self.frame;
    rect.size = s_resizeTopLeft;
    self.frame = rect;
    
    self.s_originPoint = origin;
}

- (CGSize)s_resizeTopLeft {
    
    return self.s_size;
}

- (void)setS_resizeTopRight:(CGSize)s_resizeTopRight {
    
    CGFloat x = self.s_x + (self.s_width - s_resizeTopRight.width);
    CGFloat y = self.s_y;
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = s_resizeTopRight;
    self.frame = rect;
    
    self.s_originPoint = origin;
}

- (CGSize)s_resizeTopRight {
    
    return self.s_size;
}

- (void)setS_resizeBottomLeft:(CGSize)s_resizeBottomLeft {
    
    CGFloat x = self.s_x;
    CGFloat y = self.s_y + (self.s_height - s_resizeBottomLeft.height);
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = s_resizeBottomLeft;
    self.frame = rect;
    
    self.s_originPoint = origin;
}

- (CGSize)s_resizeBottomLeft {
    
    return self.s_size;
}

- (void)setS_resizeBottomRight:(CGSize)s_resizeBottomRight {
    
    CGFloat x = self.s_x + (self.s_width - s_resizeBottomRight.width);
    CGFloat y = self.s_y + (self.s_height - s_resizeBottomRight.height);
    CGPoint origin = CGPointMake(x, y);
    
    CGRect rect = self.frame;
    rect.size = s_resizeBottomRight;
    self.frame = rect;
    
    self.s_originPoint = origin;
}

- (CGSize)s_resizeBottomRight {
    
    return self.s_size;
}

- (CGFloat)s_contentAreaWidth {
    
    return [self s_safeAreaWidth];
}

- (CGFloat)s_contentAreaHeight {
    
    return [self s_safeAreaHeight] - [self s_navigationBarHeight] - [self s_tabBarHeight];
}

- (CGFloat)s_safeAreaWidth {
    
    return CGRectGetWidth(UIApplication.sharedApplication.windows.firstObject.safeAreaLayoutGuide.layoutFrame);
}

- (CGFloat)s_safeAreaHeight {
    
    return CGRectGetHeight(UIApplication.sharedApplication.windows.firstObject.safeAreaLayoutGuide.layoutFrame);
}

- (CGFloat)s_statusBarHeight {
    
    if (@available(iOS 13, *)) {
        
        return CGRectGetHeight(UIApplication.sharedApplication.windows.firstObject.windowScene.statusBarManager.statusBarFrame);
    } else {
        
        return CGRectGetHeight(UIApplication.sharedApplication.statusBarFrame);
    }
}

- (CGFloat)s_navigationBarHeight {
    
    return 44.0f;
}

- (CGFloat)s_tabBarHeight {
    
    return 49.0f;
}

- (CGFloat)s_homeIndicatorHeight {
    
    return UIApplication.sharedApplication.windows.firstObject.safeAreaInsets.bottom;
}

#pragma mark - inheritance

/// 移除所有子视图
- (void)s_removeAllSubviews {
    
    while (self.subviews.count) {
        
        [self.subviews.lastObject removeFromSuperview];
    }
}

/// 查询子视图(子视图的子视图)
/// @param className 子视图类名字符串
- (NSArray<__kindof UIView *> *)s_subviewsOfClassName:(NSString *)className {
    
    NSMutableArray *subviewArray = [NSMutableArray array];
    
    for (UIView *subview in self.subviews) {
        
        if ([NSStringFromClass(subview.class) isEqualToString:className]) {
            
            [subviewArray addObject:subview];
        }
        
        // 子视图的子视图
        [subviewArray addObjectsFromArray:[subview s_subviewsOfClassName:className]];
    }
    
    return [subviewArray copy];
}

/// 查询子视图(子视图的子视图)
/// @param classType 子视图类型
- (NSArray<__kindof UIView *> *)s_subviewsOfClassType:(Class)classType {
    
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
        [subviewArray addObjectsFromArray:[subview s_subviewsOfClassType:classType]];
    }
    
    return [subviewArray copy];
}

/// 查询父视图
/// @param classType 父视图类型
- (UIView *)s_superviewOfClassType:(Class)classType {
    
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

#pragma mark - controller

/// 视图的视图控制器
- (UIViewController *)s_currentViewController {
    
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
- (UINavigationController *)s_navigationController {
    
    return [self s_currentViewController].navigationController;
}

#pragma mark - other

/// 绘制虚线, 建议在layout后调用
/// @param dashLines 虚线所有的拐点
/// @param width 虚线的宽度
/// @param color 虚线的颜色
/// @param lengths 虚线的样式
- (void)s_dashLines:(NSArray<NSValue *> *)dashLines width:(CGFloat)width color:(UIColor *)color lengths:(NSArray<NSNumber *> *)lengths {
    
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
- (void)s_cornerWithRaius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

#pragma mark - animation

/// 弹性振动动画
/// @param layer 动画层
/// @param type 动画类型
+ (void)s_animateShakedWithLayer:(CALayer *)layer type:(SeedAnimationShakedType)type {
    
    CGPoint position = [layer position];
    CGPoint start = CGPointMake(position.x, position.y);
    CGPoint end = CGPointMake(position.x, position.y);
    
    if (type == SeedAnimationShakedTypeHorizontal) {
        
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
+ (void)s_animateScaledWithLayer:(CALayer *)layer type:(SeedAnimationScaledType)type {
    
    NSNumber *scaleInOut = (type == SeedAnimationScaledTypeInOut) ? @(1.20f) : @(0.80f);
    NSNumber *scaleOutIn = (type == SeedAnimationScaledTypeInOut) ? @(0.80f) : @(1.20f);
    
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

@end
