import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/kaia_colors.dart';
import 'shell_state.dart';

class ToastHost extends ConsumerWidget {
  const ToastHost({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toasts = ref.watch(toastProvider);
    if (toasts.isEmpty) return const SizedBox.shrink();

    final kaia = context.kaia;
    return Positioned(
      left: 0,
      right: 0,
      bottom: 24,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final toast in toasts)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Material(
                color: kaia.chatSurface,
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Text(
                      toast.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: kaia.chatText),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
