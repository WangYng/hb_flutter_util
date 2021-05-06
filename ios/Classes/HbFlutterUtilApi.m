//
//  HbFlutterUtilApi.m
//  Pods
//
//  Created by 汪洋 on 2021/5/6.
//

#import "HbFlutterUtilApi.h"

@implementation HbFlutterUtilApi

+ (void)setup:(NSObject<FlutterBinaryMessenger> *)messenger api:(id<HbFlutterUtilApiDelegate>)api {
    {
        FlutterBasicMessageChannel *channel =[FlutterBasicMessageChannel messageChannelWithName:@"com.wangyng.hb_flutter_util.isWechatInstalled" binaryMessenger:messenger];
        
        if (api != nil) {
            [channel setMessageHandler:^(id  message, FlutterReply reply) {
                
                bool isInstalled = [api isWechatInstalled];
                
                NSMutableDictionary<NSString *, NSObject *> *wrapped = [NSMutableDictionary new];
                wrapped[@"result"] = @(isInstalled);
                reply(wrapped);
            }];
        } else {
            [channel setMessageHandler:nil];
        }
    }
}

@end
