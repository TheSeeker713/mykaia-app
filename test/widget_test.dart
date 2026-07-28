import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mykaia_app/main.dart';

void main() {
  testWidgets('shell shows sidebar chat and avatar', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1280, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const ProviderScope(child: MyKaiaApp()));
    await tester.pumpAndSettle();

    expect(find.text('MYKAIA'), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);
    expect(find.text('KAIA'), findsWidgets);
    expect(find.text('Journal'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('settings overlay opens from sidebar', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1280, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const ProviderScope(child: MyKaiaApp()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    expect(find.text('Appearance'), findsOneWidget);
    expect(find.text('UI only. No persistence yet.'), findsOneWidget);
  });

  testWidgets('drawer overlay opens from journal', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1280, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const ProviderScope(child: MyKaiaApp()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Journal'));
    await tester.pumpAndSettle();

    expect(find.text('Card A'), findsOneWidget);
    expect(
      find.text('Static placeholder cards. No connector data in Phase 2.'),
      findsOneWidget,
    );
  });
}
