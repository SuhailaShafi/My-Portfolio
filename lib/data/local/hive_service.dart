import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String settingsBoxName = 'portfolio_settings_box';
  static const String projectsBoxName = 'portfolio_projects_box';

  static const String themeKey = 'app_theme_mode';
  static const String projectsDataKey = 'app_projects_list';

  Box? _settingsBox;
  Box? _projectsBox;

  Future<void> init() async {
    try {
      await Hive.initFlutter();
      _settingsBox = await Hive.openBox(settingsBoxName);
      _projectsBox = await Hive.openBox(projectsBoxName);
    } catch (e) {
      debugPrint('Hive init warning: $e');
    }
  }

  // Theme Preference (0: system, 1: light, 2: dark)
  int getThemeModeIndex() {
    if (_settingsBox == null || !_settingsBox!.isOpen) return 0;
    try {
      return _settingsBox!.get(themeKey, defaultValue: 0) as int;
    } catch (_) {
      return 0;
    }
  }

  Future<void> saveThemeModeIndex(int modeIndex) async {
    if (_settingsBox == null || !_settingsBox!.isOpen) return;
    try {
      await _settingsBox!.put(themeKey, modeIndex);
    } catch (e) {
      debugPrint('Error saving theme to Hive: $e');
    }
  }

  // Projects Storage
  List<Map<String, dynamic>>? getSavedProjects() {
    if (_projectsBox == null || !_projectsBox!.isOpen) return null;
    try {
      final rawData = _projectsBox!.get(projectsDataKey);
      if (rawData is List) {
        return rawData
            .map((item) => Map<String, dynamic>.from(item as Map))
            .toList();
      }
    } catch (e) {
      debugPrint('Error reading projects from Hive: $e');
    }
    return null;
  }

  Future<void> saveProjects(List<Map<String, dynamic>> projects) async {
    if (_projectsBox == null || !_projectsBox!.isOpen) return;
    try {
      await _projectsBox!.put(projectsDataKey, projects);
    } catch (e) {
      debugPrint('Error saving projects to Hive: $e');
    }
  }

  Future<void> clearAll() async {
    if (_settingsBox != null && _settingsBox!.isOpen) {
      await _settingsBox!.clear();
    }
    if (_projectsBox != null && _projectsBox!.isOpen) {
      await _projectsBox!.clear();
    }
  }
}
