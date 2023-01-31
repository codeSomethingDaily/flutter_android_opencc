import 'package:flutter/services.dart';
import 'package:flutter_android_opencc/conversion_type.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_android_opencc/flutter_android_opencc_method_channel.dart';

void main() {
  MethodChannelFlutterAndroidOpencc platform =
      MethodChannelFlutterAndroidOpencc();
  const MethodChannel channel = MethodChannel('flutter_android_opencc');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '鼠标里面的硅二极管坏了，导致光标分辨率降低。';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
  test('convert', () async {
    expect(
        await platform.convert('鼠标里面的硅二极管坏了，导致光标分辨率降低。', ConversionType.hk2s),
        '鼠标里面的硅二极管坏了，导致光标分辨率降低。');
  });
}
