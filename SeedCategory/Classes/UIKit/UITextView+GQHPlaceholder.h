//
//  UITextView+GQHPlaceholder.h
//  Seed
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITextView (GQHPlaceholder)

/**
 占位文字
 */
@property (nonatomic, strong) IBInspectable NSString *qh_placeholder;

/**
 占位文字颜色
 */
@property (nonatomic, strong) IBInspectable UIColor *qh_placeholderColor;

@end
