import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../shared/resources/color_manager.dart';
import '../shared/resources/routes_manager.dart';
import '../shared/resources/theme_manager.dart';
import 'provider/theme_provider.dart';

class MyApp extends StatefulWidget {
  //to create singleton instance of MyApp
  //need to create name constructor
  MyApp._internal();

  factory MyApp() =>
      MyApp._internal(); //this to help to create singleton instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        // designSize: const Size(400, 860),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return Consumer(builder: (context, ref, _) {
            final themeMode = ref.watch(themeNotifierProvider);
            _updateSystemUiOverlay(themeMode == ThemeMode.dark);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorObservers: [FlutterSmartDialog.observer],
              builder: FlutterSmartDialog.init(),
              theme: getLightAppTheme(),
              darkTheme: getDarkAppTheme(),
              themeMode: themeMode,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: Routes.splashRoute,
            );
          });
        });
  }

  void _updateSystemUiOverlay(bool isDarkMode) {
    print(isDarkMode);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: isDarkMode
            ? ColorManager.shadowColor
            : ColorManager.background, // Set background color for status bar
        statusBarBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark, // Icon brightness
      ),
    );
  }
}
