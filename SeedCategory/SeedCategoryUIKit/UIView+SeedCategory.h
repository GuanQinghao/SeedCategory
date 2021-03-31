//
//  UIView+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, SeedAnimationShakedType) {
    
    /// 上下振动
    SeedAnimationShakedTypeVertical,
    /// 左右振动
    SeedAnimationShakedTypeHorizontal
};


typedef NS_ENUM(NSUInteger, SeedAnimationScaledType) {
    
    /// 先放大后缩小弹性变化
    SeedAnimationScaledTypeInOut,
    /// 先缩小后放大弹性缩放
    SeedAnimationScaledTypeOutIn
};


NS_ASSUME_NONNULL_BEGIN

@interface UIView (SeedCategory)

#pragma mark - frame

/// 视图位置坐标x值
@property (nonatomic, assign) CGFloat s_x;
/// 视图位置坐标y值
@property (nonatomic, assign) CGFloat s_y;
/// 视图尺寸宽度值
@property (nonatomic, assign) CGFloat s_width;
/// 视图尺寸高度值
@property (nonatomic, assign) CGFloat s_height;

/// 视图位置左侧值
@property (nonatomic, assign) CGFloat s_left;
/// 视图位置右侧值
@property (nonatomic, assign) CGFloat s_right;
/// 视图位置顶部值
@property (nonatomic, assign) CGFloat s_top;
/// 视图位置底部值
@property (nonatomic, assign) CGFloat s_bottom;

/// 视图(大小不变)向左对齐(移动)值
@property (nonatomic, assign) CGFloat s_alignLeft;
/// 视图(大小不变)向右对齐(移动)值
@property (nonatomic, assign) CGFloat s_alignRight;
/// 视图(大小不变)向上对齐(移动)值
@property (nonatomic, assign) CGFloat s_alignTop;
/// 视图(大小不变)向下对齐(移动)值
@property (nonatomic, assign) CGFloat s_alignBottom;

/// 视图中心点位置坐标x值
@property (nonatomic, assign) CGFloat s_centerX;
/// 视图中心点位置坐标y值
@property (nonatomic, assign) CGFloat s_centerY;
/// 视图起始位置点
@property (nonatomic, assign) CGPoint s_originPoint;
/// 视图尺寸大小
@property (nonatomic, assign) CGSize s_size;
/// 改变视图尺寸大小(以中心点为基准) (视图尺寸放大或缩小)
@property (nonatomic, assign) CGSize s_resizeCenter;
/// 改变视图尺寸大小并向上居中
@property (nonatomic, assign) CGSize s_resizeTop;
/// 改变视图尺寸大小并向下居中
@property (nonatomic, assign) CGSize s_resizeBottom;
/// 改变视图尺寸大小并向左居中
@property (nonatomic, assign) CGSize s_resizeLeft;
/// 改变视图尺寸大小并向右居中
@property (nonatomic, assign) CGSize s_resizeRight;
/// 改变视图尺寸大小并向上居左
@property (nonatomic, assign) CGSize s_resizeTopLeft;
/// 改变视图尺寸大小并向上居右
@property (nonatomic, assign) CGSize s_resizeTopRight;
/// 改变视图尺寸大小并向下居左
@property (nonatomic, assign) CGSize s_resizeBottomLeft;
/// 改变视图尺寸大小并向下居右
@property (nonatomic, assign) CGSize s_resizeBottomRight;

/// 安全区宽度
@property (nonatomic, assign, readonly) CGFloat s_safeAreaWidth;
/// 安全区高度
@property (nonatomic, assign, readonly) CGFloat s_safeAreaHeight;

/// 内容区宽度
@property (nonatomic, assign, readonly) CGFloat s_contentAreaWidth;
/// 内容区高度
@property (nonatomic, assign, readonly) CGFloat s_contentAreaHeight;

/// 状态条高度
@property (nonatomic, assign, readonly) CGFloat s_statusBarHeight;
/// 导航条高度
@property (nonatomic, assign, readonly) CGFloat s_navigationBarHeight;
/// 底部导航条高度
@property (nonatomic, assign, readonly) CGFloat s_tabBarHeight;
/// 底部操作区高度
@property (nonatomic, assign, readonly) CGFloat s_homeIndicatorHeight;

#pragma mark - inheritance

/// 移除所有子视图
- (void)s_removeAllSubviews;

/// 查询子视图(子视图的子视图)
/// @param className 子视图类名字符串
- (NSArray<__kindof UIView *> *)s_subviewsWithClassName:(NSString *)className;

/// 查询子视图(子视图的子视图)
/// @param classType 子视图类型
- (NSArray<__kindof UIView *> *)s_subviewsWithClassType:(Class)classType;

/// 查询父视图
/// @param classType 父视图类型
- (nullable UIView *)s_superviewOfClassType:(Class)classType;

#pragma mark - controller

/// 视图的视图控制器
- (nullable UIViewController *)s_currentViewController;

/// 视图导航控制器
- (nullable UINavigationController *)s_navigationController;

#pragma mark - other

/// 绘制虚线, 建议在layout后调用
/// @param dashLines 虚线所有的拐点
/// @param width 虚线的宽度
/// @param color 虚线的颜色
/// @param lengths 虚线的样式
- (void)s_dashLines:(NSArray<NSValue *> *)dashLines width:(CGFloat)width color:(UIColor *)color lengths:(NSArray<NSNumber *> *)lengths;

/// 视图切圆角
/// @param radius 圆角半径
/// @param corners 圆角位置
- (void)s_cornerWithRaius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners;

#pragma mark - animation

/// 弹性振动动画
/// @param layer 动画层
/// @param type 动画类型
+ (void)s_animateShakedWithLayer:(CALayer *)layer type:(SeedAnimationShakedType)type;

/// 弹性缩放动画
/// @param layer 动画层
/// @param type 动画类型
+ (void)s_animateScaledWithLayer:(CALayer *)layer type:(SeedAnimationScaledType)type;

@end

NS_ASSUME_NONNULL_END
