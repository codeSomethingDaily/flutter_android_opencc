import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_android_opencc_method_channel.dart';

// follows flutter convention to use lower case for enum
/*  copied from https://github.com/qichuan/android-opencc/blob/master/README.md */
enum ConversionType {
  /// HK2S, Traditional Chinese (Hong Kong Standard) to Simplified Chinese 香港繁體（香港小學學習字詞表標準）到簡體
  hk2s,

  /// HK2T, Traditional Chinese (Hong Kong variant) to Traditional Chinese 香港繁體（香港小學學習字詞表標準）到繁體
  hk2t,

  /// JP2T, New Japanese Kanji (Shinjitai) to Traditional Chinese Characters (Kyūjitai) 日本漢字到繁體
  jp2t,

  /// S2HK, Simplified Chinese to Traditional Chinese (Hong Kong Standard) 簡體到香港繁體（香港小學學習字詞表標準）
  s2hk,

  /// S2T, Simplified Chinese to Traditional Chinese 簡體到繁體
  s2t,

  /// S2TW, Simplified Chinese to Traditional Chinese (Taiwan Standard) 簡體到臺灣正體
  s2tw,

  /// S2TWP, Simplified Chinese to Traditional Chinese (Taiwan Standard) with Taiwanese idiom 簡體到繁體（臺灣正體標準）並轉換爲臺灣常用詞彙
  s2twp,

  /// T2HK, Traditional Chinese to Traditional Chinese (Hong Kong Standard) 繁體到香港繁體（香港小學學習字詞表標準）
  t2hk,

  /// T2S, Traditional Chinese to Simplified Chinese 繁體到簡體
  t2s,

  /// T2TW, Traditional Chinese to Traditional Chinese (Taiwan Standard) 繁體臺灣正體
  t2tw,

  ///  T2JP, Traditional Chinese Characters (Kyūjitai) to New Japanese Kanji (Shinjitai) 繁體到日本漢字
  t2jp,

  /// TW2S, Traditional Chinese (Taiwan Standard) to Simplified Chinese 臺灣正體到簡體
  tw2s,

  ///  TW2T, Traditional Chinese (Taiwan standard) to Traditional Chinese 臺灣正體到繁體
  tw2t,

  /// TW2SP, Traditional Chinese (Taiwan Standard) to Simplified Chinese with Mainland Chinese idiom 繁體（臺灣正體標準）到簡體並轉換爲中國大陸常用詞彙
  tw2sp,
}

abstract class FlutterAndroidOpenccPlatform extends PlatformInterface {
  /// Constructs a FlutterAndroidOpenccPlatform.
  FlutterAndroidOpenccPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAndroidOpenccPlatform _instance =
      MethodChannelFlutterAndroidOpencc();

  /// The default instance of [FlutterAndroidOpenccPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAndroidOpencc].
  static FlutterAndroidOpenccPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAndroidOpenccPlatform] when
  /// they register themselves.
  static set instance(FlutterAndroidOpenccPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> clearDictDataFolder() {
    throw UnimplementedError('clearDictDataFolder() has not been implemented.');
  }

  Future<String?> convert(String str, ConversionType conversionType) {
    throw UnimplementedError(
        'convert(String str, ConversionType conversionType) has not been implemented.');
  }
}
