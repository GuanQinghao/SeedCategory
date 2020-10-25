//
//  UIViewController+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <UIKit/UIKit.h>


#pragma mark -------------------------------------------------------------------
// 用户登录后保存用户信息
// 用户类型
#define USER_TYPE                   @"userTypeKey"
#define USER_GET_TYPE               [[NSUserDefaults standardUserDefaults] valueForKey:USER_TYPE]

// 用户状态
#define USER_STATUS                 @"userStatusKey"
#define USER_GET_STATUS             [[NSUserDefaults standardUserDefaults] valueForKey:USER_STATUS]


#pragma mark -------------------------------------------------------------------
// 用户类型
#define USER_TYPE_G                @"00"          // 游客、访客
#define USER_TYPE_J                @"01"          // 初级用户
#define USER_TYPE_S                @"02"          // 高级用户
#define USER_TYPE_M                @"03"          // 管理用户

// 用户状态
#define USER_STATUS_N             @"00"     // 未登录
#define USER_STATUS_F             @"01"     // 初次登录
#define USER_STATUS_S             @"02"     // 非初次登录


/// 用户类型
typedef NS_ENUM(NSInteger, SeedUserType) {
    
    /// 游客、访客
    SeedUserTypeGuest,
    /// 初级用户
    SeedUserTypeJunior,
    /// 高级用户
    SeedUserTypeSenior,
    /// 管理用户
    SeedUserTypeManager,
};


/// 用户状态
typedef NS_ENUM(NSInteger, SeedUserStatusType) {
    
    /// 未登录
    SeedUserStatusTypeNone,
    /// 初次登录
    SeedUserStatusTypeSignInFirst,
    /// 非初次登录
    SeedUserStatusTypeSignIn,
};


/// 用户权限
typedef NS_ENUM(NSInteger, SeedAccessPermissionType) {
    
    /// 无权限
    SeedAccessPermissionTypeNone,
    /// 初级访问权限
    SeedAccessPermissionTypeJunior,
    /// 高级访问权限
    SeedAccessPermissionTypeAdvanced,
    /// 管理权限
    SeedAccessPermissionTypeManagement,
};


NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SeedCategory)

/// 检查用户类型
- (SeedUserType)s_checkUserType;
/// 检查用户状态
- (SeedUserStatusType)s_checkUserStatusType;
/// 检查用户权限
- (SeedAccessPermissionType)s_checkAccessPermissionType;

/// 检查用户访问权限
/// @param accessPermissionType 用户访问权限类型
/// @param allowedBlock 允许访问处理
/// @param unallowedBlock 不允许访问处理
- (void)s_checkAccessPermissionType:(SeedAccessPermissionType)accessPermissionType allowed:(nullable void(^)(void))allowedBlock unallowed:(nullable void(^)(void))unallowedBlock;

/// 单操作警告弹窗视图 (确定操作)
/// @param title 弹窗标题
/// @param message 弹窗信息
/// @param handler 弹窗操作处理
/// @param completion 弹窗完成后处理
- (void)s_alertWithTitle:(nullable NSString *)title message:(nullable NSString *)message handler:(nullable void (^)(UIAlertAction * _Nullable action))handler completion:(nullable void (^)(void))completion;

/// 双操作警告弹窗视图 (自定义|取消)
/// @param title 弹窗标题
/// @param message 弹窗信息
/// @param actionTitle 弹窗操作标题
/// @param handler 弹窗操作处理
/// @param completion 弹窗完成后处理
- (void)s_alertWithTitle:(nullable NSString *)title message:(nullable NSString *)message actionTitle:(nullable NSString *)actionTitle handler:(nullable void (^)(UIAlertAction * _Nullable action))handler completion:(nullable void (^)(void))completion;

/// 多操作警告弹窗视图
/// @param title 弹窗标题
/// @param message 弹窗信息
/// @param actionTitles 弹窗操作标题数组
/// @param handler 弹窗操作处理 (根据序号分别处理)
/// @param completion 弹窗完成后处理
- (void)s_alertWithTitle:(nullable NSString *)title message:(nullable NSString *)message actionTitles:(nullable NSArray<NSString *> *)actionTitles handler:(nullable void (^)(UIAlertAction * _Nullable action, NSUInteger index))handler completion:(nullable void (^)(void))completion;

/// 带输入框的警告弹窗
/// @param title 弹窗标题
/// @param message 弹窗信息
/// @param inputHandler 输入处理
/// @param actionHandler 弹窗操作处理
/// @param completion 弹窗完成后处理
- (void)s_alertWithTitle:(nullable NSString *)title message:(nullable NSString *)message inputHandler:(nullable void (^)(UITextField * _Nullable textField))inputHandler actionHandler:(nullable void (^)(UIAlertAction * _Nullable action, UIAlertController * _Nonnull alertController))actionHandler completion:(nullable void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
