import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsOpenProvider = NotifierProvider<SettingsOpenNotifier, bool>(
  SettingsOpenNotifier.new,
);

class SettingsOpenNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void open() => state = true;
  void close() => state = false;
}

final activeDrawerIdProvider =
    NotifierProvider<ActiveDrawerNotifier, String?>(ActiveDrawerNotifier.new);

class ActiveDrawerNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void toggle(String id) {
    state = state == id ? null : id;
  }

  void clear() => state = null;
}

class ToastMessage {
  ToastMessage(this.text) : id = DateTime.now().microsecondsSinceEpoch;

  final int id;
  final String text;
}

final toastProvider = NotifierProvider<ToastNotifier, List<ToastMessage>>(
  ToastNotifier.new,
);

class ToastNotifier extends Notifier<List<ToastMessage>> {
  @override
  List<ToastMessage> build() => const [];

  void push(String text) {
    final message = ToastMessage(text);
    state = [...state, message];
    Future<void>.delayed(const Duration(seconds: 3), () {
      dismiss(message.id);
    });
  }

  void dismiss(int id) {
    state = state.where((m) => m.id != id).toList(growable: false);
  }

  void dismissLatest() {
    if (state.isEmpty) return;
    state = state.sublist(0, state.length - 1);
  }
}
