//
//  UIApplication+GQHApplication.h
//  Seed
//
//  Created by GuanQinghao on 21/03/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (GQHApplication)

/**
 应用程序版本号
 */
@property (nonatomic, readonly, copy) NSString *qh_applicationShortVersion;

/**
 应用程序版本号
 
 @return 应用程序版本号
 */
- (NSString *)qh_applicationShortVersion;

/**
 应用程序构建版本号
 */
@property (nonatomic, readonly, copy) NSString *qh_applicationBuildVersion;

/**
 应用程序构建版本号
 
 @return 应用程序构建版本号
 */
- (NSString *)qh_applicationBuildVersion;

/**
 应用程序名称
 */
@property (nonatomic, readonly, copy) NSString *qh_applicationDisplayName;

/**
 应用程序名称
 
 @return 应用程序名称
 */
- (NSString *)qh_applicationDisplayName;

/**
 应用程序唯一编号
 */
@property (nonatomic, readonly, copy) NSString *qh_applicationBundleID;

/**
 应用程序唯一编号
 
 @return 应用程序唯一编号
 */
- (NSString *)qh_applicationBundleID;

/**
 拨打电话(弹出框提示) (使用前检查类型，非iPhone不能拨打电话)
 
 @param mobile 手机号
 */
- (void)qh_dialWithMobile:(NSString * _Nonnull)mobile;

/**
 发信息 (使用前检查类型，非iPhone不能发送信息)
 
 @param mobile 手机号
 */
- (void)qh_smsWithMobile:(NSString * _Nonnull)mobile;

/**
 发送邮件 (使用前检查网络、地址规则和本机邮箱地址设置)
 
 @param email 电子邮箱地址
 */
- (void)qh_mailWithEmail:(NSString *)email;

/**
 在iTunes中打开app (使用前检查网络)
 
 @param appID 商店里应用程序的AppID
 */
- (void)qh_iTunesAppWithAppID:(NSString *)appID;

@end

NS_ASSUME_NONNULL_END
