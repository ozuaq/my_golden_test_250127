import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:my_golden_test/src/screens/count_screen.dart';
import 'package:my_golden_test/src/theme.dart';

import '../golden_test_helpers/device_builder.dart';
import '../golden_test_helpers/device_screen.dart';
import '../test_helpers/test_app.dart';

void main() {
  autoUpdateGoldenFiles = true;

  testWidgets('count_screen', (WidgetTester tester) async {
    DeviceBuilder.setUpDevice(tester: tester);

    await tester.pumpWidget(DeviceScreen(
        child: TestApp(
      screen: const CountScreen(),
      theme: myTheme,
    )));
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(MaterialApp).first,
      matchesGoldenFile('screenshots/count_screen.png'),
    );
  });

  testWidgets('count_screen2', (WidgetTester tester) async {
    DeviceBuilder.setUpDevice(tester: tester, isScreenshot: true);

    await tester.pumpWidget(DeviceScreen(
        child: TestApp(
      screen: const CountScreen(),
      theme: myTheme,
    )));
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(MaterialApp).first,
      matchesGoldenFile('screenshots/count_screen2.png'),
    );
  });

  TestWidgetsFlutterBinding.ensureInitialized(); // バインディングの初期化

  test('CupertinoIcons.ttf asset can be loaded', () async {
    // 指定されたアセットパスでフォントファイルを読み込む
    final ByteData data = await rootBundle
        .load('packages/cupertino_icons/assets/CupertinoIcons.ttf');

    // アセットのサイズが 0 より大きいことを確認
    expect(data.lengthInBytes, greaterThan(0));
  });

  test('Ahem.ttf asset can be loaded', () async {
    // 指定されたアセットパスでフォントファイルを読み込む
    final ByteData data = await rootBundle.load('assets/fonts/Ahem.ttf');

    // アセットのサイズが 0 より大きいことを確認
    expect(data.lengthInBytes, greaterThan(0));
  });

  void hoge() {
    [
      {
        "family": "MaterialIcons",
        "fonts": [
          {"asset": "fonts/MaterialIcons-Regular.otf"}
        ]
      },
      {
        "family": "NotoSansJP",
        "fonts": [
          {"weight": 100, "asset": "assets/fonts/NotoSansJP-Thin.ttf"},
          {"weight": 200, "asset": "assets/fonts/NotoSansJP-ExtraLight.ttf"},
          {"weight": 300, "asset": "assets/fonts/NotoSansJP-Light.ttf"},
          {"weight": 400, "asset": "assets/fonts/NotoSansJP-Regular.ttf"},
          {"weight": 500, "asset": "assets/fonts/NotoSansJP-Medium.ttf"},
          {"weight": 600, "asset": "assets/fonts/NotoSansJP-SemiBold.ttf"},
          {"weight": 700, "asset": "assets/fonts/NotoSansJP-Bold.ttf"},
          {"weight": 800, "asset": "assets/fonts/NotoSansJP-ExtraBold.ttf"},
          {"weight": 900, "asset": "assets/fonts/NotoSansJP-Black.ttf"}
        ]
      },
      {
        "family": "packages/cupertino_icons/CupertinoIcons",
        "fonts": [
          {"asset": "packages/cupertino_icons/assets/CupertinoIcons.ttf"}
        ]
      }
    ];
  }
}
