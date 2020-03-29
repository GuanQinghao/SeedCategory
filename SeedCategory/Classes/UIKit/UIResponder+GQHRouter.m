//
//  UIResponder+GQHRouter.m
//  Seed
//
//  Created by Mac on 2019/3/21.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import "UIResponder+GQHRouter.h"


@implementation UIResponder (GQHRouter)

/**
 路由响应链
 
 @param identifier 响应标识
 @param userInfo 响应信息
 */
- (void)qh_routerEventWithIdentifier:(NSString *)identifier userInfo:(NSDictionary *)userInfo {
    
    if (self.nextResponder) {
        
        [self.nextResponder qh_routerEventWithIdentifier:identifier userInfo:userInfo];
    }
}

@end

