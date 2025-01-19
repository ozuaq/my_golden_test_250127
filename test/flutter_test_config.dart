// flutter_test_config.dart
import 'dart:async';
import 'package:flutter_test/flutter_test.dart';

import 'golden_test_helpers/golden_test_util.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await GoldenTestUtil.loadAssets();

  await testMain();
}
