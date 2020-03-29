//
//  UIViewController+GQHPermission.m
//  Seed
//
//  Created by GuanQinghao on 2018/8/16.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "UIViewController+GQHPermission.h"


@implementation UIViewController (GQHPermission)

/// 检查用户类型
- (GQHUserType)qh_checkUserType {
    
    if ([USER_GET_TYPE isEqualToString:USER_TYPE_J]) {
        
        /// 初级用户
        return GQHUserTypeJunior;
    }
    
    if ([USER_GET_TYPE isEqualToString:USER_TYPE_S]) {
        
        /// 高级用户
        return GQHUserTypeSenior;
    }
    
    if ([USER_GET_TYPE isEqualToString:USER_TYPE_M]) {
        
        /// 管理用户
        return GQHUserTypeManager;
    }
    
    /// 游客、访客
    return GQHUserTypeGuest;
}

/// 检查用户状态
- (GQHUserStatusType)qh_checkUserStatusType {
    
    if ([USER_GET_STATUS isEqualToString:USER_STATUS_F]) {
        
        /// 初次登录
        return GQHUserStatusTypeSignInFirst;
    }
    
    if ([USER_GET_STATUS isEqualToString:USER_STATUS_S]) {
        
        /// 非初次登录
        return GQHUserStatusTypeSignIn;
    }
    
    /// 未登录
    return GQHUserStatusTypeNone;
}
/// 检查用户权限
- (GQHAccessPermissionType)qh_checkAccessPermissionType {
    
    if ([USER_GET_STATUS isEqualToString:USER_STATUS_N]) {
        
        return GQHAccessPermissionTypeNone;
    }
    
    if ([USER_GET_TYPE isEqualToString:USER_TYPE_M]) {
        
        return GQHAccessPermissionTypeManagement;
    }
    
    if ([USER_GET_TYPE isEqualToString:USER_TYPE_S]) {
        
        return GQHAccessPermissionTypeAdvanced;
    }
    
    return GQHAccessPermissionTypeJunior;
}

/// 检查用户访问权限
- (void)qh_checkAccessPermissionType:(GQHAccessPermissionType)accessPermissionType allowed:(void(^)(void))allowedBlock unallowed:(void(^)(void))unallowedBlock {
    
    if ([self qh_checkAccessPermissionType] >= accessPermissionType) {
        
        allowedBlock();
    } else {
        
        unallowedBlock();
    }
}

@end
