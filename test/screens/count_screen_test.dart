import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:my_golden_test/src/screens/count_screen.dart';
import 'package:my_golden_test/src/theme.dart';

import '../golden_test_helpers/screen_builder.dart';
import '../golden_test_helpers/golden_test_util.dart';
import '../test_helpers/test_app.dart';

void main() {
  group('CountScreen', () {
    Future<void> incrementCounter(
        {required WidgetTester tester, int incrementValue = 1}) async {
      for (var i = 0; i < incrementValue; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
      }
    }

    testWidgets('カウント画面が表示される', (WidgetTester tester) async {
      await tester.pumpWidget(ScreenBuilder.build(
          app: TestApp(
        theme: myTheme,
        home: const CountScreen(),
      )));

      await GoldenTestUtil.expectGoldenFile(
        target: find.byType(TestApp),
        fileName: 'count_screen',
      );
    });

    testWidgets('プラスボタンを押すとカウントが増える', (WidgetTester tester) async {
      await tester.pumpWidget(ScreenBuilder.build(
          app: TestApp(
        theme: myTheme,
        home: const CountScreen(),
      )));

      await incrementCounter(tester: tester, incrementValue: 2);
      expect(find.text('2'), findsOneWidget);

      await GoldenTestUtil.expectGoldenFile(
        target: find.byType(TestApp),
        fileName: 'count_screen_increment_count',
      );
    });

    testWidgets('カウントが1以上のとき、リセットボタンを押すと、ダイアログを表示する',
        (WidgetTester tester) async {
      await tester.pumpWidget(ScreenBuilder.build(
          app: TestApp(
        theme: myTheme,
        home: const CountScreen(),
      )));

      await incrementCounter(tester: tester, incrementValue: 1);
      expect(find.text('1'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      await GoldenTestUtil.expectGoldenFile(
        target: find.byType(TestApp),
        fileName: 'count_screen_show_dialog',
      );
    });

    testWidgets('カウントが0のとき、リセットボタンを押しても、何も起こらない', (WidgetTester tester) async {
      await tester.pumpWidget(ScreenBuilder.build(
          app: TestApp(
        theme: myTheme,
        home: const CountScreen(),
      )));

      expect(find.text('0'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('カウントリセットの確認ダイアログでリセットを押したら、カウントを0にする',
        (WidgetTester tester) async {
      await tester.pumpWidget(ScreenBuilder.build(
          app: TestApp(
        theme: myTheme,
        home: const CountScreen(),
      )));

      await incrementCounter(tester: tester, incrementValue: 1);
      expect(find.text('1'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tap(find.text('リセット'));
      await tester.pumpAndSettle();

      expect(find.text('0'), findsOneWidget);
      expect(find.text('カウントをリセットしました'), findsOneWidget);

      await GoldenTestUtil.expectGoldenFile(
        target: find.byType(TestApp),
        fileName: 'count_screen_reset_count',
      );
    });

    testWidgets('カウントリセットの確認ダイアログでキャンセルを押したら、カウントを0にしない',
        (WidgetTester tester) async {
      await tester.pumpWidget(ScreenBuilder.build(
          app: TestApp(
        theme: myTheme,
        home: const CountScreen(),
      )));

      await incrementCounter(tester: tester, incrementValue: 1);
      expect(find.text('1'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tap(find.text('キャンセル'));
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('カウントをリセットしました'), findsNothing);

      await GoldenTestUtil.expectGoldenFile(
        target: find.byType(TestApp),
        fileName: 'count_screen_reset_count_cancelled',
      );
    });
  });
}
