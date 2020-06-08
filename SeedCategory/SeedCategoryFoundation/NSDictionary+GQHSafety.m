//
//  NSDictionary+GQHSafety.m
//  Seed
//
//  Created by GuanQinghao on 25/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "NSDictionary+GQHSafety.h"


@implementation NSDictionary (GQHSafety)

/// 获取任意key值的对象
/// @param key 字典key值
- (id)qh_safetyObjectForKey:(NSString *)key {
    
    if (key) {
        
        id object = [self objectForKey:key];
        if (object) {
            
            return object;
        } else {
            
            return @"";
        }
    } else {
        
        return nil;
    }
}

@end


@implementation NSMutableDictionary (GQHSafety)

/// 安全添加键值对
/// @param object 任意对象
/// @param key 任意对象对应key值
- (void)qh_safetySetObject:(id)object forKey:(id)key {
    
    if (key) {
        
        if (object) {
            
            [self setValue:object forKey:key];
        } else {
            
            [self setValue:@"" forKey:key];
        }
    } else {
        
        return;
    }
}

@end
