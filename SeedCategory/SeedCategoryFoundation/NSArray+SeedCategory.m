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
    
    if (object != nil) {
        
        return [NSArray arrayWithObject:object];
    }
    
    return [NSArray array];
}

/// 获取任意索引的数组对象
/// @param index 任意索引值
- (id)s_objectAtIndex:(NSUInteger)index {
    
    if (![self isKindOfClass:NSArray.class]) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return nil;
    }
    
    if (index > self.count) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return nil;
    }
    
    return [self objectAtIndex:index];
}

/// 安全获取任意索引范围的子数组
/// @param range 索引范围
- (NSArray *)s_subarrayWithRange:(NSRange)range {
    
    NSArray *result = [NSArray array];
    
    if (![self isKindOfClass:NSArray.class]) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return result;
    }
    
    NSUInteger length = range.length;
    NSUInteger location = range.location;
    NSInteger diff = self.count - location;
    
    if (diff <= 0) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return result;
    }
    
    return [self subarrayWithRange:NSMakeRange(location, MIN(diff, length))];
}

/// 获取任意对象的数组索引值
/// @param anObject 任意对象
- (NSUInteger)s_indexOfObject:(id)anObject {
    
    if (anObject == nil) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return NSNotFound;
    }
    
    if (![self isKindOfClass:NSArray.class]) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return NSNotFound;
    }
    
    return [self indexOfObject:anObject];
}

/// 是否数组存在且为空
- (BOOL)s_isEmpty {
    
    return ([self isKindOfClass:NSArray.class] && self.count <= 0);
}

@end


@implementation NSMutableArray (SeedCategory)

/// 安全修改(或加入)非空对象
/// @param object 非空对象
/// @param index 索引值
- (void)s_setObject:(id)object atIndex:(NSUInteger)index {
    
    if (index < 0) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    if (object == nil) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    if (![self isKindOfClass:NSMutableArray.class]) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    if (index < self.count) {
        
        [self replaceObjectAtIndex:index withObject:object];
    } else {
        
        [self addObject:object];
    }
}

/// 添加非空对象
/// @param object 非空对象
- (void)s_addObject:(id)object {
    
    if (object == nil) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    if (![self isKindOfClass:NSMutableArray.class]) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    [self addObject:object];
}

/// 安全插入非空对象
/// @param anObject 非空对象
/// @param index 插入位置的索引值
- (void)s_insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if (![self isKindOfClass:NSMutableArray.class]) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    if (anObject == nil) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    if (index > self.count) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    if (index == self.count) {
        
        [self addObject:anObject];
        return;
    }
    
    [self insertObject:anObject atIndex:index];
}

/// 根据索引安全移除对象
/// @param index 索引值
- (void)s_removeObjectAtIndex:(NSUInteger)index {
    
    if (![self isKindOfClass:NSMutableArray.class]) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    if (index >= self.count) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    [self removeObjectAtIndex:index];
}

/// 根据索引范围安全移除多个对象
/// @param range 索引值范围
- (void)s_removeObjectsInRange:(NSRange)range {
    
    if (![self isKindOfClass:NSMutableArray.class]) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return;
    }
    
    NSUInteger length = range.length;
    NSUInteger location = range.location;
    NSInteger diff = self.count - location;
    
    if (diff <= 0) {
        
        NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
        return ;
    }
    
    [self removeObjectsInRange:NSMakeRange(location, MIN(diff, length))];
}

/// 是否数组存在且为空
- (BOOL)s_isEmpty {
    
    return ([self isKindOfClass:NSMutableArray.class] && self.count <= 0);
}

@end
