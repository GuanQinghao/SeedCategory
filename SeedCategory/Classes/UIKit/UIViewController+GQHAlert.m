//
//  UIViewController+GQHAlert.m
//  Seed
//
//  Created by Mac on 2018/7/27.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "UIViewController+GQHAlert.h"


@implementation UIViewController (GQHAlert)

/**
 单操作警告弹窗视图 (确定操作)
 
 @param title 弹窗标题
 @param message 弹窗信息
 @param handler 弹窗操作处理
 @param completion 弹窗完成后处理
 */
- (void)qh_alertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler completion:(void (^ __nullable)(void))completion {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message: message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"ok", @"确定") style:UIAlertActionStyleDefault handler:handler]];
    
    [self presentViewController:alertController animated:YES completion:completion];
}

/**
 双操作警告弹窗视图 (自定义|取消)
 
 @param title 弹窗标题
 @param message 弹窗信息
 @param actionTitle 弹窗操作标题
 @param handler 弹窗操作处理
 @param completion 弹窗完成后处理
 */
- (void)qh_alertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message actionTitle:(NSString *_Nullable)actionTitle handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler completion:(void (^ __nullable)(void))completion {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message: message preferredStyle:UIAlertControllerStyleAlert];
    
    // 取消操作
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"cancel", @"取消") style:UIAlertActionStyleCancel handler:nil]];
    // 自定义操作
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(actionTitle, @"自定义操作") style:UIAlertActionStyleDefault handler:handler]];
    
    [self presentViewController:alertController animated:YES completion:completion];
}

/**
 多操作警告弹窗视图
 
 @param title 弹窗标题
 @param message 弹窗信息
 @param actionTitles 弹窗操作标题数组
 @param handler 弹窗操作处理 (根据序号分别处理)
 @param completion 弹窗完成后处理
 */
- (void)qh_alertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message actionTitles:(NSArray<NSString *> *_Nullable)actionTitles handler:(void (^ __nullable)(UIAlertAction * _Nullable action, NSUInteger index))handler completion:(void (^ __nullable)(void))completion {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message: message preferredStyle:UIAlertControllerStyleAlert];
    
    [actionTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 自定义操作
        [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(obj, obj) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            handler(action, idx);
        }]];
    }];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

/**
 带输入框的警告弹窗
 
 @param title 弹窗标题
 @param message 弹窗信息
 @param inputHandler 输入处理
 @param actionHandler 弹窗操作处理
 @param completion 弹窗完成后处理
 */
- (void)qh_alertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message inputHandler:(void (^ __nullable)(UITextField * _Nullable textField))inputHandler actionHandler:(void (^ __nullable)(UIAlertAction * _Nullable action, UIAlertController * _Nonnull alertController))actionHandler completion:(void (^ __nullable)(void))completion; {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message: message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:inputHandler];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"cancel", @"取消") style:UIAlertActionStyleCancel handler:nil]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"ok", @"确定") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        actionHandler(action,alertController);
    }]];
    
    [self presentViewController:alertController animated:YES completion:completion];
}

@end
