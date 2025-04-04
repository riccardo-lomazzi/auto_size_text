import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leak_tracker_flutter_testing/leak_tracker_flutter_testing.dart';

import 'utils.dart';

void main() {
  LeakTesting.settings =
      LeakTesting.settings.withIgnored(createdByTestHelpers: true);
  LeakTesting.enable();

  testWidgets('Overflow replacement visible on overflow', (tester) async {
    final text = await pumpAndGet<RichText>(
      tester: tester,
      widget: const SizedBox(
        width: 100,
        height: 20,
        child: AutoSizeText(
          'XXXXXX',
          overflowReplacement: Text('OVERFLOW!'),
          minFontSize: 20,
        ),
      ),
    );
    expect(text.text.toPlainText(), 'OVERFLOW!');
  });

  testWidgets('Overflow replacement not visible without overflow',
      (tester) async {
    final text = await pumpAndGet<RichText>(
      tester: tester,
      widget: const SizedBox(
        width: 100,
        height: 20,
        child: AutoSizeText(
          'XXXXX',
          style: TextStyle(fontSize: 20),
          overflowReplacement: Text('OVERFLOW!'),
        ),
      ),
    );
    expect(text.text.toPlainText(), 'XXXXX');
  });
}
