//
//  NSBundle+GQHBundle.h
//  Seed
//
//  Created by Mac on 2019/10/14.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (GQHBundle)

/**
 项目资源包
 
 @return 项目资源包
 */
+ (NSBundle *)qh_bundle;

@end

NS_ASSUME_NONNULL_END
