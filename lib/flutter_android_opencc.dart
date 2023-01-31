import 'flutter_android_opencc_platform_interface.dart';

class ChineseConverter {
  Future<void> clearDictDataFolder() {
    return FlutterAndroidOpenccPlatform.instance.clearDictDataFolder();
  }

  Future<String?> convert(String str, ConversionType conversionType) {
    return FlutterAndroidOpenccPlatform.instance.convert(str, conversionType);
  }
}
