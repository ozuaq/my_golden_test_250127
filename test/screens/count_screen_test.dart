import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_golden_test/src/app.dart';
import 'package:my_golden_test/src/screens/count_screen.dart';

import '../golden_test_helpers/golden_test_device_scenario.dart';
import '../golden_test_helpers/golden_test_util.dart';
import '../test_helpers/test_app.dart';

void main() {
  autoUpdateGoldenFiles = true;

  testWidgets('カウント画面が正しく表示される2', (WidgetTester tester) async {
    await GoldenTestUtil.loadAssets();
    await tester.pumpWidget(
        const GoldenTestDevice(appWidget: MyApp(screen: CountScreen())));

    await tester.pumpAndSettle();

    await GoldenTestUtil.expectGoldenFile(
        target: find.byType(MyApp),
        fileName: 'count_screen2',
        isScreenshotEnabled: true);
  });

  testWidgets('カウント画面が正しく表示される', (WidgetTester tester) async {
    await tester.pumpWidget(const TestApp(screen: CountScreen()));

    await tester.pumpAndSettle();

    await GoldenTestUtil.expectGoldenFile(
      target: find.byType(MyApp),
      fileName: 'count_screen',
    );
  });
}
