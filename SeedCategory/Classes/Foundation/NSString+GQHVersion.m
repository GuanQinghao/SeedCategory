//
//  NSString+GQHVersion.m
//  Seed
//
//  Created by Mac on 2019/10/11.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import "NSString+GQHVersion.h"


@implementation NSString (GQHVersion)

/// 是否大于某一版本
/// @param version 某一版本
- (BOOL)qh_newerThan:(NSString *)version {
    
    return [self compare:version] == NSOrderedDescending;
}

/// 是否大于或等于某一版本
/// @param version 某一版本
- (BOOL)qh_newerThanOrEqualTo:(NSString *)version {
    
    NSComparisonResult result = [self compare:version];
    
    return result == NSOrderedDescending || result == NSOrderedSame;
}

/// 是否小于某一版本
/// @param version 某一版本
- (BOOL)qh_olderThan:(NSString *)version {
    
    return [self compare:version] == NSOrderedAscending;
}

/// 是否小于或等于某一版本
/// @param version 某一版本
- (BOOL)qh_olderThanOrEqualTo:(NSString *)version {
    
    NSComparisonResult result = [self compare:version];
    
    return result == NSOrderedAscending || result == NSOrderedSame;
}

/// 版本号比较
/// @param version 版本号
- (NSComparisonResult)compare:(NSString *)version {
    
    NSArray *leftVersion = [self componentsSeparatedByString:@"."];
    NSArray *rightVersion = [version componentsSeparatedByString:@"."];
    
    // 比较次数
    NSInteger count = MAX(leftVersion.count, rightVersion.count);
    
    for (NSInteger i = 0; i < count; i++) {
        
        // 版本某位上的值
        NSInteger left = (i < leftVersion.count) ? [leftVersion[i] integerValue] : 0;
        // 版本某位上的值
        NSInteger right = (i < rightVersion.count) ? [rightVersion[i] integerValue] : 0;
        
        if (left > right) {
            
            // 降序
            return NSOrderedDescending;
        } else if ( left < right) {
            
            // 升序
            return NSOrderedAscending;
        }
    }
    
    return NSOrderedSame;
}

@end
