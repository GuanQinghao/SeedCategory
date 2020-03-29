//
//  UIView+GQHFrame.h
//  Seed
//
//  Created by GuanQinghao on 12/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


/// 全局常量-视图单倍外边距
UIKIT_EXTERN CGFloat const GQHFrameSingleMargin;
/// 全局常量-视图双倍外边距
UIKIT_EXTERN CGFloat const GQHFrameDoubleMargin;


@interface UIView (GQHFrame)

/**
 视图位置坐标x值
 */
@property (nonatomic, assign) CGFloat qh_x;
/**
 视图位置坐标y值
 */
@property (nonatomic, assign) CGFloat qh_y;
/**
 视图尺寸宽度值
 */
@property (nonatomic, assign) CGFloat qh_width;
/**
 视图尺寸高度值
 */
@property (nonatomic, assign) CGFloat qh_height;

/**
 视图位置左侧值
 */
@property (nonatomic, assign) CGFloat qh_left;
/**
 视图位置右侧值
 */
@property (nonatomic, assign) CGFloat qh_right;
/**
 视图位置顶部值
 */
@property (nonatomic, assign) CGFloat qh_top;
/**
 视图位置底部值
 */
@property (nonatomic, assign) CGFloat qh_bottom;

/**
 视图(大小不变)向左对齐(移动)值
 */
@property (nonatomic, assign) CGFloat qh_alignLeft;
/**
 视图(大小不变)向右对齐(移动)值
 */
@property (nonatomic, assign) CGFloat qh_alignRight;
/**
 视图(大小不变)向上对齐(移动)值
 */
@property (nonatomic, assign) CGFloat qh_alignTop;
/**
 视图(大小不变)向下对齐(移动)值
 */
@property (nonatomic, assign) CGFloat qh_alignBottom;

/**
 视图中心点位置坐标x值
 */
@property (nonatomic, assign) CGFloat qh_centerX;
/**
 视图中心点位置坐标y值
 */
@property (nonatomic, assign) CGFloat qh_centerY;

/**
 视图起始位置点
 */
@property (nonatomic, assign) CGPoint qh_originPoint;

/**
 视图尺寸大小
 */
@property (nonatomic, assign) CGSize qh_size;
/**
 改变视图尺寸大小(以中心点为基准) (视图尺寸放大或缩小)
 */
@property (nonatomic, assign) CGSize qh_resizeCenter;
/**
 改变视图尺寸大小并向上居中
 */
@property (nonatomic, assign) CGSize qh_resizeTop;
/**
 改变视图尺寸大小并向下居中
 */
@property (nonatomic, assign) CGSize qh_resizeBottom;
/**
 改变视图尺寸大小并向左居中
 */
@property (nonatomic, assign) CGSize qh_resizeLeft;
/**
 改变视图尺寸大小并向右居中
 */
@property (nonatomic, assign) CGSize qh_resizeRight;
/**
 改变视图尺寸大小并向上居左
 */
@property (nonatomic, assign) CGSize qh_resizeTopLeft;
/**
 改变视图尺寸大小并向上居右
 */
@property (nonatomic, assign) CGSize qh_resizeTopRight;
/**
 改变视图尺寸大小并向下居左
 */
@property (nonatomic, assign) CGSize qh_resizeBottomLeft;
/**
 改变视图尺寸大小并向下居右
 */
@property (nonatomic, assign) CGSize qh_resizeBottomRight;

/**
 安全区宽度
 */
@property (nonatomic, assign, readonly) CGFloat qh_safeAreaWidth;
/**
 安全区高度
 */
@property (nonatomic, assign, readonly) CGFloat qh_safeAreaHeight;

/**
 内容区宽度
 */
@property (nonatomic, assign, readonly) CGFloat qh_contentAreaWidth;
/**
 内容区高度
 */
@property (nonatomic, assign, readonly) CGFloat qh_contentAreaHeight;

/**
 状态条高度
 */
@property (nonatomic, assign, readonly) CGFloat qh_statusBarHeight;
/**
 导航条高度
 */
@property (nonatomic, assign, readonly) CGFloat qh_navigationBarHeight;
/**
 底部导航条高度
 */
@property (nonatomic, assign, readonly) CGFloat qh_tabBarHeight;
/**
 底部操作区高度
 */
@property (nonatomic, assign, readonly) CGFloat qh_homeIndicatorHeight;

/**
 视图切圆角
 
 @param radius 圆角半径
 @param corners 圆角位置
 */
- (void)qh_cornerWithRaius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners;

#pragma mark - 视图继承关系
/**
 移除所有子视图
 */
- (void)qh_removeAllSubviews;

/**
 查询子视图(子视图的子视图)
 
 @param className 子视图类名字符串
 @return 子视图
 */
- (UIView *)qh_subViewOfClassName:(NSString *)className;

/**
 查询子视图(子视图的子视图)
 
 @param classType 子视图类型
 @return 子视图
 */
- (UIView *)qh_subViewOfClassType:(Class)classType;

/**
 查询父视图
 
 @param classType 父视图类型
 @return 父视图
 */
- (UIView *)qh_superviewOfClassType:(Class)classType;

@end


#pragma mark - 视图控制器
@interface UIView (GQHController)

/**
 视图的视图控制器
 
 @return 视图控制器
 */
- (UIViewController *)qh_currentViewController;

/**
 视图导航控制器
 
 @return 视图导航控制器
 */
- (UINavigationController *)qh_navigationController;

@end
