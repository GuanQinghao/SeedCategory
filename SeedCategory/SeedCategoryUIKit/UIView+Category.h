//
//  UIView+Category.h
//  Expecta
//
//  Created by GuanQinghao on 2020/9/20.
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

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Category)

#pragma mark - frame

/// 视图位置坐标x值
@property (nonatomic, assign) CGFloat qh_x;
/// 视图位置坐标y值
@property (nonatomic, assign) CGFloat qh_y;
/// 视图尺寸宽度值
@property (nonatomic, assign) CGFloat qh_width;
/// 视图尺寸高度值
@property (nonatomic, assign) CGFloat qh_height;

/// 视图位置左侧值
@property (nonatomic, assign) CGFloat qh_left;
/// 视图位置右侧值
@property (nonatomic, assign) CGFloat qh_right;
/// 视图位置顶部值
@property (nonatomic, assign) CGFloat qh_top;
/// 视图位置底部值
@property (nonatomic, assign) CGFloat qh_bottom;

/// 视图(大小不变)向左对齐(移动)值
@property (nonatomic, assign) CGFloat qh_alignLeft;
/// 视图(大小不变)向右对齐(移动)值
@property (nonatomic, assign) CGFloat qh_alignRight;
/// 视图(大小不变)向上对齐(移动)值
@property (nonatomic, assign) CGFloat qh_alignTop;
/// 视图(大小不变)向下对齐(移动)值
@property (nonatomic, assign) CGFloat qh_alignBottom;

/// 视图中心点位置坐标x值
@property (nonatomic, assign) CGFloat qh_centerX;
/// 视图中心点位置坐标y值
@property (nonatomic, assign) CGFloat qh_centerY;
/// 视图起始位置点
@property (nonatomic, assign) CGPoint qh_originPoint;
/// 视图尺寸大小
@property (nonatomic, assign) CGSize qh_size;
/// 改变视图尺寸大小(以中心点为基准) (视图尺寸放大或缩小)
@property (nonatomic, assign) CGSize qh_resizeCenter;
/// 改变视图尺寸大小并向上居中
@property (nonatomic, assign) CGSize qh_resizeTop;
/// 改变视图尺寸大小并向下居中
@property (nonatomic, assign) CGSize qh_resizeBottom;
/// 改变视图尺寸大小并向左居中
@property (nonatomic, assign) CGSize qh_resizeLeft;
/// 改变视图尺寸大小并向右居中
@property (nonatomic, assign) CGSize qh_resizeRight;
/// 改变视图尺寸大小并向上居左
@property (nonatomic, assign) CGSize qh_resizeTopLeft;
/// 改变视图尺寸大小并向上居右
@property (nonatomic, assign) CGSize qh_resizeTopRight;
/// 改变视图尺寸大小并向下居左
@property (nonatomic, assign) CGSize qh_resizeBottomLeft;
/// 改变视图尺寸大小并向下居右
@property (nonatomic, assign) CGSize qh_resizeBottomRight;

/// 安全区宽度
@property (nonatomic, assign, readonly) CGFloat qh_safeAreaWidth;
/// 安全区高度
@property (nonatomic, assign, readonly) CGFloat qh_safeAreaHeight;

/// 内容区宽度
@property (nonatomic, assign, readonly) CGFloat qh_contentAreaWidth;
/// 内容区高度
@property (nonatomic, assign, readonly) CGFloat qh_contentAreaHeight;

/// 状态条高度
@property (nonatomic, assign, readonly) CGFloat qh_statusBarHeight;
/// 导航条高度
@property (nonatomic, assign, readonly) CGFloat qh_navigationBarHeight;
/// 底部导航条高度
@property (nonatomic, assign, readonly) CGFloat qh_tabBarHeight;
/// 底部操作区高度
@property (nonatomic, assign, readonly) CGFloat qh_homeIndicatorHeight;

#pragma mark - animation

/// 弹性振动动画
/// @param layer 动画层
/// @param type 动画类型
+ (void)qh_animateShakedWithLayer:(CALayer *)layer type:(GQHAnimationShakedType)type;

/// 弹性缩放动画
/// @param layer 动画层
/// @param type 动画类型
+ (void)qh_animateScaledWithLayer:(CALayer *)layer type:(GQHAnimationScaledType)type;

#pragma mark - inheritance

/// 移除所有子视图
- (void)qh_removeAllSubviews;

/// 查询子视图(子视图的子视图)
/// @param className 子视图类名字符串
- (NSArray<__kindof UIView *> *)qh_subviewsOfClassName:(NSString *)className;

/// 查询子视图(子视图的子视图)
/// @param classType 子视图类型
- (NSArray<__kindof UIView *> *)qh_subviewsOfClassType:(Class)classType;

/// 查询父视图
/// @param classType 父视图类型
- (nullable UIView *)qh_superviewOfClassType:(Class)classType;

#pragma mark - controller

/// 视图的视图控制器
- (nullable UIViewController *)qh_currentViewController;

/// 视图导航控制器
- (nullable UINavigationController *)qh_navigationController;

#pragma mark - badge


#pragma mark - other

/// 绘制虚线, 建议在layout后调用
/// @param dashLines 虚线所有的拐点
/// @param width 虚线的宽度
/// @param color 虚线的颜色
/// @param lengths 虚线的样式
- (void)qh_dashLines:(NSArray<NSValue *> *)dashLines width:(CGFloat)width color:(UIColor *)color lengths:(NSArray<NSNumber *> *)lengths;

/// 视图切圆角
/// @param radius 圆角半径
/// @param corners 圆角位置
- (void)qh_cornerWithRaius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners;

@end

NS_ASSUME_NONNULL_END
