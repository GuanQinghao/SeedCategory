//
//  UITextView+SeedCategory.h
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UITextView (SeedCategory)

/// 占位文字
@property (nonatomic, strong) IBInspectable NSString *s_placeholder;

/// 占位文字颜色
@property (nonatomic, strong) IBInspectable UIColor *s_placeholderColor;

@end

NS_ASSUME_NONNULL_END
