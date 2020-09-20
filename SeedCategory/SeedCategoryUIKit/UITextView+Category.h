//
//  UITextView+Category.h
//  Expecta
//
//  Created by GuanQinghao on 2020/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (Category)

/// 占位文字
@property (nonatomic, strong) IBInspectable NSString *qh_placeholder;

/// 占位文字颜色
@property (nonatomic, strong) IBInspectable UIColor *qh_placeholderColor;

@end

NS_ASSUME_NONNULL_END
