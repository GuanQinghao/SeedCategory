//
//  UIButton+SeedCategory.m
//  SeedCategory
//
//  Created by Hao on 2020/10/24.
//

#import "UIButton+SeedCategory.h"
#import <objc/message.h>


/// 默认响应点击事件
static BOOL canResponse = YES;

@implementation UIButton (SeedCategory)

/// 设置按钮图文排版样式
/// @param s_graphicLayoutStyle 按钮图文排版样式
- (void)setS_graphicLayoutStyle:(SeedButtonGraphicLayoutStyle)s_graphicLayoutStyle {
    
    NSNumber *style = [NSNumber numberWithUnsignedInteger:s_graphicLayoutStyle];
    objc_setAssociatedObject(self, @selector(s_graphicLayoutStyle), style, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 重布局按钮视图
    [self relayoutView];
}

/// 获取按钮图文排版样式
- (SeedButtonGraphicLayoutStyle)s_graphicLayoutStyle {
    
    NSNumber *style = objc_getAssociatedObject(self, _cmd);
    
    switch ([style integerValue]) {
            
        case 1:
            return SeedButtonGraphicLayoutStyleVerticalOpposite;
            break;
        case 2:
            return SeedButtonGraphicLayoutStyleHorizontalDefault;
            break;
        case 3:
            return SeedButtonGraphicLayoutStyleHorizontalOpposite;
            break;
        default:
            return SeedButtonGraphicLayoutStyleVerticalDefault;
            break;
    }
}

/// 设置按钮图文间距
/// @param s_graphicLayoutSpacing 按钮图文间距
- (void)setS_graphicLayoutSpacing:(float)s_graphicLayoutSpacing {
    
    NSNumber *spacing = [NSNumber numberWithFloat:s_graphicLayoutSpacing];
    objc_setAssociatedObject(self, @selector(s_graphicLayoutSpacing), spacing, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 重布局按钮视图
    [self relayoutView];
}

/// 获取按钮图文间距
- (float)s_graphicLayoutSpacing {
    
    NSNumber *spacing = objc_getAssociatedObject(self, _cmd);
    
    return [spacing floatValue];
}

/// 重布局按钮视图
- (void)relayoutView {
    
    // 按钮图片宽度
    CGFloat imageWidth = self.currentImage.size.width;
    // 按钮图片高度
    CGFloat imageHeight = self.currentImage.size.height;
    
    // 按钮文本大小
    CGSize textSize = [self.currentTitle sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    // 按钮文本宽度
    CGFloat labelWidth = textSize.width;
    // 按钮文本高度
    CGFloat labelHeight = textSize.height;
    
    // image中心移动的x距离
    CGFloat imageOffsetX = 0.5f * (imageWidth + labelWidth) - 0.5f * imageWidth;
    // image中心移动的y距离
    CGFloat imageOffsetY = 0.5f * (imageHeight + self.s_graphicLayoutSpacing);
    // label中心移动的x距离
    CGFloat labelOffsetX = (imageWidth + 0.5f * labelWidth) - 0.5f * (imageWidth + labelWidth);
    // label中心移动的y距离
    CGFloat labelOffsetY = 0.5f * (labelHeight + self.s_graphicLayoutSpacing);
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + self.s_graphicLayoutSpacing - tempHeight;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets contentEdgeInsets = UIEdgeInsetsZero;
    
    switch (self.s_graphicLayoutStyle) {
            
        case SeedButtonGraphicLayoutStyleVerticalDefault: {
            
            imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -0.5f * changedWidth, changedHeight - imageOffsetY, -0.5f * changedWidth);
        }
            break;
        case SeedButtonGraphicLayoutStyleVerticalOpposite: {
            
            imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(changedHeight - imageOffsetY, -0.5f * changedWidth, imageOffsetY, -0.5f * changedWidth);
        }
            break;
        case SeedButtonGraphicLayoutStyleHorizontalDefault: {
            
            imageEdgeInsets = UIEdgeInsetsMake(0, -0.5f * self.s_graphicLayoutSpacing, 0, 0.5f * self.s_graphicLayoutSpacing);
            titleEdgeInsets = UIEdgeInsetsMake(0, 0.5f * self.s_graphicLayoutSpacing, 0, -0.5f * self.s_graphicLayoutSpacing);
            contentEdgeInsets = UIEdgeInsetsMake(0, 0.5f * self.s_graphicLayoutSpacing, 0, 0.5f * self.s_graphicLayoutSpacing);
        }
            break;
        case SeedButtonGraphicLayoutStyleHorizontalOpposite: {
            
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + 0.5f * self.s_graphicLayoutSpacing, 0, -labelWidth - 0.5f * self.s_graphicLayoutSpacing);
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - 0.5f * self.s_graphicLayoutSpacing, 0, imageWidth + 0.5f * self.s_graphicLayoutSpacing);
            contentEdgeInsets = UIEdgeInsetsMake(0, 0.5f * self.s_graphicLayoutSpacing, 0, 0.5f * self.s_graphicLayoutSpacing);
        }
            break;
    }
    
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
    self.contentEdgeInsets = contentEdgeInsets;
}

#pragma mark - 按钮重复点击解决方案

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 按钮系统点击事件
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        
        // 按钮自定义点击事件
        SEL alterSelector = @selector(alternatelySendAction:to:forEvent:);
        Method alterMethod = class_getInstanceMethod(self, alterSelector);
        
        // 将自定义点击事件添加到系统方法中
        BOOL add = class_addMethod(self, originalSelector, method_getImplementation(alterMethod), method_getTypeEncoding(alterMethod));
        
        if (add) {
            
            // 自定义点击事件成功添加到系统方法中
            // 添加成功说明本类中不存在自定义方法, 所以必须将自定义方法的实现指针换成系统方法
            class_replaceMethod(self, alterSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            
            // 添加失败说明本类中有自定义方法的实现, 只需将系统方法和自定义方法的IMP指针互换一下
            method_exchangeImplementations(originalMethod, alterMethod);
        }
    });
}

- (void)alternatelySendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    // 默认按钮点击间隔0.15s
    self.s_intervalOnClick = (self.s_intervalOnClick < 0.15f) ? 0.15f : self.s_intervalOnClick;
    
    if (canResponse) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.s_intervalOnClick * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 响应点击事件
            canResponse = YES;
        });
        
        // 不响应点击事件
        canResponse = NO;
        
        // 自定义IMP和系统IMP已经互换了, 实际是执行系统IMP
        [self alternatelySendAction:action to:target forEvent:event];
    }
}

- (void)setS_intervalOnClick:(NSTimeInterval)s_intervalOnClick {
    
    NSNumber *interval = [NSNumber numberWithDouble:s_intervalOnClick];
    
    objc_setAssociatedObject(self, @selector(s_intervalOnClick), interval, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)s_intervalOnClick {
    
    NSNumber *interval = objc_getAssociatedObject(self, _cmd);
    
    return [interval doubleValue];
}

@end
