//
//  UIViewController+GQHPermission.h
//  Seed
//
//  Created by GuanQinghao on 2018/8/16.
//  Copyright © 2018 GuanQinghao. All rights reserved.
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
typedef NS_ENUM(NSInteger, GQHUserType) {
    
    /// 游客、访客
    GQHUserTypeGuest,
    /// 初级用户
    GQHUserTypeJunior,
    /// 高级用户
    GQHUserTypeSenior,
    /// 管理用户
    GQHUserTypeManager,
};

/// 用户状态
typedef NS_ENUM(NSInteger, GQHUserStatusType) {
    
    /// 未登录
    GQHUserStatusTypeNone,
    /// 初次登录
    GQHUserStatusTypeSignInFirst,
    /// 非初次登录
    GQHUserStatusTypeSignIn,
};

/// 用户权限
typedef NS_ENUM(NSInteger, GQHAccessPermissionType) {
    
    /// 无权限
    GQHAccessPermissionTypeNone,
    /// 初级访问权限
    GQHAccessPermissionTypeJunior,
    /// 高级访问权限
    GQHAccessPermissionTypeAdvanced,
    /// 管理权限
    GQHAccessPermissionTypeManagement,
};

@interface UIViewController (GQHPermission)

/// 检查用户类型
- (GQHUserType)qh_checkUserType;
/// 检查用户状态
- (GQHUserStatusType)qh_checkUserStatusType;
/// 检查用户权限
- (GQHAccessPermissionType)qh_checkAccessPermissionType;

/// 检查用户访问权限
- (void)qh_checkAccessPermissionType:(GQHAccessPermissionType)accessPermissionType allowed:(void(^)(void))allowedBlock unallowed:(void(^)(void))unallowedBlock;

@end
