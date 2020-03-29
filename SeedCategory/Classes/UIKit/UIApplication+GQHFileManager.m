//
//  UIApplication+GQHFileManager.m
//  Seed
//
//  Created by Mac on 2018/7/20.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "UIApplication+GQHFileManager.h"


@implementation UIApplication (GQHFileManager)

/**
 documents位置
 
 @return documents位置
 */
- (NSURL *)qh_documentsURL {
    
    return [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].lastObject;
}

/**
 documents路径
 
 @return documents路径
 */
- (NSString *)qh_documentsPath {
    
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

/**
 caches位置
 
 @return caches位置
 */
- (NSURL *)qh_cachesURL {
    
    return [NSFileManager.defaultManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask].lastObject;
}

/**
 caches路径
 
 @return caches路径
 */
- (NSString *)qh_cachesPath {
    
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}

/**
 library位置
 
 @return library位置
 */
- (NSURL *)qh_libraryURL {
    
    return [NSFileManager.defaultManager URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask].lastObject;
}

/**
 library路径
 
 @return library路径
 */
- (NSString *)qh_libraryPath {
    
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
}

@end
