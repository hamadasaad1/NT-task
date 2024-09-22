import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/provider/theme_provider.dart';

class ChangeThemeWidget extends ConsumerWidget {
  const ChangeThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeNotifierProvider.notifier);

    final isDarkMode = ref.watch(themeNotifierProvider) == ThemeMode.dark;

    return SwitchListTile(
      title: Text(
        isDarkMode ? 'Light' : 'Dark',
        // style: TextStyle(),
      ),
      value: isDarkMode,
      onChanged: (value) {
        themeNotifier.toggleTheme(value);
      },
    );
  }
}
