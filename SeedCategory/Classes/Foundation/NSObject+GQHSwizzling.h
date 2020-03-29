//
//  NSObject+GQHSwizzling.h
//  Seed
//
//  Created by GuanQinghao on 07/03/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (GQHSwizzling)

/// 设置方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 设置的方法名
+ (BOOL)qh_overrideMethod:(SEL)originalSel withMethod:(SEL)alterSel;

/// 设置类方法的实现
/// @param originalSel 原始类方法名
/// @param alterSel 设置的类方法名
+ (BOOL)qh_overrideClassMethod:(SEL)originalSel withMethod:(SEL)alterSel;

/// 交换两个方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 交换后的方法名
+ (BOOL)qh_exchangeMethod:(SEL)originalSel withMethod:(SEL)alterSel;

/// 交换两个类方法的实现
/// @param originalSel 原始方法名
/// @param alterSel 交换后的方法名
+ (BOOL)qh_exchangeClassMethod:(SEL)originalSel withMethod:(SEL)alterSel;

@end
