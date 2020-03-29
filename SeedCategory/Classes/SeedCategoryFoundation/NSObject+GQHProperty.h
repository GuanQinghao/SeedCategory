//
//  NSObject+GQHProperty.h
//  Xanthium
//
//  Created by GuanQinghao on 30/03/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (GQHProperty)

/// 控制台输出属性代码
/// @param dictionary 属性字典
+ (void)qh_outputPropertyCodeWithDictionary:(NSDictionary *)dictionary;

@end
