import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_android_opencc/flutter_android_opencc.dart';
import 'package:flutter_android_opencc/flutter_android_opencc_platform_interface.dart';
import 'package:flutter_android_opencc/flutter_android_opencc_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAndroidOpenccPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAndroidOpenccPlatform {
  @override
  Future<String?> convert(String str, ConversionType conversionType) =>
      Future.value('鼠标里面的硅二极管坏了，导致光标分辨率降低。');

  @override
  Future<void> clearDictDataFolder() => Future.value();
}

void main() {
  final FlutterAndroidOpenccPlatform initialPlatform =
      FlutterAndroidOpenccPlatform.instance;

  test('$MethodChannelFlutterAndroidOpencc is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAndroidOpencc>());
  });

  test('getPlatformVersion', () async {
    ChineseConverter flutterAndroidOpenccPlugin = ChineseConverter();
    MockFlutterAndroidOpenccPlatform fakePlatform =
        MockFlutterAndroidOpenccPlatform();
    FlutterAndroidOpenccPlatform.instance = fakePlatform;

    expect(
        await flutterAndroidOpenccPlugin.convert(
            '鼠标里面的硅二极管坏了，导致光标分辨率降低。', ConversionType.s2hk),
        '鼠标里面的硅二极管坏了，导致光标分辨率降低。');
  });
}
