import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/kaia_colors.dart';
import '../../core/theme/theme_controller.dart';
import '../avatar/kaia_avatar.dart';
import '../chat/chat_surface.dart';
import '../drawers/drawer_folder.dart';
import '../settings/settings_panel.dart';
import '../sidebar/kaia_sidebar.dart';
import 'shell_state.dart';
import 'toast_host.dart';

class AppShellPage extends ConsumerWidget {
  const AppShellPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final kaia = context.kaia;
    final bgAsset = pondBackgroundAsset(themeMode);

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.escape): () {
          final settingsOpen = ref.read(settingsOpenProvider);
          if (settingsOpen) {
            ref.read(settingsOpenProvider.notifier).close();
            return;
          }
          final drawer = ref.read(activeDrawerIdProvider);
          if (drawer != null) {
            ref.read(activeDrawerIdProvider.notifier).clear();
            return;
          }
          ref.read(toastProvider.notifier).dismissLatest();
        },
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: KaiaColors.scaffoldFallback,
                image: DecorationImage(
                  image: AssetImage(bgAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ColoredBox(
              color: Color.fromRGBO(8, 12, 18, kaia.scrimOpacity),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const KaiaSidebar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        ChatSurface(),
                        SizedBox(width: 16),
                        KaiaAvatarHud(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const DrawerFolderOverlay(),
            const SettingsPanelOverlay(),
            const ToastHost(),
          ],
        ),
        ),
      ),
    );
  }
}
