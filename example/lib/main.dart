import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hb_flutter_util/hb_flutter_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool installed = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool installed;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      installed = await HbFlutterUtil().isWechatInstalled();
    } on PlatformException {
      installed = false;
    }

    setState(() {
      this.installed = installed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('wechat install $installed\n'),
        ),
      ),
    );
  }
}
