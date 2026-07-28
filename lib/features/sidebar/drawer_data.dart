class KaiaDrawerItem {
  const KaiaDrawerItem({
    required this.id,
    required this.name,
    required this.systemKey,
  });

  final String id;
  final String name;
  final String systemKey;
}

/// Static drawer catalog from _KAIA_Wrapper `drawerData.ts` (labels only).
const staticDrawers = <KaiaDrawerItem>[
  KaiaDrawerItem(id: 'automations', name: 'Automations', systemKey: 'automations'),
  KaiaDrawerItem(id: 'agents', name: 'Agents', systemKey: 'agents'),
  KaiaDrawerItem(id: 'models', name: 'Models', systemKey: 'models'),
  KaiaDrawerItem(
    id: 'fallback_models',
    name: 'Fallback Models',
    systemKey: 'fallback_models',
  ),
  KaiaDrawerItem(id: 'connectors', name: 'Connectors', systemKey: 'connectors'),
  KaiaDrawerItem(id: 'notes', name: 'Notes', systemKey: 'notes'),
  KaiaDrawerItem(id: 'files', name: 'Files', systemKey: 'files'),
  KaiaDrawerItem(id: 'tasks', name: 'Tasks', systemKey: 'tasks'),
  KaiaDrawerItem(id: 'calendar', name: 'Calendar', systemKey: 'calendar'),
  KaiaDrawerItem(id: 'journal', name: 'Journal', systemKey: 'journal'),
  KaiaDrawerItem(id: 'progress', name: 'Progress', systemKey: 'progress'),
];
