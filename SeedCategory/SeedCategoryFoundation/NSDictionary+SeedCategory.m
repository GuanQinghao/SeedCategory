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

@implementation NSMutableDictionary (SeedCategory)

/// 安全添加键值对
/// @param object 任意对象
/// @param key 任意对象对应key值
- (void)s_setObject:(id)object forKey:(id)key {
    
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
