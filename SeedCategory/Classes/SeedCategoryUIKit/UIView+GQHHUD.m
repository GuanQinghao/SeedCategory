//
//  UIView+GQHHUD.m
//  Seed
//
//  Created by Mac on 2018/10/16.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "UIView+GQHHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>


@implementation UIView (GQHHUD)

#pragma mark --HUD
+ (instancetype)sharedHUD {
    
    static MBProgressHUD *HUD = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        HUD = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
        HUD.removeFromSuperViewOnHide = YES;
    });
    
    return HUD;
}

- (void)showHUD {
    
    [self showHUDWithText:@""];
}

- (void)showHUDWithText:(NSString *)text {
    
    MBProgressHUD *HUD = [[self class] sharedHUD];
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.label.text = text;
    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    [HUD showAnimated:YES];
}

- (void)hideHUD {
    
    [[[self class] sharedHUD] hideAnimated:YES];
}

#pragma mark --toast
+ (instancetype)shareToast {
    
    static MBProgressHUD *toast = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        toast = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
        toast.removeFromSuperViewOnHide = YES;
    });
    
    return toast;
}

- (void)showToastWithText:(NSString *)text {
    
    CGPoint offset = CGPointMake(0.0f, 0.5f * CGRectGetHeight([UIScreen mainScreen].bounds));
    
    [self showToastWithText:text offset:offset];
}

- (void)showToastWithText:(NSString *)text offset:(CGPoint)offset {
    
    if (text && text.length > 0) {
        
        MBProgressHUD *toast = [[self class] shareToast];
        toast.mode = MBProgressHUDModeText;
        toast.label.text = text;
        toast.offset = offset;
        [[UIApplication sharedApplication].keyWindow addSubview:toast];
        [toast showAnimated:YES];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self hideToast];
        });
    }
}

- (void)showToastWithText:(NSString *)text afterDelay:(NSTimeInterval)timeInterval {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self showToastWithText:text];
    });
}

- (void)hideToast {
    
    [[[self class] shareToast] hideAnimated:YES];
}

@end


@implementation UIViewController (GQHHUD)

- (void)showHUD {
    
    [self.view showHUD];
}

- (void)showHUDWithText:(NSString *)text {
    
    [self.view showHUDWithText:text];
}

- (void)hideHUD {
    
    [self.view hideHUD];
}

- (void)showToastWithText:(NSString *)toastString {
    
    [self.view showToastWithText:toastString];
}

- (void)showToastWithText:(NSString *)toastString offset:(CGPoint)offset {
    
    [self.view showToastWithText:toastString offset:offset];
}

- (void)showToastWithText:(NSString *)toastString afterDelay:(NSTimeInterval)timeInterval {
    
    [self.view showToastWithText:toastString afterDelay:timeInterval];
}

@end
