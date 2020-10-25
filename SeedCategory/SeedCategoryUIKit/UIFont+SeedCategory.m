//
//  UIFont+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "UIFont+SeedCategory.h"
#import <objc/message.h>


@implementation UIFont (SeedCategory)

+ (void)load {
    
    // fontWithSize:
    [self exchange:@selector(fontWithSize:) with:@selector(s_fontWithSize:)];
    
    // fontWithName:size:
    [self exchange:@selector(fontWithName:size:) with:@selector(s_fontWithName:size:)];
    
    // systemFontOfSize:
    [self exchange:@selector(systemFontOfSize:) with:@selector(s_systemFontOfSize:)];
    
    // boldSystemFontOfSize:
    [self exchange:@selector(boldSystemFontOfSize:) with:@selector(s_boldSystemFontOfSize:)];
    
    // systemFontOfSize:weight:
    [self exchange:@selector(systemFontOfSize:weight:) with:@selector(s_systemFontOfSize:weight:)];
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
/// @param fontSize 字体大小
+ (UIFont *)s_fontWithSize:(CGFloat)fontSize {
    
    CGFloat scale = (3.0f == UIScreen.mainScreen.scale) ? 1.1f : 1.0f;
    return [UIFont s_fontWithSize:(fontSize * scale)];
}

/// 自定义字体方法
/// @param fontName 字体名称
/// @param fontSize 字体大小
+ (UIFont *)s_fontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    
    CGFloat scale = (3.0f == UIScreen.mainScreen.scale) ? 1.1f : 1.0f;
    return [UIFont s_fontWithName:fontName size:(fontSize * scale)];
}

/// 自定义字体方法
/// @param fontSize 字体大小
+ (UIFont *)s_systemFontOfSize:(CGFloat)fontSize {
    
    CGFloat scale = (3.0f == UIScreen.mainScreen.scale) ? 1.1f : 1.0f;
    return [UIFont s_systemFontOfSize:(fontSize * scale)];
}

/// 自定义字体方法
/// @param fontSize 字体大小
+ (UIFont *)s_boldSystemFontOfSize:(CGFloat)fontSize {
    
    CGFloat scale = (3.0f == UIScreen.mainScreen.scale) ? 1.1f : 1.0f;
    return [UIFont s_boldSystemFontOfSize:(fontSize * scale)];
}

/// 自定义字体方法
/// @param fontSize 字体大小
/// @param weight 字重
+ (UIFont *)s_systemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight {
    
    CGFloat scale = (3.0f == UIScreen.mainScreen.scale) ? 1.1f : 1.0f;
    return [UIFont s_systemFontOfSize:(fontSize * scale) weight:weight];
}

@end
