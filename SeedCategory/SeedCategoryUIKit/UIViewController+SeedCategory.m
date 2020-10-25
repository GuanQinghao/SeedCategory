//
//  UIViewController+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "UIViewController+SeedCategory.h"


@implementation UIViewController (SeedCategory)

/// 检查用户类型
- (SeedUserType)s_checkUserType {
    
    if ([USER_GET_TYPE isEqualToString:USER_TYPE_J]) {
        
        /// 初级用户
        return SeedUserTypeJunior;
    }
    
    if ([USER_GET_TYPE isEqualToString:USER_TYPE_S]) {
        
        /// 高级用户
        return SeedUserTypeSenior;
    }
    
    if ([USER_GET_TYPE isEqualToString:USER_TYPE_M]) {
        
        /// 管理用户
        return SeedUserTypeManager;
    }
    
    /// 游客、访客
    return SeedUserTypeGuest;
}

/// 检查用户状态
- (SeedUserStatusType)s_checkUserStatusType {
    
    if ([USER_GET_STATUS isEqualToString:USER_STATUS_F]) {
        
        /// 初次登录
        return SeedUserStatusTypeSignInFirst;
    }
    
    if ([USER_GET_STATUS isEqualToString:USER_STATUS_S]) {
        
        /// 非初次登录
        return SeedUserStatusTypeSignIn;
    }
    
    /// 未登录
    return SeedUserStatusTypeNone;
}

/// 检查用户权限
- (SeedAccessPermissionType)s_checkAccessPermissionType {
    
    if ([USER_GET_STATUS isEqualToString:USER_STATUS_N]) {
        
        return SeedAccessPermissionTypeNone;
    }
    
    if ([USER_GET_TYPE isEqualToString:USER_TYPE_M]) {
        
        return SeedAccessPermissionTypeManagement;
    }
    
    if ([USER_GET_TYPE isEqualToString:USER_TYPE_S]) {
        
        return SeedAccessPermissionTypeAdvanced;
    }
    
    return SeedAccessPermissionTypeJunior;
}

/// 检查用户访问权限
/// @param accessPermissionType 用户访问权限类型
/// @param allowedBlock 允许访问处理
/// @param unallowedBlock 不允许访问处理
- (void)s_checkAccessPermissionType:(SeedAccessPermissionType)accessPermissionType allowed:(void (^)(void))allowedBlock unallowed:(void (^)(void))unallowedBlock {
    
    if ([self s_checkAccessPermissionType] >= accessPermissionType) {
        
        allowedBlock();
    } else {
        
        unallowedBlock();
    }
}

/// 单操作警告弹窗视图 (确定操作)
/// @param title 弹窗标题
/// @param message 弹窗信息
/// @param handler 弹窗操作处理
/// @param completion 弹窗完成后处理
- (void)s_alertWithTitle:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction * _Nonnull))handler completion:(void (^)(void))completion {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message: message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"ok", @"确定") style:UIAlertActionStyleDefault handler:handler]];
    
    [self presentViewController:alertController animated:YES completion:completion];
}

/// 双操作警告弹窗视图 (自定义|取消)
/// @param title 弹窗标题
/// @param message 弹窗信息
/// @param actionTitle 弹窗操作标题
/// @param handler 弹窗操作处理
/// @param completion 弹窗完成后处理
- (void)s_alertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle handler:(void (^)(UIAlertAction * _Nullable))handler completion:(void (^)(void))completion {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message: message preferredStyle:UIAlertControllerStyleAlert];
    
    // 取消操作
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"cancel", @"取消") style:UIAlertActionStyleCancel handler:nil]];
    // 自定义操作
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(actionTitle, @"自定义操作") style:UIAlertActionStyleDefault handler:handler]];
    
    [self presentViewController:alertController animated:YES completion:completion];
}

/// 多操作警告弹窗视图
/// @param title 弹窗标题
/// @param message 弹窗信息
/// @param actionTitles 弹窗操作标题数组
/// @param handler 弹窗操作处理 (根据序号分别处理)
/// @param completion 弹窗完成后处理
- (void)s_alertWithTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray<NSString *> *)actionTitles handler:(void (^)(UIAlertAction * _Nullable, NSUInteger))handler completion:(void (^)(void))completion {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message: message preferredStyle:UIAlertControllerStyleAlert];
    
    [actionTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 自定义操作
        [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(obj, obj) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (handler) {
                
                handler(action, idx);
            }
        }]];
    }];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

/// 带输入框的警告弹窗
/// @param title 弹窗标题
/// @param message 弹窗信息
/// @param inputHandler 输入处理
/// @param actionHandler 弹窗操作处理
/// @param completion 弹窗完成后处理
- (void)s_alertWithTitle:(NSString *)title message:(NSString *)message inputHandler:(void (^)(UITextField * _Nullable))inputHandler actionHandler:(void (^)(UIAlertAction * _Nullable, UIAlertController * _Nonnull))actionHandler completion:(void (^)(void))completion {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message: message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:inputHandler];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"cancel", @"取消") style:UIAlertActionStyleCancel handler:nil]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"ok", @"确定") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        actionHandler(action,alertController);
    }]];
    
    [self presentViewController:alertController animated:YES completion:completion];
}

@end
