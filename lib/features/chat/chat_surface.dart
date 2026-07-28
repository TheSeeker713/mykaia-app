import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/kaia_colors.dart';
import '../shell/shell_state.dart';

/// Chat chrome only. Send is a toast stub (no model / connector calls).
class ChatSurface extends ConsumerStatefulWidget {
  const ChatSurface({super.key});

  @override
  ConsumerState<ChatSurface> createState() => _ChatSurfaceState();
}

class _ChatSurfaceState extends ConsumerState<ChatSurface> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    ref.read(toastProvider.notifier).push(
          'Chat UI only in Phase 2. Model wiring is not connected yet.',
        );
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final kaia = context.kaia;
    return Expanded(
      child: Material(
        color: kaia.chatSurface,
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chat',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kaia.chatText,
                          ),
                        ),
                        Text(
                          'Solid surface. Pond stays in chrome only.',
                          style: TextStyle(fontSize: 12, color: kaia.chromeMuted),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Ctrl+Enter',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 1,
                      color: kaia.chromeMuted,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.black.withValues(alpha: 0.08)),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 520),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Welcome. This is the Phase 2 chat surface. Layout only, no model connection.',
                          style: TextStyle(fontSize: 14, color: kaia.chatText),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.black.withValues(alpha: 0.08)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CallbackShortcuts(
                    bindings: {
                      const SingleActivator(LogicalKeyboardKey.enter, control: true):
                          _submit,
                    },
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      minLines: 3,
                      maxLines: 5,
                      style: TextStyle(color: kaia.chatText, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Message KAIA…',
                        hintStyle: TextStyle(color: kaia.chromeMuted),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: _submit,
                    style: FilledButton.styleFrom(
                      backgroundColor: KaiaColors.accent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
