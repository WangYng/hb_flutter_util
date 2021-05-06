import 'dart:collection';

import 'package:flutter/services.dart';

class HbFlutterUtilApi {
  Future<bool> isWechatInstalled() async {
    const channel = BasicMessageChannel<dynamic>('com.wangyng.hb_flutter_util.isWechatInstalled', StandardMessageCodec());
    final reply = await channel.send({});

    if (!(reply is Map)) {
      _throwChannelException();
    }

    Map<String, dynamic> replyMap = Map<String, dynamic>.from(reply);
    if (replyMap['error'] != null) {
      final HashMap<String, dynamic> error = replyMap['error'];
      _throwException(error);
    } else {

      print("replyMap ${replyMap['result'] as bool}");
      return replyMap['result'] as bool;
    }

    return false;
  }
}


_throwChannelException() {
  throw PlatformException(code: 'channel-error', message: 'Unable to establish connection on channel.', details: null);
}

_throwException(HashMap<String, dynamic> error) {
  throw PlatformException(code: error['code'], message: error['message'], details: error['details']);
}
