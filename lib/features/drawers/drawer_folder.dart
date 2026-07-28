import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/kaia_colors.dart';
import '../shell/shell_state.dart';
import '../sidebar/drawer_data.dart';

class DrawerFolderOverlay extends ConsumerWidget {
  const DrawerFolderOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeId = ref.watch(activeDrawerIdProvider);
    if (activeId == null) return const SizedBox.shrink();

    KaiaDrawerItem? drawer;
    for (final item in staticDrawers) {
      if (item.id == activeId) {
        drawer = item;
        break;
      }
    }
    if (drawer == null) return const SizedBox.shrink();

    final kaia = context.kaia;
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () => ref.read(activeDrawerIdProvider.notifier).clear(),
            child: Container(color: Colors.black.withValues(alpha: 0.4)),
          ),
        ),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Material(
              color: kaia.chatSurface,
              borderRadius: BorderRadius.circular(12),
              elevation: 12,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            drawer.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kaia.chatText,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              ref.read(activeDrawerIdProvider.notifier).clear(),
                          child: Text(
                            'Close',
                            style: TextStyle(color: kaia.chromeMuted),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 2.4,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        _PlaceholderCard(title: 'Card A'),
                        _PlaceholderCard(title: 'Card B'),
                        _PlaceholderCard(title: 'Card C'),
                        _PlaceholderCard(title: 'Add…'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Static placeholder cards. No connector data in Phase 2.',
                      style: TextStyle(fontSize: 12, color: kaia.chromeMuted),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PlaceholderCard extends StatelessWidget {
  const _PlaceholderCard({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final kaia = context.kaia;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
      ),
      child: Text(title, style: TextStyle(fontSize: 14, color: kaia.chatText)),
    );
  }
}
