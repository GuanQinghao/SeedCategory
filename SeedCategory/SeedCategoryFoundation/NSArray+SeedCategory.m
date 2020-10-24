//
//  NSArray+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "NSArray+SeedCategory.h"


@implementation NSArray (SeedCategory)

/// 安全初始化任意对象为数组
/// @param object 任意对象
+ (instancetype)s_arrayWithObject:(id)object {
    
    if (object) {
        
        return [self arrayWithObject:object];
    } else {
        
        return [self array];
    }
}

/// 获取任意索引的数组对象
/// @param index 任意索引值
- (id)s_objectAtIndex:(NSUInteger)index {
    
    if (index < self.count) {
        
        return [self objectAtIndex:index];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return nil;
    }
}

/// 安全获取任意索引范围的子数组
/// @param range 索引范围
- (NSArray *)s_subarrayWithRange:(NSRange)range {
    
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    
    if (location + length <= self.count) {
        
        return [self subarrayWithRange:range];
    } else {
        
        length = self.count - location;
        
        if (length > 0) {
            
            return [self s_subarrayWithRange:NSMakeRange(location, length)];
        } else {
            
            return [NSArray array];
        }
    }
}

/// 获取任意对象的数组索引值
/// @param anObject 任意对象
- (NSUInteger)s_indexOfObject:(id)anObject {
    
    if (anObject) {
        
        return [self indexOfObject:anObject];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return NSNotFound;
    }
}

/// 是否存在数组或是空数组
- (BOOL)s_isEmpty {
    
    if (!self) {
        
        return YES;
    }
    
    if ([self isKindOfClass: [NSNull class]]) {
        
        return YES;
    }
    
    if (self.count <= 0) {
        
        return YES;
    }
    
    return NO;
}

@end


@implementation NSMutableArray (SeedCategory)

/// 安全修改(或加入)非空对象
/// @param object 非空对象
/// @param index 索引值
- (void)s_setObject:(id)object atIndex:(NSUInteger)index {
    
    if (object && index < self.count) {
        
        [self replaceObjectAtIndex:index withObject:object];
    } else if (object && index == self.count) {
        
        [self addObject:object];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 添加非空对象
/// @param object 非空对象
- (void)s_addObject:(id)object {
    
    if (object) {
        
        [self addObject:object];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 安全插入非空对象
/// @param anObject 非空对象
/// @param index 插入位置的索引值
- (void)s_insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if (anObject && index < self.count) {
        
        [self insertObject:anObject atIndex:index];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 安全插入多个非空对象
/// @param objects 多个非空对象
/// @param indexes 插入位置的索引值
- (void)s_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes {
    
    if (objects && objects.count == indexes.count && (![indexes indexGreaterThanOrEqualToIndex:(self.count + objects.count)])) {
        
        [self insertObjects:objects atIndexes:indexes];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 根据索引安全移除对象
/// @param index 索引值
- (void)s_removeObjectAtIndex:(NSUInteger)index {
    
    if (index < self.count) {
        
        [self removeObjectAtIndex:index];
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 根据索引范围安全移除多个对象
/// @param range 索引值范围
- (void)s_removeObjectsInRange:(NSRange)range {
    
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    
    if (location < self.count) {
        
        if (location + length <= self.count) {
            
            [self removeObjectsInRange:range];
        } else {
            
            length = self.count - location;
            [self removeObjectsInRange:NSMakeRange(location, length)];
        }
    } else {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
}

/// 是否存在数组或是空数组
- (BOOL)s_isEmpty {
    
    if (!self) {
        
        return YES;
    }
    
    if ([self isKindOfClass: [NSNull class]]) {
        
        return YES;
    }
    
    if (self.count <= 0) {
        
        return YES;
    }
    
    return NO;
}

@end
