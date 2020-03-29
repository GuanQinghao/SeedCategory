//
//  UIViewController+GQHAlert.h
//  Seed
//
//  Created by Mac on 2018/7/27.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (GQHAlert)

/**
 单操作警告弹窗视图 (确定操作)
 
 @param title 弹窗标题
 @param message 弹窗信息
 @param handler 弹窗操作处理
 @param completion 弹窗完成后处理
 */
- (void)qh_alertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler completion:(void (^ __nullable)(void))completion;

/**
 双操作警告弹窗视图 (自定义|取消)
 
 @param title 弹窗标题
 @param message 弹窗信息
 @param actionTitle 弹窗操作标题
 @param handler 弹窗操作处理
 @param completion 弹窗完成后处理
 */
- (void)qh_alertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message actionTitle:(NSString *_Nullable)actionTitle handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler completion:(void (^ __nullable)(void))completion;

/**
 多操作警告弹窗视图
 
 @param title 弹窗标题
 @param message 弹窗信息
 @param actionTitles 弹窗操作标题数组
 @param handler 弹窗操作处理 (根据序号分别处理)
 @param completion 弹窗完成后处理
 */
- (void)qh_alertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message actionTitles:(NSArray<NSString *> *_Nullable)actionTitles handler:(void (^ __nullable)(UIAlertAction * _Nullable action, NSUInteger index))handler completion:(void (^ __nullable)(void))completion;

/**
 带输入框的警告弹窗
 
 @param title 弹窗标题
 @param message 弹窗信息
 @param inputHandler 输入处理
 @param actionHandler 弹窗操作处理
 @param completion 弹窗完成后处理
 */
- (void)qh_alertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message inputHandler:(void (^ __nullable)(UITextField * _Nullable textField))inputHandler actionHandler:(void (^ __nullable)(UIAlertAction * _Nullable action, UIAlertController * _Nonnull alertController))actionHandler completion:(void (^ __nullable)(void))completion;

@end
