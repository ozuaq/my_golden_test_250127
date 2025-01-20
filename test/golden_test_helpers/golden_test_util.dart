import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

enum FontLoadState {
  ahem,
  theme,
}

class GoldenTestUtil {
  static const screenshotDirRelativesPath = 'screenshots';
  static const goldenImgDirRelativesPath = 'goldens';
  static const _ahemKey = 'assets/fonts/Ahem.ttf';
  static FontLoadState _fontLoadState = FontLoadState.ahem;

  static Future<void> loadAssets({bool isScreenshot = false}) async {
    if (isScreenshot && _fontLoadState == FontLoadState.theme) {
      return;
    }

    if (!isScreenshot && _fontLoadState == FontLoadState.ahem) {
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
        if (isScreenshot) {
          loader.addFont(bundle.load(asset));
        } else {
          loader.addFont(bundle.load(_ahemKey));
        }
      }

      await loader.load();

      if (isScreenshot) {
        _fontLoadState = FontLoadState.theme;
      } else {
        _fontLoadState = FontLoadState.ahem;
      }
    }
  }

  static Future<void> expectGoldenFile({
    required Finder target,
    required String fileName,
  }) async {
    if (autoUpdateGoldenFiles) {
      await expectLater(target,
          matchesGoldenFile('$screenshotDirRelativesPath/$fileName.png'));
      return;
    }

    await expectLater(
        target, matchesGoldenFile('$goldenImgDirRelativesPath/$fileName.png'));
  }
}
