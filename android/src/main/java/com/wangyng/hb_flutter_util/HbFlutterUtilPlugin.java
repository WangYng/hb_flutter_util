package com.wangyng.hb_flutter_util;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;

import androidx.annotation.NonNull;

import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;

/** FlutterCommonUtilPlugin */
public class HbFlutterUtilPlugin implements FlutterPlugin, HbFlutterUtilApi {

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    HbFlutterUtilApi.setup(binding.getApplicationContext(), binding.getBinaryMessenger(), this);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    HbFlutterUtilApi.setup(null, binding.getBinaryMessenger(), null);
  }

  @Override
  public boolean isWechatInstalled(Context context) {
    final PackageManager packageManager = context.getPackageManager();// 获取packagemanager
    List<PackageInfo> pInfo = packageManager.getInstalledPackages(0);// 获取所有已安装程序的包信息
    if (pInfo != null) {
      for (int i = 0; i < pInfo.size(); i++) {
        String pn = pInfo.get(i).packageName;
        if (pn.equals("com.tencent.mm")) {
          return true;
        }
      }
    }
    return false;
  }
}
