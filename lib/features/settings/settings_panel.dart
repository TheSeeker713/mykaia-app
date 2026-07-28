import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/kaia_colors.dart';
import '../../core/theme/theme_controller.dart';
import '../shell/shell_state.dart';

const _settingsSections = <String>[
  'Appearance',
  'Voice',
  'Sound',
  'Keyboard shortcuts',
  'Connectors',
  'Help / About',
];

class SettingsPanelOverlay extends ConsumerWidget {
  const SettingsPanelOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final open = ref.watch(settingsOpenProvider);
    if (!open) return const SizedBox.shrink();

    final kaia = context.kaia;
    final themeMode = ref.watch(themeModeProvider);

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () => ref.read(settingsOpenProvider.notifier).close(),
            child: Container(color: Colors.black.withValues(alpha: 0.35)),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: kaia.chatSurface,
            elevation: 16,
            child: SizedBox(
              width: 420,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 12, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Settings',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: kaia.chatText,
                                ),
                              ),
                              Text(
                                'UI only. No persistence yet.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: kaia.chromeMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              ref.read(settingsOpenProvider.notifier).close(),
                          child: Text(
                            'Close',
                            style: TextStyle(color: kaia.chromeMuted),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        for (final section in _settingsSections)
                          _SettingsSection(
                            title: section,
                            initiallyExpanded: section == 'Appearance',
                            child: section == 'Appearance'
                                ? Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      _ThemeChip(
                                        label: 'Light',
                                        selected:
                                            themeMode == KaiaBrightness.light,
                                        onTap: () => ref
                                            .read(themeModeProvider.notifier)
                                            .setTheme(KaiaBrightness.light),
                                      ),
                                      _ThemeChip(
                                        label: 'Dark',
                                        selected:
                                            themeMode == KaiaBrightness.dark,
                                        onTap: () => ref
                                            .read(themeModeProvider.notifier)
                                            .setTheme(KaiaBrightness.dark),
                                      ),
                                      Text(
                                        'dual_asset pond swap',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: kaia.chromeMuted,
                                        ),
                                      ),
                                    ],
                                  )
                                : section == 'Keyboard shortcuts'
                                    ? Text(
                                        'Send — Ctrl+Enter\nDismiss toast / close settings — Esc',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: kaia.chromeMuted,
                                        ),
                                      )
                                    : Text(
                                        'Placeholder section. Wiring comes in a later phase.',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: kaia.chromeMuted,
                                        ),
                                      ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({
    required this.title,
    required this.child,
    required this.initiallyExpanded,
  });

  final String title;
  final Widget child;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final kaia = context.kaia;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.black.withValues(alpha: 0.03),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.black.withValues(alpha: 0.1)),
        ),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: kaia.chatText,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Align(alignment: Alignment.centerLeft, child: child),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeChip extends StatelessWidget {
  const _ThemeChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? KaiaColors.accent : Colors.black.withValues(alpha: 0.05),
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : context.kaia.chatText,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
