//
//  UIApplication+GQHFileManager.h
//  Seed
//
//  Created by Mac on 2018/7/20.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIApplication (GQHFileManager)

/**
 documents位置
 */
@property (nonatomic, readonly, strong) NSURL *qh_documentsURL;

/**
 documents位置
 
 @return documents位置
 */
- (NSURL *)qh_documentsURL;

/**
 documents路径
 */
@property (nonatomic, readonly, copy) NSString *qh_documentsPath;

/**
 documents路径
 
 @return documents路径
 */
- (NSString *)qh_documentsPath;

/**
 caches位置
 */
@property (nonatomic, readonly, strong) NSURL *qh_cachesURL;

/**
 caches位置
 
 @return caches位置
 */
- (NSURL *)qh_cachesURL;

/**
 caches路径
 */
@property (nonatomic, readonly, copy) NSString *qh_cachesPath;

/**
 caches路径
 
 @return caches路径
 */
- (NSString *)qh_cachesPath;

/**
 library位置
 */
@property (nonatomic, readonly, strong) NSURL *qh_libraryURL;

/**
 library位置
 
 @return library位置
 */
- (NSURL *)qh_libraryURL;

/**
 library路径
 */
@property (nonatomic, readonly, copy) NSString *qh_libraryPath;

/**
 library路径
 
 @return library路径
 */
- (NSString *)qh_libraryPath;

@end
