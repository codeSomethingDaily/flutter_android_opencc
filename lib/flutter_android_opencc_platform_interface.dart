import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'conversion_type.dart';
import 'flutter_android_opencc_method_channel.dart';

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
