//
//  NSDictionary+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "NSDictionary+SeedCategory.h"


@implementation NSDictionary (SeedCategory)

/// 获取任意key的对象
/// @param key 字典key
- (id)s_objectForKey:(id)key {
    
    if (![self isKindOfClass:NSDictionary.class]) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return nil;
    }
    
    if (key == nil) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return nil;
    }
    
    return [self objectForKey:key];
}

@end

@implementation NSMutableDictionary (SeedCategory)

/// 安全添加键值对
/// @param object 任意对象
/// @param key 任意对象对应key值
- (void)s_setObject:(id)object forKey:(id)key {
    
    if (![self isKindOfClass:NSMutableDictionary.class]) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    if (key == nil) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    if (object == nil) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    [self setObject:object forKey:key];
}

@end
