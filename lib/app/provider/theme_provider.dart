import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/app/app_prefs.dart';
import 'package:template/app/service_locator.dart';

// Define constants for theme preferences
const String themePreferenceKey = 'isDarkMode';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light) {
    _loadThemeFromPreferences();
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    await _saveThemeToPreferences(isDarkMode);
  }

  Future<void> _loadThemeFromPreferences() async {
    var isDarkMode = await locator<AppPreferences>()
            .getDataToSharedPref(key: themePreferenceKey) ??
        false;
    state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> _saveThemeToPreferences(bool isDarkMode) async {
    await locator<AppPreferences>()
        .setDataToSharedPref(key: themePreferenceKey, value: isDarkMode);
  }
}

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});
