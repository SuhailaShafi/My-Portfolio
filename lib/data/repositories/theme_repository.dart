import 'package:flutter/material.dart';
import '../local/hive_service.dart';

class ThemeRepository {
  final HiveService _hiveService;

  ThemeRepository(this._hiveService);

  ThemeMode getSavedThemeMode() {
    final index = _hiveService.getThemeModeIndex();
    switch (index) {
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      case 0:
      default:
        return ThemeMode.system;
    }
  }

  Future<void> saveThemeMode(ThemeMode mode) async {
    int index;
    switch (mode) {
      case ThemeMode.light:
        index = 1;
        break;
      case ThemeMode.dark:
        index = 2;
        break;
      case ThemeMode.system:
        index = 0;
        break;
    }
    await _hiveService.saveThemeModeIndex(index);
  }
}
