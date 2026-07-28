import 'package:flutter/material.dart';

import '../../core/theme/kaia_colors.dart';

class KaiaAvatarHud extends StatelessWidget {
  const KaiaAvatarHud({super.key});

  static const assetPath =
      'assets/kaia_wrapper_port/avatar/kaia-avatar-default.webp';

  @override
  Widget build(BuildContext context) {
    final kaia = context.kaia;
    return SizedBox(
      width: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x73000000),
                  blurRadius: 24,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: Image.asset(
              assetPath,
              width: 144,
              height: 144,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 144,
                  height: 144,
                  alignment: Alignment.center,
                  color: Colors.black26,
                  child: const Text('KAIA'),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'KAIA',
            style: TextStyle(fontSize: 12, color: kaia.chromeMuted),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
