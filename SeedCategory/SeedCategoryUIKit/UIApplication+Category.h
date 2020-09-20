//
//  UIApplication+Category.h
//  Expecta
//
//  Created by GuanQinghao on 2020/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (Category)

/// documents位置
@property (nonatomic, readonly, strong) NSURL *qh_documentsURL;

/// documents位置
- (NSURL *)qh_documentsURL;

/// documents路径
@property (nonatomic, readonly, copy) NSString *qh_documentsPath;

/// documents路径
- (NSString *)qh_documentsPath;

/// caches位置
@property (nonatomic, readonly, strong) NSURL *qh_cachesURL;

/// caches位置
- (NSURL *)qh_cachesURL;

/// caches路径
@property (nonatomic, readonly, copy) NSString *qh_cachesPath;

/// caches路径
- (NSString *)qh_cachesPath;

/// library位置
@property (nonatomic, readonly, strong) NSURL *qh_libraryURL;

/// library位置
- (NSURL *)qh_libraryURL;

/// library路径
@property (nonatomic, readonly, copy) NSString *qh_libraryPath;

/// library路径
- (NSString *)qh_libraryPath;

/// 应用程序版本号
@property (nonatomic, readonly, copy) NSString *qh_applicationShortVersion;

/// 应用程序版本号
- (NSString *)qh_applicationShortVersion;

/// 应用程序构建版本号
@property (nonatomic, readonly, copy) NSString *qh_applicationBuildVersion;

/// 应用程序构建版本号
- (NSString *)qh_applicationBuildVersion;

/// 应用程序名称
@property (nonatomic, readonly, copy) NSString *qh_applicationDisplayName;

/// 应用程序名称
- (NSString *)qh_applicationDisplayName;

/// 应用程序唯一编号
@property (nonatomic, readonly, copy) NSString *qh_applicationBundleID;

/// 应用程序唯一编号
- (NSString *)qh_applicationBundleID;

/// 拨打电话(弹出框提示) (使用前检查类型，非iPhone不能拨打电话)
/// @param mobile 手机号
/// @param handler 回调处理
- (void)qh_dialWithMobile:(nullable NSString *)mobile handler:(nullable void (^)(BOOL success))handler;

/// 发信息 (使用前检查类型，非iPhone不能发送信息)
/// @param mobile 手机号
/// @param handler 回调处理
- (void)qh_smsWithMobile:(nullable NSString *)mobile handler:(nullable void (^)(BOOL success))handler;

/// 发送邮件 (使用前检查网络、地址规则和本机邮箱地址设置)
/// @param email 邮箱地址
/// @param handler 回调处理
- (void)qh_mailWithEmail:(nullable NSString *)email handler:(nullable void (^)(BOOL success))handler;

/// 在iTunes中打开app (使用前检查网络)
/// @param appID 商店中的应用程序appID
/// @param handler 回调处理
- (void)qh_iTunesAppWithAppID:(nullable NSString *)appID handler:(nullable void (^)(BOOL success))handler;

@end

NS_ASSUME_NONNULL_END
