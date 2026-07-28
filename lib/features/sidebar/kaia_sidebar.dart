import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/kaia_colors.dart';
import '../../core/theme/theme_controller.dart';
import '../shell/shell_state.dart';
import 'drawer_data.dart';

class KaiaSidebar extends ConsumerWidget {
  const KaiaSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kaia = context.kaia;
    final themeMode = ref.watch(themeModeProvider);
    final activeDrawerId = ref.watch(activeDrawerIdProvider);

    return Container(
      width: 224,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.15),
        border: Border(
          right: BorderSide(color: Colors.black.withValues(alpha: 0.1)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MYKAIA',
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 2.2,
                    color: kaia.chromeMuted,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Keep At It, Always',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kaia.chatText,
                  ),
                ),
                const SizedBox(height: 12),
                Material(
                  color: kaia.chatSurface,
                  borderRadius: BorderRadius.circular(6),
                  child: InkWell(
                    onTap: () {
                      ref.read(toastProvider.notifier).push(
                            'New chat is a shell control only in Phase 2.',
                          );
                    },
                    borderRadius: BorderRadius.circular(6),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'New chat',
                          style: TextStyle(fontSize: 14, color: kaia.chatText),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 8),
                  child: Text(
                    'DRAWERS',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.2,
                      color: kaia.chromeMuted,
                    ),
                  ),
                ),
                ...staticDrawers.map((drawer) {
                  final active = activeDrawerId == drawer.id;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: _DrawerFaceButton(
                      label: drawer.name,
                      active: active,
                      onTap: () =>
                          ref.read(activeDrawerIdProvider.notifier).toggle(drawer.id),
                    ),
                  );
                }),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                _ChromeButton(
                  label: themeMode == KaiaBrightness.light
                      ? 'Theme: Light'
                      : 'Theme: Dark',
                  onTap: () => ref.read(themeModeProvider.notifier).toggle(),
                ),
                const SizedBox(height: 8),
                _ChromeButton(
                  label: 'Settings',
                  onTap: () => ref.read(settingsOpenProvider.notifier).open(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerFaceButton extends StatelessWidget {
  const _DrawerFaceButton({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final kaia = context.kaia;
    return AnimatedScale(
      scale: active ? 1.02 : 1,
      duration: const Duration(milliseconds: 120),
      child: Material(
        color: kaia.drawerFace,
        borderRadius: BorderRadius.circular(6),
        elevation: active ? 2 : 1,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Text(
              label,
              style: TextStyle(fontSize: 14, color: kaia.chatText),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChromeButton extends StatelessWidget {
  const _ChromeButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final kaia = context.kaia;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(fontSize: 14, color: kaia.chatText),
            ),
          ),
        ),
      ),
    );
  }
}
