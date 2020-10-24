//
//  NSDictionary+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SeedCategory)

/// 获取任意key值的对象
/// @param key 字典key值
- (nullable id)s_objectForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (SeedCategory)

/// 安全添加键值对
/// @param object 任意对象
/// @param key 任意对象对应key值
- (void)s_setObject:(id)object forKey:(id)key;

@end

NS_ASSUME_NONNULL_END
