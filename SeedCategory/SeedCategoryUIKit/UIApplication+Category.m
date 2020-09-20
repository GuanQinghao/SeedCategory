//
//  UIApplication+Category.m
//  Expecta
//
//  Created by GuanQinghao on 2020/9/20.
//

#import "UIApplication+Category.h"

@implementation UIApplication (Category)

/// documents位置
- (NSURL *)qh_documentsURL {
    
    return [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].lastObject;
}

/// documents路径
- (NSString *)qh_documentsPath {
    
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

/// caches位置
- (NSURL *)qh_cachesURL {
    
    return [NSFileManager.defaultManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask].lastObject;
}

/// caches路径
- (NSString *)qh_cachesPath {
    
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}

/// library位置
- (NSURL *)qh_libraryURL {
    
    return [NSFileManager.defaultManager URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask].lastObject;
}

/// library路径
- (NSString *)qh_libraryPath {
    
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
}

/// 应用程序版本号
- (NSString *)qh_applicationShortVersion{
    
    return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

/// 应用程序构建版本号
- (NSString *)qh_applicationBuildVersion {
    
    return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleVersion"];
}

/// 应用程序名称
- (NSString *)qh_applicationDisplayName {
    
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

/// 应用程序唯一编号
- (NSString *)qh_applicationBundleID {
    
    return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleIdentifier"];
}


/// 拨打电话(弹出框提示) (使用前检查类型，非iPhone不能拨打电话)
/// @param mobile 手机号
/// @param handler 回调处理
- (void)qh_dialWithMobile:(NSString *)mobile handler:(void (^)(BOOL))handler {
    
    // telprompt 可以上架
    NSString *URLString = [NSString stringWithFormat:@"telprompt:%@",mobile];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URLString] options:@{ } completionHandler:^(BOOL success) {
        
        // 拨打电话完成后处理
        if (handler) {
            
            handler(success);
        }
    }];
}

/// 发信息 (使用前检查类型，非iPhone不能发送信息)
/// @param mobile 手机号
/// @param handler 回调处理
- (void)qh_smsWithMobile:(NSString *)mobile handler:(void (^)(BOOL))handler {
    
    NSString *URLString = [NSString stringWithFormat:@"sms:%@",mobile];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URLString] options:@{ } completionHandler:^(BOOL success) {
        
        // 完成后处理
        if (handler) {
            
            handler(success);
        }
    }];
}

/// 发送邮件 (使用前检查网络、地址规则和本机邮箱地址设置)
/// @param email 邮箱地址
/// @param handler 回调处理
- (void)qh_mailWithEmail:(NSString *)email handler:(void (^)(BOOL))handler {
    
    NSString *URLString = [NSString stringWithFormat:@"mailto:%@",email];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URLString] options:@{ } completionHandler:^(BOOL success) {
        
        // 完成后处理
        if (handler) {
            
            handler(success);
        }
    }];
}

/// 在iTunes中打开app (使用前检查网络)
/// @param appID 商店中的应用程序appID
/// @param handler 回调处理
- (void)qh_iTunesAppWithAppID:(NSString *)appID handler:(void (^)(BOOL))handler {
    
    NSString *URLString = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8",appID];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URLString] options:@{ } completionHandler:^(BOOL success) {
        
        // 完成后处理
        if (handler) {
            
            handler(success);
        }
    }];
}

@end
