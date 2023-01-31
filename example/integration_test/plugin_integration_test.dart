// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_android_opencc/conversion_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_android_opencc/chinese_converter.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('convert', (widgetTester) async {
    final ChineseConverter plugin = ChineseConverter();
    final String? result =
        await plugin.convert('鼠标里面的硅二极管坏了，导致光标分辨率降低。', ConversionType.s2twp);
    expect(result, "滑鼠裡面的矽二極體壞了，導致游標解析度降低。");
  });
}
