//
//  UITextView+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "UITextView+SeedCategory.h"
#import <objc/message.h>


@implementation UITextView (SeedCategory)

/// 占位文字
/// @param s_placeholder 占位文字
- (void)setS_placeholder:(NSString *)s_placeholder {
    
    objc_setAssociatedObject(self, @selector(s_placeholder), s_placeholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UILabel *placeHolderLabel = [self valueForKey:@"_placeholderLabel"];
    
    if (placeHolderLabel) {
        
        // 存在Label
        placeHolderLabel.text = s_placeholder;
        [placeHolderLabel sizeToFit];
    } else {
        
        // 不存在Label
        placeHolderLabel = [[UILabel alloc] init];
        placeHolderLabel.numberOfLines = 0;
        placeHolderLabel.font = self.font;
        placeHolderLabel.textColor = UIColor.lightGrayColor;
        placeHolderLabel.text = s_placeholder;
        [placeHolderLabel sizeToFit];
        [self addSubview:placeHolderLabel];
        
        [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    }
}

/// 占位文字
- (NSString *)s_placeholder {
    
    return objc_getAssociatedObject(self, _cmd);
}

/// 占位文字颜色
/// @param s_placeholderColor 占位文字颜色
- (void)setS_placeholderColor:(UIColor *)s_placeholderColor {
    
    objc_setAssociatedObject(self, @selector(s_placeholderColor), s_placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UILabel *placeHolderLabel = [self valueForKey:@"_placeholderLabel"];
    
    if (placeHolderLabel) {
        
        // 存在Label
        placeHolderLabel.textColor = s_placeholderColor;
    } else {
        
        // 不存在Label
        placeHolderLabel = [[UILabel alloc] init];
        placeHolderLabel.numberOfLines = 0;
        placeHolderLabel.font = self.font;
        placeHolderLabel.textColor = s_placeholderColor;
        [self addSubview:placeHolderLabel];
        [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    }
}

/// 占位文字颜色
- (UIColor *)s_placeholderColor {
    
    return objc_getAssociatedObject(self, _cmd);
}

@end
