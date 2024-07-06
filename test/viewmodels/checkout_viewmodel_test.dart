import 'package:flutter_test/flutter_test.dart';
import 'package:stageone/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CheckoutViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
