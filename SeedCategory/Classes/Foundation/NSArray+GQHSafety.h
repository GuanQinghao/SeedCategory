//
//  NSArray+GQHSafety.h
//  Seed
//
//  Created by GuanQinghao on 24/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSArray (GQHSafety)

/**
 安全初始化任意对象为数组
 
 @param object 任意对象
 @return 有效数组
 */
+ (instancetype)qh_safetyArrayWithObject:(nullable id)object;

/**
 获取任意索引的数组对象
 
 @param index 任意索引值
 @return 数组对象(可能为空)
 */
- (nullable id)qh_safetyObjectAtIndex:(NSUInteger)index;

/**
 安全获取任意索引范围的子数组
 
 @param range 索引范围
 @return 字数组(可能为空数组)
 */
- (NSArray *)qh_safetySubarrayWithRange:(NSRange)range;

/**
 获取任意对象的数组索引值
 
 @param anObject 任意对象
 @return 对象索引值(没有则返回 NSNotFound)
 */
- (NSUInteger)qh_safetyIndexOfObject:(nullable id)anObject;

/**
 是否存在数组或是空数组
 
 @return 不存在或是空数组
 */
- (BOOL)qh_isEmpty;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (GQHSafety)

/**
 安全修改(或加入)非空对象
 
 @param object 非空对象
 @param index 索引值
 */
- (void)qh_safetySetObject:(nullable id)object atIndex:(NSUInteger)index;

/**
 添加非空对象
 
 @param object 非空对象
 */
- (void)qh_safetyAddObject:(nullable id)object;

/**
 安全插入非空对象
 
 @param anObject 非空对象
 @param index 插入位置的索引值
 */
- (void)qh_safetyInsertObject:(nullable id)anObject atIndex:(NSUInteger)index;

/**
 安全插入多个非空对象
 
 @param objects 多个非空对象
 @param indexes 插入位置的索引值
 */
- (void)qh_safetyInsertObjects:(nullable NSArray *)objects atIndexes:(nullable NSIndexSet *)indexes;

/**
 根据索引安全移除对象
 
 @param index 索引值
 */
- (void)qh_safetyRemoveObjectAtIndex:(NSUInteger)index;

/**
 根据索引范围安全移除多个对象
 
 @param range 索引值范围
 */
- (void)qh_safetyRemoveObjectsInRange:(NSRange)range;

/**
 是否存在数组或是空数组
 
 @return 不存在或是空数组
 */
- (BOOL)qh_isEmpty;

@end

NS_ASSUME_NONNULL_END
