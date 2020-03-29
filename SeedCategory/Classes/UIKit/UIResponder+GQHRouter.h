//
//  UIResponder+GQHRouter.h
//  Seed
//
//  Created by Mac on 2019/3/21.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (GQHRouter)

/**
 路由响应链
 
 @param identifier 响应标识
 @param userInfo 响应信息
 */
- (void)qh_routerEventWithIdentifier:(NSString *)identifier userInfo:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
