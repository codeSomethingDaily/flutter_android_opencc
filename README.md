# deprecated
use flutter_opencc_ffi[https://pub.dev/packages/flutter_opencc_ffi] instaed




# flutter_android_opencc

A Flutter plugin to wrap [android-opencc](https://github.com/qichuan/android-opencc), which is an android port to [OPENCC](https://github.com/BYVoid/OpenCC).
This plugin only works with Android as the name suggested.

supports the Android V2 embedding and null safety for flutter, and is dart3 ready.

## usage

run the following command to add flutter_android_opencc to your dependency

```bash
flutter pub add flutter_android_opencc
```

You probably need to update your android/app/build.gradle. If you need support to a lower sdkversion, change the config in android/build.gradle of this plugin instead.

```gradle
android {
    defaultConfig {
        ...
        minSdkVersion 21
    }
}
```

```dart
import 'package:flutter_android_opencc/conversion_type.dart';
import 'package:flutter_android_opencc/chinese_converter.dart';

var testResult = await _flutterAndroidOpenccPlugin.convert(
            "鼠标里面的硅二极管坏了，导致光标分辨率降低。", ConversionType.s2twp) ??
        "unknown error";
```
