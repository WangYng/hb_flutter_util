package com.wangyng.hb_flutter_util;

import android.content.Context;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;

public interface HbFlutterUtilApi {

    // 初始化
    boolean isWechatInstalled(Context context);

    static void setup(Context context, BinaryMessenger binaryMessenger, HbFlutterUtilApi api) {
        { // init
            BasicMessageChannel<Object> channel = new BasicMessageChannel<>(binaryMessenger, "com.wangyng.hb_flutter_util.isWechatInstalled", new StandardMessageCodec());
            if (api != null) {
                channel.setMessageHandler((message, reply) -> {
                    Map<String, Object> wrapped = new HashMap<>();
                    try {
                        boolean isInstalled = api.isWechatInstalled(context);

                        wrapped.put("result", isInstalled);
                    } catch (Exception exception) {
                        wrapped.put("error", wrapError(exception));
                    }
                    reply.reply(wrapped);
                });
            } else {
                channel.setMessageHandler(null);
            }
        }
    }

    static HashMap<String, Object> wrapError(Exception exception) {
        HashMap<String, Object> errorMap = new HashMap<>();
        errorMap.put("message", exception.toString());
        errorMap.put("code", null);
        errorMap.put("details", null);
        return errorMap;
    }
}
