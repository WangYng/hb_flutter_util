
import 'dart:async';

import 'package:hb_flutter_util/hb_flutter_util_api.dart';

class HbFlutterUtil {
  final _api = HbFlutterUtilApi();

  Future<bool> isWechatInstalled() async {
    return _api.isWechatInstalled();
  }
}
