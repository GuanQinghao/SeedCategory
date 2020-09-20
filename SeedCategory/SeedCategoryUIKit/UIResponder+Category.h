//
//  UIResponder+Category.h
//  Expecta
//
//  Created by GuanQinghao on 2020/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (Category)

/// 路由响应链
/// @param identifier 响应标识
/// @param userInfo 响应信息
- (void)qh_routerEventWithIdentifier:(NSString *)identifier userInfo:(nullable NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
