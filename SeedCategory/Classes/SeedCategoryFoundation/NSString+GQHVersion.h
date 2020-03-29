//
//  NSString+GQHVersion.h
//  Seed
//
//  Created by Mac on 2019/10/11.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString (GQHVersion)

/// 是否大于某一版本
/// @param version 某一版本
- (BOOL)qh_newerThan:(NSString *)version;

/// 是否大于或等于某一版本
/// @param version 某一版本
- (BOOL)qh_newerThanOrEqualTo:(NSString *)version;

/// 是否小于某一版本
/// @param version 某一版本
- (BOOL)qh_olderThan:(NSString *)version;

/// 是否小于或等于某一版本
/// @param version 某一版本
- (BOOL)qh_olderThanOrEqualTo:(NSString *)version;

@end

NS_ASSUME_NONNULL_END
