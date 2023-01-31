# flutter_android_opencc

A Flutter plugin to wrap [android-opencc](https://github.com/qichuan/android-opencc), which is an android port to [OPENCC](https://github.com/BYVoid/OpenCC).
This plugin only works with Android as the name suggested.

supports the Android V2 embedding and null safety for flutter, and is dart3 ready.

## usage

run the following command to add flutter_android_opencc to your dependency

```console
flutter pub add flutter_android_opencc
```

```dart
import 'package:flutter_android_opencc/conversion_type.dart';
import 'package:flutter_android_opencc/chinese_converter.dart';

var testResult = await _flutterAndroidOpenccPlugin.convert(
            "鼠标里面的硅二极管坏了，导致光标分辨率降低。", ConversionType.s2twp) ??
        "unknown error";
```
