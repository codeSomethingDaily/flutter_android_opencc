import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_android_opencc/conversion_type.dart';
import 'package:flutter_android_opencc/chinese_converter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _testResult = "";
  final _flutterAndroidOpenccPlugin = ChineseConverter();

  @override
  void initState() {
    super.initState();
    initTestResult();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initTestResult() async {
    var testResult = await _flutterAndroidOpenccPlugin.convert(
            "鼠标里面的硅二极管坏了，导致光标分辨率降低。", ConversionType.s2twp) ??
        "unknown error";
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _testResult = testResult;
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
          child: Column(
            children: [
              const Text("Original: 鼠标里面的硅二极管坏了，导致光标分辨率降低。"),
              // expect: 滑鼠裡面的矽二極體壞了，導致游標解析度降低。
              Text("result: $_testResult")
            ],
          ),
        ),
      ),
    );
  }
}
