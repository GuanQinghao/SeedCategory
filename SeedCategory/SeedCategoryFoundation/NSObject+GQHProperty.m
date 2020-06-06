//
//  NSObject+GQHProperty.m
//  Xanthium
//
//  Created by GuanQinghao on 30/03/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "NSObject+GQHProperty.h"


@implementation NSObject (GQHProperty)

/// 控制台输出属性代码
/// @param dictionary 属性字典
+ (void)qh_outputPropertyCodeWithDictionary:(NSDictionary *)dictionary {
    
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        
        return ;
    }
    
    if ([dictionary count] <= 0) {
        
        return ;
    }
    
    NSMutableString *autoCode = [NSMutableString string];
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *property;
        
        //
        if ([obj isKindOfClass:[NSNumber class]]) {
            
            property = [NSString stringWithFormat:@"/**\n <#Description#>\n*/\n@property (nonatomic, strong) NSNumber *%@;", key];
        }
        //
        if ([obj isKindOfClass:[NSArray class]]) {
            
            property = [NSString stringWithFormat:@"/**\n <#Description#>\n*/\n@property (nonatomic, strong) NSArray *%@;", key];
        }
        //
        if ([obj isKindOfClass:[NSDictionary class]]) {
            
            property = [NSString stringWithFormat:@"/**\n <#Description#>\n*/\n@property (nonatomic, strong) NSDictionary *%@;", key];
        }
        //
        if ([obj isKindOfClass:[NSString class]]) {
            
            property = [NSString stringWithFormat:@"/**\n <#Description#>\n*/\n@property (nonatomic, copy) NSString *%@;", key];
        }
        //
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
            property = [NSString stringWithFormat:@"/**\n <#Description#>\n*/\n@property (nonatomic, assign) BOOL %@;", key];
        }
        
        if (property.length > 0) {
            
            [autoCode appendFormat:@"\n%@\n",property];
        }
    }];
    
#ifdef DEBUG
    NSLog(@"%@",autoCode);
#endif
    
}

@end
