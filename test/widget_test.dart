import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mykaia_app/main.dart';

void main() {
  testWidgets('home placeholder shows MyKAIA', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyKaiaApp()));
    expect(find.text('MyKAIA'), findsOneWidget);
  });
}
