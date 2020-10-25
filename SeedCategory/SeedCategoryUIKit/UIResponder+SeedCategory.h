//
//  UIResponder+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (SeedCategory)

/// 路由响应链
/// @param identifier 响应标识
/// @param userInfo 响应信息
- (void)s_routerEventWithIdentifier:(NSString *)identifier userInfo:(nullable NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
