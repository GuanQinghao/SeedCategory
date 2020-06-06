//
//  NSObject+GQHSwizzling.m
//  Seed
//
//  Created by GuanQinghao on 07/03/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "NSObject+GQHSwizzling.h"
#import <objc/runtime.h>


@implementation NSObject (GQHSwizzling)

/// 设置方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 设置的方法名
+ (BOOL)qh_overrideMethod:(SEL)originalSel withMethod:(SEL)alterSel {
    
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    if (!originalMethod) {
        
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(originalSel), [self class]);
        return NO;
    }
    
    Method alterMethod = class_getInstanceMethod(self, alterSel);
    if (!alterMethod) {
        
        NSLog(@"alter method %@ not found for class %@", NSStringFromSelector(alterSel), [self class]);
        return NO;
    }
    
    method_setImplementation(originalMethod, class_getMethodImplementation(self, alterSel));
    
    return YES;
}

/// 设置类方法的实现
/// @param originalSel 原始类方法名
/// @param alterSel 设置的类方法名
+ (BOOL)qh_overrideClassMethod:(SEL)originalSel withMethod:(SEL)alterSel {
    
    Class class = object_getClass((id)self);
    return [class qh_overrideMethod:originalSel withMethod:alterSel];
}

/// 交换两个方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 交换后的方法名
+ (BOOL)qh_exchangeMethod:(SEL)originalSel withMethod:(SEL)alterSel {
    
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    if (!originalMethod) {
        
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(originalSel), [self class]);
        return NO;
    }
    
    Method alterMethod = class_getInstanceMethod(self, alterSel);
    if (!alterMethod) {
        
        NSLog(@"alter method %@ not found for class %@", NSStringFromSelector(alterSel), [self class]);
        return NO;
    }
    
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel),class_getInstanceMethod(self, alterSel));
    
    return YES;
}

/// 交换两个类方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 交换后的方法名
+ (BOOL)qh_exchangeClassMethod:(SEL)originalSel withMethod:(SEL)alterSel {
    
    Class class = object_getClass((id)self);
    return [class qh_exchangeMethod:originalSel withMethod:alterSel];
}

@end
