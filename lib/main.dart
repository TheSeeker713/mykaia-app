import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/router.dart';
import 'core/theme/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyKaiaApp()));
}

class MyKaiaApp extends ConsumerWidget {
  const MyKaiaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      title: 'MyKAIA',
      theme: buildMyKaiaTheme(KaiaBrightness.light),
      darkTheme: buildMyKaiaTheme(KaiaBrightness.dark),
      themeMode: themeMode == KaiaBrightness.dark
          ? ThemeMode.dark
          : ThemeMode.light,
      routerConfig: router,
    );
  }
}
