//
//  UIDevice+GQHDevice.m
//  Seed
//
//  Created by GuanQinghao on 21/03/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "UIDevice+GQHDevice.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <sys/sysctl.h>
#import <sys/utsname.h>
#import <mach/mach.h>


@implementation UIDevice (GQHDevice)

/**
 运营商信息(单双卡)(名称-手机国际代号-手机网络代号)
 
 @return 运营商名称(单双卡)(名称-手机国际代号-手机网络代号)
 */
- (NSArray<NSString *> *)qh_carriers {
    
    // 运营商信息
    __block NSMutableArray *carriers = [NSMutableArray array];
    
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    
    NSMutableDictionary<NSString *, CTCarrier *> *providers = [NSMutableDictionary dictionary];
    
    if (@available(iOS 12, *)) {

        providers = [[networkInfo serviceSubscriberCellularProviders] mutableCopy];
    } else {
        
        CTCarrier *provider = [networkInfo subscriberCellularProvider];
        if (provider) {
            
            [providers setObject:provider forKey:@"0000000100000001"];
        }
    }
    
    [providers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, CTCarrier * _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *name = [obj carrierName];
        NSString *mcc = [obj mobileCountryCode];
        NSString *mnc = [obj mobileNetworkCode];
        [carriers addObject:[NSString stringWithFormat:@"%@-%@-%@",name,mcc,mnc]];
    }];
    
    return carriers;
}

/**
 手机磁盘总量(GB)
 
 @return 手机磁盘总量(GB)
 */
- (CGFloat)qh_diskTotalSize {
    
    CGFloat size = 0.0f;
    NSError *error;
    NSDictionary *dictionary = [NSFileManager.defaultManager attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    
    if (error) {
        
        NSLog(@"error: %@", error.localizedDescription);
    } else {
        
        NSNumber *number = [dictionary objectForKey:NSFileSystemSize];
        size = [number doubleValue]/1000.0f/1000.0f/1000.0f;
    }
    
    return size;
}

/**
 手机可用磁盘容量(GB)
 
 @return 手机可用磁盘容量(GB)
 */
- (CGFloat)qh_diskFreeSize {
    
    CGFloat size = 0.0f;
    NSError *error;
    NSDictionary *dictionary = [NSFileManager.defaultManager attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    
    if (error) {
        
        NSLog(@"error: %@", error.localizedDescription);
    } else {
        
        NSNumber *number = [dictionary objectForKey:NSFileSystemFreeSize];
        size = [number doubleValue]/1000.0f/1000.0f/1000.0f;
    }
    
    return size;
}

/**
 手机可用内存容量(MB)
 
 @return 手机可用内存容量(MB)
 */
- (CGFloat)qh_memoryFreeSize {
    
    vm_statistics_data_t vmStatus;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t) & vmStatus, &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        
        return NSNotFound;
    }
    
    return (vm_page_size * vmStatus.free_count) / 1000.0f / 1000.0f;
}

/**
 设备类型
 
 @return 设备类型
 */
- (GQHDeviceType)qh_deviceType {
    
    GQHDeviceModel model = [UIDevice.currentDevice qh_deviceModel];
    
    if (unknownModel < model && model < iPhone_2G) {
        
        return simulator;
    } else if (iPhone_2G <= model && model < iPod_Touch_1G) {
        
        return iPhone;
    } else if (iPod_Touch_1G <= model && model < iPad_1) {
        
        return iPod;
    } else if (iPad_1 <= model && model < Apple_Watch_38MM) {
        
        return iPad;
    } else if (Apple_Watch_38MM <= model) {
        
        return AppleWatch;
    }
    
    return unknownType;
}

/**
 设备机型
 
 @return 设备机型
 */
- (GQHDeviceModel)qh_deviceModel {
    
    struct utsname info;
    uname(&info);
    
    NSString *machine = [NSString stringWithCString:info.machine encoding:NSUTF8StringEncoding];
    
    // simulator
    if ([machine isEqualToString:@"i386"]) {
        
        return i386Simulator;
    } else if ([machine isEqualToString:@"x86_64"]) {
        
        return x86_64Simulator;
    }
    
    // iPhone
    if ([machine isEqualToString:@"iPhone1,1"]) {
        
        return iPhone_2G;
    } else if ([machine isEqualToString:@"iPhone1,2"]) {
        
        return iPhone_3G;
    } else if ([machine isEqualToString:@"iPhone2,1"]) {
        
        return iPhone_3GS;
    } else if ([machine isEqualToString:@"iPhone3,1"]) {
        
        return iPhone_4_GSM;
    } else if ([machine isEqualToString:@"iPhone3,2"]) {
        
        return iPhone_4_GSM_Verizon;
    } else if ([machine isEqualToString:@"iPhone3,3"]) {
        
        return iPhone_4_CDMA;
    } else if ([machine isEqualToString:@"iPhone4,1"]) {
        
        return iPhone_4S;
    } else if ([machine isEqualToString:@"iPhone5,1"]) {
        
        return iPhone_5_GSM;
    } else if ([machine isEqualToString:@"iPhone5,2"]) {
        
        return iPhone_5_Global;
    } else if ([machine isEqualToString:@"iPhone5,3"]) {
        
        return iPhone_5c_GSM;
    } else if ([machine isEqualToString:@"iPhone5,4"]) {
        
        return iPhone_5c_Global;
    } else if ([machine isEqualToString:@"iPhone6,1"]) {
        
        return iPhone_5s_GSM;
    } else if ([machine isEqualToString:@"iPhone6,2"]) {
        
        return iPhone_5s_Global;
    } else if ([machine isEqualToString:@"iPhone7,1"]) {
        
        return iPhone_6_Plus;
    } else if ([machine isEqualToString:@"iPhone7,2"]) {
        
        return iPhone_6;
    } else if ([machine isEqualToString:@"iPhone8,1"]) {
        
        return iPhone_6s;
    } else if ([machine isEqualToString:@"iPhone8,2"]) {
        
        return iPhone_6s_Plus;
    } else if ([machine isEqualToString:@"iPhone8,3"]) {
        
        return iPhone_SE_GSM;
    } else if ([machine isEqualToString:@"iPhone8,4"]) {
        
        return iPhone_SE_Global;
    } else if ([machine isEqualToString:@"iPhone9,1"]) {
        
        return iPhone_7_Global;
    } else if ([machine isEqualToString:@"iPhone9,2"]) {
        
        return iPhone_7_Plus_Global;
    } else if ([machine isEqualToString:@"iPhone9,3"]) {
        
        return iPhone_7_GSM;
    } else if ([machine isEqualToString:@"iPhone9,4"]) {
        
        return iPhone_7_Plus_GSM;
    } else if ([machine isEqualToString:@"iPhone10,1"]) {
        
        return iPhone_8_Global;
    } else if ([machine isEqualToString:@"iPhone10,2"]) {
        
        return iPhone_8_Plus_Global;
    } else if ([machine isEqualToString:@"iPhone10,3"]) {
        
        return iPhone_X_Global;
    } else if ([machine isEqualToString:@"iPhone10,4"]) {
        
        return iPhone_8_GSM;
    } else if ([machine isEqualToString:@"iPhone10,5"]) {
        
        return iPhone_8_Plus_GSM;
    } else if ([machine isEqualToString:@"iPhone10,6"]) {
        
        return iPhone_X_GSM;
    } else if ([machine isEqualToString:@"iPhone11,2"]) {
        
        return iPhone_XS;
    } else if ([machine isEqualToString:@"iPhone11,4"]) {
        
        return iPhone_XS_Max;
    } else if ([machine isEqualToString:@"iPhone11,6"]) {
        
        return iPhone_XS_Max_China;
    } else if ([machine isEqualToString:@"iPhone11,8"]) {
        
        return iPhone_XR;
    } else if ([machine isEqualToString:@"iPhone12,1"]) {
        
        return iPhone_11;
    } else if ([machine isEqualToString:@"iPhone12,3"]) {
        
        return iPhone_11_Pro;
    } else if ([machine isEqualToString:@"iPhone12,5"]) {
        
        return iPhone_11_Pro_Max;
    }
    
    // iPod
    if ([machine isEqualToString:@"iPod1,1"]) {
        
        return iPod_Touch_1G;
    } else if ([machine isEqualToString:@"iPod2,1"]) {
        
        return iPod_Touch_2G;
    } else if ([machine isEqualToString:@"iPod3,1"]) {
        
        return iPod_Touch_3;
    } else if ([machine isEqualToString:@"iPod4,1"]) {
        
        return iPod_Touch_4;
    } else if ([machine isEqualToString:@"iPod5,1"]) {
        
        return iPod_Touch_5;
    } else if ([machine isEqualToString:@"iPod7,1"]) {
        
        return iPod_Touch_6;
    } else if ([machine isEqualToString:@"iPod9,1"]) {
        
        return iPod_Touch_7;
    }
    
    // iPad
    if ([machine isEqualToString:@"iPad1,1"]) {
        
        return iPad_1;
    } else if ([machine isEqualToString:@"iPad1,2"]) {
        
        return iPad_3G;
    } else if ([machine isEqualToString:@"iPad2,1"]) {
        
        return iPad_2_WiFi;
    } else if ([machine isEqualToString:@"iPad2,2"]) {
        
        return iPad_2_GSM;
    } else if ([machine isEqualToString:@"iPad2,3"]) {
        
        return iPad_2_CDMA;
    } else if ([machine isEqualToString:@"iPad2,4"]) {
        
        return iPad_2_Mid2012;
    } else if ([machine isEqualToString:@"iPad2,5"]) {
        
        return iPad_Mini_WiFi;
    } else if ([machine isEqualToString:@"iPad2,6"]) {
        
        return iPad_Mini_GSM;
    } else if ([machine isEqualToString:@"iPad2,7"]) {
        
        return iPad_Mini_Global;
    } else if ([machine isEqualToString:@"iPad3,1"]) {
        
        return iPad_3_WiFi;
    } else if ([machine isEqualToString:@"iPad3,2"]) {
        
        return iPad_3_CDMA;
    } else if ([machine isEqualToString:@"iPad3,3"]) {
        
        return iPad_3_GSM;
    } else if ([machine isEqualToString:@"iPad3,4"]) {
        
        return iPad_4_WiFi;
    } else if ([machine isEqualToString:@"iPad3,5"]) {
        
        return iPad_4_GSM;
    } else if ([machine isEqualToString:@"iPad3,6"]) {
        
        return iPad_4_Global;
    } else if ([machine isEqualToString:@"iPad4,1"]) {
        
        return iPad_Air_WiFi;
    } else if ([machine isEqualToString:@"iPad4,2"]) {
        
        return iPad_Air_Cellular;
    } else if ([machine isEqualToString:@"iPad4,3"]) {
        
        return iPad_Air_China;
    } else if ([machine isEqualToString:@"iPad4,4"]) {
        
        return iPad_Mini_2_WiFi;
    } else if ([machine isEqualToString:@"iPad4,5"]) {
        
        return iPad_Mini_2_Cellular;
    } else if ([machine isEqualToString:@"iPad4,6"]) {
        
        return iPad_Mini_2_China;
    } else if ([machine isEqualToString:@"iPad4,7"]) {
        
        return iPad_Mini_3_WiFi;
    } else if ([machine isEqualToString:@"iPad4,8"]) {
        
        return iPad_Mini_3_Cellular;
    } else if ([machine isEqualToString:@"iPad4,9"]) {
        
        return iPad_Mini_3_China;
    } else if ([machine isEqualToString:@"iPad5,1"]) {
        
        return iPad_Mini_4_WiFi;
    } else if ([machine isEqualToString:@"iPad5,2"]) {
        
        return iPad_Mini_4_Cellular;
    } else if ([machine isEqualToString:@"iPad5,3"]) {
        
        return iPad_Air_2_WiFi;
    } else if ([machine isEqualToString:@"iPad5,4"]) {
        
        return iPad_Air_2_Cellular;
    } else if ([machine isEqualToString:@"iPad6,3"]) {
        
        return iPad_Pro_97_WiFi;
    } else if ([machine isEqualToString:@"iPad6,4"]) {
        
        return iPad_Pro_97_Cellular;
    } else if ([machine isEqualToString:@"iPad6,7"]) {
        
        return iPad_Pro_WiFi;
    } else if ([machine isEqualToString:@"iPad6,8"]) {
        
        return iPad_Pro_Cellular;
    } else if ([machine isEqualToString:@"iPad6,11"]) {
        
        return iPad_5_WiFi;
    } else if ([machine isEqualToString:@"iPad6,12"]) {
        
        return iPad_5_Cellular;
    } else if ([machine isEqualToString:@"iPad7,1"]) {
        
        return iPad_Pro_2_129_WiFi;
    } else if ([machine isEqualToString:@"iPad7,2"]) {
        
        return iPad_Pro_2_129_Cellular;
    } else if ([machine isEqualToString:@"iPad7,3"]) {
        
        return iPad_Pro_105_WiFi;
    } else if ([machine isEqualToString:@"iPad7,4"]) {
        
        return iPad_Pro_105_Cellular;
    } else if ([machine isEqualToString:@"iPad7,5"]) {
        
        return iPad_6_WiFi;
    } else if ([machine isEqualToString:@"iPad7,6"]) {
        
        return iPad_6_Cellular;
    } else if ([machine isEqualToString:@"iPad8,1"]) {
        
        // 64GB 256GB 512GB
        return iPad_Pro_11_WiFi;
    } else if ([machine isEqualToString:@"iPad8,2"]) {
        
        // 1TB
        return iPad_Pro_11_WiFi;
    } else if ([machine isEqualToString:@"iPad8,3"]) {
        
        // 64GB 256GB 512GB
        return iPad_Pro_11_Cellular;
    } else if ([machine isEqualToString:@"iPad8,4"]) {
        
        // 1TB
        return iPad_Pro_11_Cellular;
    } else if ([machine isEqualToString:@"iPad8,5"]) {
        
        // 64GB 256GB 512GB
        return iPad_Pro_3_129_WiFi;
    } else if ([machine isEqualToString:@"iPad8,6"]) {
        
        // 1TB
        return iPad_Pro_3_129_WiFi;
    } else if ([machine isEqualToString:@"iPad8,7"]) {
        
        // 64GB 256GB 512GB
        return iPad_Pro_3_129_Cellular;
    } else if ([machine isEqualToString:@"iPad8,8"]) {
        
        // 1TB
        return iPad_Pro_3_129_Cellular;
    } else if ([machine isEqualToString:@"iPad11,1"]) {
        
        return iPad_Mini_5_WiFi;
    } else if ([machine isEqualToString:@"iPad11,2"]) {
        
        return iPad_Mini_5_Cellular;
    } else if ([machine isEqualToString:@"iPad11,3"]) {
        
        return iPad_Air_3_WiFi;
    } else if ([machine isEqualToString:@"iPad11,4"]) {
        
        return iPad_Air_3_Cellular;
    }
    
    // Apple Watch
    if ([machine isEqualToString:@"Watch1,1"]) {
        
        return Apple_Watch_38MM;
    } else if ([machine isEqualToString:@"Watch1,2"]) {
        
        return Apple_Watch_42MM;
    } else if ([machine isEqualToString:@"Watch2,3"]) {
        
        return Apple_Watch_2_38MM;
    } else if ([machine isEqualToString:@"Watch2,4"]) {
        
        return Apple_Watch_2_42MM;
    } else if ([machine isEqualToString:@"Watch2,6"]) {
        
        return Apple_Watch_1_38MM;
    } else if ([machine isEqualToString:@"Watch2,7"]) {
        
        return Apple_Watch_1_42MM;
    } else if ([machine isEqualToString:@"Watch3,1"]) {
        
        return Apple_Watch_3_38MM_LTE;
    } else if ([machine isEqualToString:@"Watch3,2"]) {
        
        return Apple_Watch_3_42MM_LTE;
    } else if ([machine isEqualToString:@"Watch3,3"]) {
        
        return Apple_Watch_3_38MM;
    } else if ([machine isEqualToString:@"Watch3,4"]) {
        
        return Apple_Watch_3_42MM;
    } else if ([machine isEqualToString:@"Watch4,1"]) {
        
        return Apple_Watch_4_40MM;
    } else if ([machine isEqualToString:@"Watch4,2"]) {
        
        return Apple_Watch_4_44MM;
    } else if ([machine isEqualToString:@"Watch4,3"]) {
        
        return Apple_Watch_4_40MM_LTE;
    } else if ([machine isEqualToString:@"Watch4,4"]) {
        
        return Apple_Watch_4_44MM_LTE;
    }
    
    return unknownModel;
}

@end
