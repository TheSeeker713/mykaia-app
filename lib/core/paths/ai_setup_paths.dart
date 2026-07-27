/// Local AI / model asset roots for MyKAIA.
///
/// Always prefer D:\_Dev\AI-Setup\mykaia over any C: path for project
/// model caches and bundled model prep outputs.
class AiSetupPaths {
  AiSetupPaths._();

  /// Root for all MyKAIA AI-Setup assets on this machine.
  static const String root = r'D:\_Dev\AI-Setup\mykaia';

  /// Downloaded / prepared on-device model files (.litertlm, etc.).
  static const String models = r'D:\_Dev\AI-Setup\mykaia\models';

  /// Runtime model cache (override flutter_gemma %LOCALAPPDATA% default).
  static const String modelCache = r'D:\_Dev\AI-Setup\mykaia\model_cache';

  /// Scratch / conversion workspace for litertlm prep (not shipped).
  static const String modelPrep = r'D:\_Dev\AI-Setup\mykaia\model_prep';
}
