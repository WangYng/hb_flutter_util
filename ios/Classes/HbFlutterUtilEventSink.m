//
//  HbFlutterUtilEventSink.m
//  Pods
//
//  Created by 汪洋 on 2021/5/6.
//

#import "HbFlutterUtilEventSink.h"

@implementation HbFlutterUtilEventSink

- (FlutterError * _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    self.event = NULL;
    return nil;
}

- (FlutterError * _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(nonnull FlutterEventSink)events {
    self.event = events;
    return nil;
}

@end
