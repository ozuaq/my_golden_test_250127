import 'package:flutter_test/flutter_test.dart';
import 'package:my_golden_test/src/screens/count_screen.dart';
import 'package:my_golden_test/src/theme.dart';

import '../golden_test_helpers/golden_test_device.dart';
import '../golden_test_helpers/golden_test_util.dart';
import '../test_helpers/test_app.dart';

void main() {
  autoUpdateGoldenFiles = true;

  testWidgets('カウント画面が正しく表示される', (WidgetTester tester) async {
    await tester.pumpWidget(GoldenTestDevice(
        appWidget: TestApp(
      screen: const CountScreen(),
      theme: myTheme,
    )));

    await tester.pumpAndSettle();

    await GoldenTestUtil.expectGoldenFile(
      target: find.byType(GoldenTestDevice),
      fileName: 'count_screen',
    );
  });
}
