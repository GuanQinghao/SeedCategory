//
//  NSArray+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SeedCategory)

/// 安全初始化任意对象为数组
/// @param object 任意对象
+ (instancetype)s_arrayWithObject:(nullable id)object;

/// 获取任意索引的数组对象
/// @param index 任意索引值
- (nullable id)s_objectAtIndex:(NSUInteger)index;

/// 安全获取任意索引范围的子数组
/// @param range 索引范围
- (NSArray *)s_subarrayWithRange:(NSRange)range;

/// 获取任意对象的数组索引值
/// @param anObject 任意对象
- (NSUInteger)s_indexOfObject:(nullable id)anObject;

/// 是否存在数组或是空数组
- (BOOL)s_isEmpty;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (SeedCategory)

/// 安全修改(或加入)非空对象
/// @param object 非空对象
/// @param index 索引值
- (void)s_setObject:(nullable id)object atIndex:(NSUInteger)index;

/// 添加非空对象
/// @param object 非空对象
- (void)s_addObject:(nullable id)object;

/// 安全插入非空对象
/// @param anObject 非空对象
/// @param index 插入位置的索引值
- (void)s_insertObject:(nullable id)anObject atIndex:(NSUInteger)index;

/// 安全插入多个非空对象
/// @param objects 多个非空对象
/// @param indexes 插入位置的索引值
- (void)s_insertObjects:(nullable NSArray *)objects atIndexes:(nullable NSIndexSet *)indexes;

/// 根据索引安全移除对象
/// @param index 索引值
- (void)s_removeObjectAtIndex:(NSUInteger)index;

/// 根据索引范围安全移除多个对象
/// @param range 索引值范围
- (void)s_removeObjectsInRange:(NSRange)range;

/// 是否存在数组或是空数组
- (BOOL)s_isEmpty;

@end

NS_ASSUME_NONNULL_END
