//
//  UIFont+GQHFont.m
//  Seed
//
//  Created by GuanQinghao on 21/03/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "UIFont+GQHFont.h"
#import <objc/message.h>


@implementation UIFont (GQHFont)

+ (void)load {
    
    // fontWithName:size:
    [self exchange:@selector(fontWithName:size:) with:@selector(qh_fontWithName:size:)];
    
    // systemFontOfSize:
    [self exchange:@selector(systemFontOfSize:) with:@selector(qh_systemFontOfSize:)];
}

/// 交换系统方法
/// @param system 系统方法
/// @param custom 自定义方法
+ (void)exchange:(SEL)system with:(SEL)custom {
    
    // 获取自定义类方法
    Method customMethod = class_getClassMethod([self class], custom);
    // 获取系统的类方法
    Method systemMethod = class_getClassMethod([self class], system);
    // 交换方法
    method_exchangeImplementations(customMethod, systemMethod);
}

/// 自定义字体方法
/// @param fontName 字体名称
/// @param fontSize 字体大小
+ (UIFont *)qh_fontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    
    CGFloat scale = (3.0f == UIScreen.mainScreen.scale) ? 1.1f : 1.0f;
    return [UIFont qh_fontWithName:fontName size:(fontSize * scale)];
}

/// 自定义字体方法
/// @param fontSize 字体大小
+ (UIFont *)qh_systemFontOfSize:(CGFloat)fontSize {
    
    CGFloat scale = (3.0f == UIScreen.mainScreen.scale) ? 1.1f : 1.0f;
    return [UIFont qh_systemFontOfSize:(fontSize * scale)];
}

@end
