//
//  UIResponder+Category.m
//  Expecta
//
//  Created by GuanQinghao on 2020/9/20.
//

#import "UIResponder+Category.h"

@implementation UIResponder (Category)

/// 路由响应链
/// @param identifier 响应标识
/// @param userInfo 响应信息
- (void)qh_routerEventWithIdentifier:(NSString *)identifier userInfo:(NSDictionary *)userInfo {
    
    if (self.nextResponder) {
        
        [self.nextResponder qh_routerEventWithIdentifier:identifier userInfo:userInfo];
    }
}

@end
