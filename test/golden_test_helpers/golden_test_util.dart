import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class GoldenTestUtil {
  static const screenshotDirRelativesPath = 'screenshots';
  static const goldenImgDirRelativesPath = 'goldens';
  static bool _loadAssetsCalled = false;
  static String? _loadAssetsStackTrace;

  static Future<void> loadAssets() async {
    if (_loadAssetsCalled) {
      return;
    }

    TestWidgetsFlutterBinding.ensureInitialized();

    final loader = FontLoader('NotoSansJP')
      ..addFont(rootBundle.load('assets/fonts/NotoSansJP-Thin.ttf'))
      ..addFont(rootBundle.load('assets/fonts/NotoSansJP-ExtraLight.ttf'))
      ..addFont(rootBundle.load('assets/fonts/NotoSansJP-Light.ttf'))
      ..addFont(rootBundle.load('assets/fonts/NotoSansJP-Regular.ttf'))
      ..addFont(rootBundle.load('assets/fonts/NotoSansJP-Medium.ttf'))
      ..addFont(rootBundle.load('assets/fonts/NotoSansJP-SemiBold.ttf'))
      ..addFont(rootBundle.load('assets/fonts/NotoSansJP-Bold.ttf'))
      ..addFont(rootBundle.load('assets/fonts/NotoSansJP-ExtraBold.ttf'))
      ..addFont(rootBundle.load('assets/fonts/NotoSansJP-Black.ttf'));

    await loader.load();

    _loadAssetsCalled = true;
    final stackTraceStr = StackTrace.current.toString();
    final stackLines = stackTraceStr.split('\n');

    final matchingLine =
        stackLines.where((line) => line.contains('_test.dart')).firstOrNull;

    _loadAssetsStackTrace = matchingLine != null
        ? matchingLine.replaceAll(RegExp(r'#\d+\s+'), '')
        : stackTraceStr;
  }

  static Future<void> expectGoldenFile(
      {required Finder target,
      required String fileName,
      bool isScreenshotEnabled = false}) async {
    if (autoUpdateGoldenFiles && isScreenshotEnabled) {
      await expectLater(target,
          matchesGoldenFile('$screenshotDirRelativesPath/$fileName.png'));
      return;
    }

    if (_loadAssetsCalled) {
      throw GoldenTestUtilException('スクリーンショットが無効の場合、カスタムフォントをロードしないでください。\n'
          'loadAssetsが呼び出された場所:\n$_loadAssetsStackTrace');
    }

    await expectLater(
        target, matchesGoldenFile('$goldenImgDirRelativesPath/$fileName.png'));
  }
}

class GoldenTestUtilException implements Exception {
  final String message;

  GoldenTestUtilException(this.message);

  @override
  String toString() => "GoldenTestUtilException: $message";
}
