//
//  HbFlutterUtilApi.h
//  Pods
//
//  Created by 汪洋 on 2021/5/6.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import "HbFlutterUtilEventSink.h"

@protocol HbFlutterUtilApiDelegate <NSObject>

// 是否安装了微信
- (bool)isWechatInstalled;

@end

@interface HbFlutterUtilApi : NSObject

+ (void)setup:(NSObject<FlutterBinaryMessenger> *)messenger api:(id<HbFlutterUtilApiDelegate>)api;

@end
