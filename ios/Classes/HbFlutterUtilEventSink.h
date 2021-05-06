//
//  HbFlutterUtilEventSink.h
//  Pods
//
//  Created by 汪洋 on 2021/5/6.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

@interface HbFlutterUtilEventSink : NSObject <FlutterStreamHandler>

@property (nonatomic, copy) FlutterEventSink event;

@end
