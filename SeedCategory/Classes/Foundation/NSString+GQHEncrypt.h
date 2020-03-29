//
//  NSString+GQHEncrypt.h
//  Seed
//
//  Created by GuanQinghao on 25/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString (GQHEncrypt)

/// MD5加密 32位小写16进制
/// @param string 需要加密的字符串
+ (NSString *)qh_encryptWithMD5:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
