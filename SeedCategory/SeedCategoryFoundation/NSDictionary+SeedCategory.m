//
//  NSDictionary+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "NSDictionary+SeedCategory.h"


@implementation NSDictionary (SeedCategory)

/// 获取任意key值的对象
/// @param key 字典key值
- (id)s_objectForKey:(NSString *)key {
    
    if (key != nil) {
        
        id object = [self objectForKey:key];
        if (object != nil) {
            
            return object;
        }
    }
    
    return nil;
}

@end

@implementation NSMutableDictionary (SeedCategory)

/// 安全添加键值对
/// @param object 任意对象
/// @param key 任意对象对应key值
- (void)s_setObject:(id)object forKey:(id)key {
    
    if (key != nil && object != nil) {
        
        [self setObject:object forKey:key];
    }
}

@end
