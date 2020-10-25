//
//  UIResponder+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "UIResponder+SeedCategory.h"


@implementation UIResponder (SeedCategory)

/// 路由响应链
/// @param identifier 响应标识
/// @param userInfo 响应信息
- (void)s_routerEventWithIdentifier:(NSString *)identifier userInfo:(NSDictionary *)userInfo {
    
    if (self.nextResponder) {
        
        [self.nextResponder s_routerEventWithIdentifier:identifier userInfo:userInfo];
    }
}

@end
