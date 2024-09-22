import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'manager_values.dart';
import 'styles_manager.dart';

// Light Theme
ThemeData getLightAppTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    disabledColor: ColorManager.grey,
    colorScheme: const ColorScheme.light(
        secondary: ColorManager.coolGray, primary: ColorManager.primary),
    splashColor: ColorManager.lightPrimary,
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: 0,
      actionsIconTheme: const IconThemeData(color: ColorManager.black),
      iconTheme: const IconThemeData(color: ColorManager.black),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
    ),
    iconTheme: const IconThemeData(color: ColorManager.black),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorManager.white,
    ),
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s18,
        ),
        backgroundColor: ColorManager.primary,
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p16, horizontal: AppPadding.p8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s4,
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
        displayLarge:
            getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
        bodyLarge:
            getRegularStyle(color: ColorManager.black, fontSize: FontSize.s14),
        titleMedium:
            getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
        bodySmall: getRegularStyle(
          color: ColorManager.black,
        ),
        titleSmall: getRegularStyle(
          color: ColorManager.black,
        ),
        bodyMedium: getRegularStyle(
          color: ColorManager.black,
        ),
        displaySmall: getBoldStyle(
          color: ColorManager.black,
        ),
        headlineSmall: getBoldStyle(
          color: ColorManager.black,
        ),
        titleLarge: getBoldStyle(
          color: ColorManager.black,
        ),
        headlineMedium: getBoldStyle(
          color: ColorManager.black,
        )),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
          vertical: AppPadding.p8, horizontal: AppPadding.p16),
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.danger),
      border: const OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.transparent,
      )),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.danger, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}

// Dark Theme
ThemeData getDarkAppTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.darkPrimary,
    disabledColor: ColorManager.darkGrey,
    colorScheme: const ColorScheme.dark(
        secondary: ColorManager.coolGray, primary: ColorManager.darkPrimary),
    splashColor: ColorManager.darkPrimary,
    cardTheme: CardTheme(
      color: ColorManager.black,
      shadowColor: ColorManager.darkGrey,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.shadowColor,
      elevation: AppSize.s4,
      actionsIconTheme: const IconThemeData(color: ColorManager.white),
      iconTheme: const IconThemeData(color: ColorManager.white),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.black,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      shadowColor: ColorManager.black,
      titleTextStyle: getBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorManager.black,
    ),
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.darkGrey,
      buttonColor: ColorManager.darkPrimary,
      splashColor: ColorManager.darkPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s18,
        ),
        backgroundColor: ColorManager.darkPrimary,
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p16, horizontal: AppPadding.p8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s4,
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge:
          getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
      bodyLarge:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s14),
      titleMedium: getMediumStyle(
          color: ColorManager.darkPrimary, fontSize: FontSize.s16),
      bodySmall: getRegularStyle(
        color: ColorManager.white,
      ),
      titleSmall: getRegularStyle(
        color: ColorManager.white,
      ),
      bodyMedium: getRegularStyle(
        color: ColorManager.white,
      ),
      displaySmall: getBoldStyle(
        color: ColorManager.white,
      ),
      headlineSmall: getBoldStyle(
        color: ColorManager.white,
      ),
      titleLarge: getBoldStyle(
        color: ColorManager.white,
      ),
      headlineMedium: getBoldStyle(
        color: ColorManager.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
          vertical: AppPadding.p8, horizontal: AppPadding.p16),
      hintStyle:
          getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.danger),
      border: const OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.transparent,
      )),
      disabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.darkGrey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.darkGrey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.darkPrimary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.danger, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.darkPrimary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
