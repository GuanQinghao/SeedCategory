//
//  UIDevice+GQHDevice.h
//  Seed
//
//  Created by GuanQinghao on 21/03/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 设备机型
 */
typedef NS_ENUM(NSUInteger, GQHDeviceModel) {
    
    unknownModel = 0,
    
    i386Simulator,
    x86_64Simulator,
    
    // iPhone设备
    iPhone_2G = 1000,
    iPhone_3G,
    iPhone_3GS,
    iPhone_4_GSM,
    iPhone_4_GSM_Verizon,
    iPhone_4_CDMA,
    iPhone_4S,
    iPhone_5_GSM,
    iPhone_5_Global,
    iPhone_5c_GSM,
    iPhone_5c_Global,
    iPhone_5s_GSM,
    iPhone_5s_Global,
    iPhone_6_Plus,
    iPhone_6,
    iPhone_6s,
    iPhone_6s_Plus,
    iPhone_SE_GSM,//
    iPhone_SE_Global,//
    iPhone_7_Global,
    iPhone_7_Plus_Global,
    iPhone_7_GSM,
    iPhone_7_Plus_GSM,
    iPhone_8_Global,
    iPhone_8_Plus_Global,
    iPhone_X_Global,
    iPhone_8_GSM,
    iPhone_8_Plus_GSM,
    iPhone_X_GSM,
    iPhone_XS,
    iPhone_XS_Max,
    iPhone_XS_Max_China,
    iPhone_XR,
    iPhone_11,
    iPhone_11_Pro,
    iPhone_11_Pro_Max,
//TODO:2019
    
    // iPod设备
    iPod_Touch_1G = 2000,
    iPod_Touch_2G,
    iPod_Touch_3,
    iPod_Touch_4,
    iPod_Touch_5,
    iPod_Touch_6,
    iPod_Touch_7,
//TODO:2018
    
    // iPad设备
    iPad_1 = 3000,
    iPad_3G,
    iPad_2_WiFi,
    iPad_2_GSM,
    iPad_2_CDMA,
    iPad_2_Mid2012,
    iPad_Mini_WiFi,
    iPad_Mini_GSM,
    iPad_Mini_Global,
    iPad_3_WiFi,
    iPad_3_CDMA,
    iPad_3_GSM,
    iPad_4_WiFi,
    iPad_4_GSM,
    iPad_4_Global,
    iPad_Air_WiFi,
    iPad_Air_Cellular,
    iPad_Air_China,
    iPad_Mini_2_WiFi,
    iPad_Mini_2_Cellular,
    iPad_Mini_2_China,
    iPad_Mini_3_WiFi,
    iPad_Mini_3_Cellular,
    iPad_Mini_3_China,
    iPad_Mini_4_WiFi,
    iPad_Mini_4_Cellular,
    iPad_Air_2_WiFi,
    iPad_Air_2_Cellular,
    iPad_Pro_97_WiFi,
    iPad_Pro_97_Cellular,
    iPad_Pro_WiFi,
    iPad_Pro_Cellular,
    iPad_5_WiFi,
    iPad_5_Cellular,
    iPad_Pro_2_129_WiFi,
    iPad_Pro_2_129_Cellular,
    iPad_Pro_105_WiFi,
    iPad_Pro_105_Cellular,
    iPad_6_WiFi,
    iPad_6_Cellular,
    iPad_Pro_11_WiFi,
    iPad_Pro_11_Cellular,
    iPad_Pro_3_129_WiFi,
    iPad_Pro_3_129_Cellular,
    iPad_Mini_5_WiFi,
    iPad_Mini_5_Cellular,
    iPad_Air_3_WiFi,
    iPad_Air_3_Cellular,
//TODO:2018
    
    // Apple Watch设备
    Apple_Watch_38MM = 4000,
    Apple_Watch_42MM,
    Apple_Watch_2_38MM,
    Apple_Watch_2_42MM,
    Apple_Watch_1_38MM,
    Apple_Watch_1_42MM,
    Apple_Watch_3_38MM_LTE,
    Apple_Watch_3_42MM_LTE,
    Apple_Watch_3_38MM,
    Apple_Watch_3_42MM,
    Apple_Watch_4_40MM,
    Apple_Watch_4_44MM,
    Apple_Watch_4_40MM_LTE,
    Apple_Watch_4_44MM_LTE,
//TODO:2018
};


/**
 设备类型
 */
typedef NS_ENUM(NSUInteger, GQHDeviceType) {
    
    unknownType,
    simulator,
    iPhone,
    iPad,
    iPod,
    AppleWatch,
};


NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (GQHDevice)

/**
 运营商信息(单双卡)(名称-手机国际代号-手机网络代号)
 */
@property (nonatomic, readonly, copy) NSArray<NSString *> *qh_carriers;

/**
 运营商信息(单双卡)(名称-手机国际代号-手机网络代号)
 
 @return 运营商名称(单双卡)(名称-手机国际代号-手机网络代号)
 */
- (NSArray<NSString *> *)qh_carriers;

/**
 手机磁盘总量(GB)
 */
@property (nonatomic, readonly, assign) CGFloat qh_diskTotalSize;

/**
 手机磁盘总量(GB)
 
 @return 手机磁盘总量(GB)
 */
- (CGFloat)qh_diskTotalSize;

/**
 手机可用磁盘容量(GB)
 */
@property (nonatomic,readonly, assign) CGFloat qh_diskFreeSize;

/**
 手机可用磁盘容量(GB)
 
 @return 手机可用磁盘容量(GB)
 */
- (CGFloat)qh_diskFreeSize;

/**
 手机可用内存容量(MB)
 */
@property (nonatomic,readonly, assign) CGFloat qh_memoryFreeSize;

/**
 手机可用内存容量(MB)
 
 @return 手机可用内存容量(MB)
 */
- (CGFloat)qh_memoryFreeSize;

/**
 设备类型
 
 @return 设备类型
 */
- (GQHDeviceType)qh_deviceType;

/**
 设备机型
 
 @return 设备机型
 */
- (GQHDeviceModel)qh_deviceModel;

@end

NS_ASSUME_NONNULL_END
