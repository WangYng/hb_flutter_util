#import "HbFlutterUtilPlugin.h"

@implementation HbFlutterUtilPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    HbFlutterUtilPlugin* instance = [[HbFlutterUtilPlugin alloc] init];
    [HbFlutterUtilApi setup:[registrar messenger] api:instance];
}

- (bool)isWechatInstalled {
    bool result = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"wechat://"]] || [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"wexin://"]];
    NSLog(@"%d", result);
    return result;
}

@end
