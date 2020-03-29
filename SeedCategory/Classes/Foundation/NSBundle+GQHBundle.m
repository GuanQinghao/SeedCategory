//
//  NSBundle+GQHBundle.m
//  Seed
//
//  Created by Mac on 2019/10/14.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import "NSBundle+GQHBundle.h"


@implementation NSBundle (GQHBundle)

/**
 项目资源包
 
 @return 项目资源包
 */
+ (NSBundle *)qh_bundle {
    
    return [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"Seed" ofType:@"bundle"]];
}

@end
