//
//  NSDictionary+GQHJSON.h
//  Seed
//
//  Created by Mac on 2018/9/28.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (GQHJSON)

/// JSON字符串转字典
/// @param JSON JSON字符串
+ (NSDictionary *)qh_dictionaryWithJSON:(NSString *)JSON;

/// 字典转JSON字符串
- (NSString *)qh_JSONString;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSObject (GQHPrint)

/// Objective-C对象转JSON字符串
- (nullable NSString *)qh_toJSONString;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

///数组打印
@interface NSArray (GQHPrint)

- (NSString *)qh_debugDescription;

- (NSString *)qh_descriptionWithLocale:(id)locale;

- (NSString *)qh_descriptionWithLocale:(id)locale indent:(NSUInteger)level;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

/// 字典打印
@interface NSDictionary (GQHPrint)

- (NSString *)qh_debugDescription;

- (NSString *)qh_descriptionWithLocale:(id)locale;

- (NSString *)qh_descriptionWithLocale:(id)locale indent:(NSUInteger)level;

@end

NS_ASSUME_NONNULL_END
