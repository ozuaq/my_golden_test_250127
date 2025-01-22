import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:my_golden_test/src/screens/count_screen.dart';
import 'package:my_golden_test/src/theme.dart';

import '../golden_test_helpers/device_builder.dart';
import '../golden_test_helpers/golden_test_util.dart';
import '../golden_test_helpers/screen_size.dart';
import '../test_helpers/test_app.dart';

void main() {
  autoUpdateGoldenFiles = true;

  group('isCustomFontLoaded true', () {
    setUp(() async {
      await GoldenTestUtil.loadAssets();
    });

    testWidgets('count_screen_smartPhone', (WidgetTester tester) async {
      await tester.pumpWidget(ScreenBuilder.build(
          app: TestApp(
        theme: myTheme,
        home: const CountScreen(),
      )));
      await tester.pumpAndSettle();

      await GoldenTestUtil.expectGoldenFile(
        target: find.byType(Builder).first,
        fileName: 'count_screen_smartPhone',
      );
    });

    testWidgets('count_screen_web', (WidgetTester tester) async {
      await tester.pumpWidget(ScreenBuilder.build(
          screenSize: ScreenSize.web,
          app: TestApp(
            theme: myTheme,
            home: const CountScreen(),
          )));
      await tester.pumpAndSettle();

      await GoldenTestUtil.expectGoldenFile(
        target: find.byType(Builder).first,
        fileName: 'count_screen_web',
      );
    });
  });

  group('isCustomFontLoaded false', () {
    testWidgets('count_screen_smartPhone', (WidgetTester tester) async {
      await tester.pumpWidget(ScreenBuilder.build(
          app: TestApp(
        theme: myTheme,
        home: const CountScreen(),
      )));
      await tester.pumpAndSettle();

      await GoldenTestUtil.expectGoldenFile(
        target: find.byType(Builder).first,
        fileName: 'count_screen_smartPhone',
      );
    });

    testWidgets('count_screen_web', (WidgetTester tester) async {
      await tester.pumpWidget(ScreenBuilder.build(
          screenSize: ScreenSize.web,
          app: TestApp(
            theme: myTheme,
            home: const CountScreen(),
          )));
      await tester.pumpAndSettle();

      await GoldenTestUtil.expectGoldenFile(
        target: find.byType(Builder).first,
        fileName: 'count_screen_web',
      );
    });
  });
}
