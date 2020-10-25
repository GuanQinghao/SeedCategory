//
//  UIApplication+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (SeedCategory)

/// documents位置
@property (nonatomic, readonly, strong) NSURL *s_documentsURL;

/// documents位置
- (NSURL *)s_documentsURL;

/// documents路径
@property (nonatomic, readonly, copy) NSString *s_documentsPath;

/// documents路径
- (NSString *)s_documentsPath;

/// caches位置
@property (nonatomic, readonly, strong) NSURL *s_cachesURL;

/// caches位置
- (NSURL *)s_cachesURL;

/// caches路径
@property (nonatomic, readonly, copy) NSString *s_cachesPath;

/// caches路径
- (NSString *)s_cachesPath;

/// library位置
@property (nonatomic, readonly, strong) NSURL *s_libraryURL;

/// library位置
- (NSURL *)s_libraryURL;

/// library路径
@property (nonatomic, readonly, copy) NSString *s_libraryPath;

/// library路径
- (NSString *)s_libraryPath;

/// 应用程序版本号
@property (nonatomic, readonly, copy) NSString *s_applicationShortVersion;

/// 应用程序版本号
- (NSString *)s_applicationShortVersion;

/// 应用程序构建版本号
@property (nonatomic, readonly, copy) NSString *s_applicationBuildVersion;

/// 应用程序构建版本号
- (NSString *)s_applicationBuildVersion;

/// 应用程序名称
@property (nonatomic, readonly, copy) NSString *s_applicationDisplayName;

/// 应用程序名称
- (NSString *)s_applicationDisplayName;

/// 应用程序唯一编号
@property (nonatomic, readonly, copy) NSString *s_applicationBundleID;

/// 应用程序唯一编号
- (NSString *)s_applicationBundleID;

/// 拨打电话(弹出框提示) (使用前检查类型，非iPhone不能拨打电话)
/// @param mobile 手机号
/// @param handler 回调处理
- (void)s_dialWith:(nullable NSString *)mobile handler:(nullable void (^)(BOOL success))handler;

/// 发信息 (使用前检查类型，非iPhone不能发送信息)
/// @param mobile 手机号
/// @param handler 回调处理
- (void)s_smsWith:(nullable NSString *)mobile handler:(nullable void (^)(BOOL success))handler;

/// 发送邮件 (使用前检查网络、地址规则和本机邮箱地址设置)
/// @param email 邮箱地址
/// @param handler 回调处理
- (void)s_mailWith:(nullable NSString *)email handler:(nullable void (^)(BOOL success))handler;

/// 在iTunes中打开app (使用前检查网络)
/// @param appID 商店中的应用程序appID
/// @param handler 回调处理
- (void)s_openAppIniTunesWith:(nullable NSString *)appID handler:(nullable void (^)(BOOL success))handler;

@end

NS_ASSUME_NONNULL_END
