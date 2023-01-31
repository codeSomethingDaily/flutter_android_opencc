import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_android_opencc_platform_interface.dart';

/// An implementation of [FlutterAndroidOpenccPlatform] that uses method channels.
class MethodChannelFlutterAndroidOpencc extends FlutterAndroidOpenccPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_android_opencc');

  @override
  Future<void> clearDictDataFolder() async {
    await methodChannel.invokeMapMethod('clearDictDataFolder');
  }

  @override
  Future<String?> convert(String str, ConversionType conversionType) async {
    final res = await methodChannel.invokeMethod<String>('convert', {
      "text": str,
      "ConversionType": conversionType.name.toUpperCase(),
    });
    return res;
  }
}
