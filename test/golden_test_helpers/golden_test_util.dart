import 'dart:convert';

import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app_screen.dart';

class GoldenTestUtil {
  static const screenshotDirRelativesPath = 'screenshots';
  static const goldenImgDirRelativesPath = 'goldens';
  static bool _isCustomFontLoaded = false;

  static Future<void> Function(WidgetTester) testWidgetsCallback(
      {required Future<void> Function(WidgetTester) callback,
      AppScreen screenSize = AppScreen.smartPhone}) {
    return (WidgetTester tester) async {
      tester.view.physicalSize = screenSize.size;
      tester.view.devicePixelRatio = 1.0;

      if (_isCustomFontLoaded) {
        debugDisableShadows = false;
      }

      await callback(tester);

      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();

      if (_isCustomFontLoaded) {
        debugDisableShadows = true;
      }
    };
  }

  static Future<void> loadAssets() async {
    if (_isCustomFontLoaded) {
      return;
    }

    TestWidgetsFlutterBinding.ensureInitialized();

    final bundle = rootBundle;
    final fontManifestString = await bundle.loadString('FontManifest.json');
    final fontManifest = (json.decode(fontManifestString) as List<dynamic>)
        .map((dynamic x) => x as Map<String, dynamic>);

    for (final entry in fontManifest) {
      final family = entry['family'] as String;
      final fonts = entry['fonts'] as List<dynamic>;

      final loader = FontLoader(family);
      for (final font in fonts) {
        final asset = font['asset'] as String;
        loader.addFont(bundle.load(asset));
      }

      await loader.load();
    }

    _isCustomFontLoaded = true;
  }

  static Future<void> expectGoldenFile({
    required Finder target,
    required String fileName,
  }) async {
    if (autoUpdateGoldenFiles && _isCustomFontLoaded) {
      await expectLater(target,
          matchesGoldenFile('$screenshotDirRelativesPath/$fileName.png'));
      return;
    }
    if (_isCustomFontLoaded) {
      throw Exception(
          'カスタムフォントが読み込まれているため、Golden Testを実行できません。Goldenファイル更新の場合は、テスト実行時に--update-goldensオプションを指定してください。');
    }

    await expectLater(
        target, matchesGoldenFile('$goldenImgDirRelativesPath/$fileName.png'));
  }
}
