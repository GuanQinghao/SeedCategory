//
//  UITextView+GQHPlaceholder.m
//  Seed
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "UITextView+GQHPlaceholder.h"
#import <objc/message.h>


@implementation UITextView (GQHPlaceholder)

/**
 占位文字
 
 @param qh_placeholder 占位文字
 */
- (void)setQh_placeholder:(NSString *)qh_placeholder {
    
    objc_setAssociatedObject(self, @selector(qh_placeholder), qh_placeholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    
    if ((placeHolderLabel = [self valueForKey:@"_placeholderLabel"])) {
        
        // 存在Label
        placeHolderLabel.text = qh_placeholder;
        [placeHolderLabel sizeToFit];
    } else {
        
        // 不存在Label
        placeHolderLabel = [[UILabel alloc] init];
        placeHolderLabel.numberOfLines = 0;
        placeHolderLabel.font = self.font;
        placeHolderLabel.textColor = UIColor.lightGrayColor;
        placeHolderLabel.text = qh_placeholder;
        [placeHolderLabel sizeToFit];
        [self addSubview:placeHolderLabel];
        
        [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    }
}

/**
 占位文字
 
 @return 占位文字
 */
- (NSString *)qh_placeholder {
    
    return objc_getAssociatedObject(self, _cmd);
}

/**
 占位文字颜色
 
 @param qh_placeholderColor 占位文字颜色
 */
- (void)setQh_placeholderColor:(UIColor *)qh_placeholderColor {
    
    objc_setAssociatedObject(self, @selector(setQh_placeholderColor:), qh_placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    
    if ((placeHolderLabel = [self valueForKey:@"_placeholderLabel"])) {
        
        // 存在Label
        placeHolderLabel.textColor = qh_placeholderColor;
    } else {
        
        // 不存在Label
        placeHolderLabel = [[UILabel alloc] init];
        placeHolderLabel.numberOfLines = 0;
        placeHolderLabel.font = self.font;
        placeHolderLabel.textColor = qh_placeholderColor;
        [self addSubview:placeHolderLabel];
        [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    }
}

/**
 占位文字颜色
 
 @return 占位文字颜色
 */
- (UIColor *)qh_placeholderColor {
    
    return objc_getAssociatedObject(self, _cmd);
}

@end
