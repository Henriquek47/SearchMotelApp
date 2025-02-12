import 'package:flutter/material.dart';
import 'package:guia_motel/core/style/colors_app.dart';

ThemeData lightMode = ThemeData(
  fontFamily: 'Kodchasan',
  brightness: Brightness.light,
  primaryColor: ColorsApp.instance.primary,
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorsApp.instance.primary,
    brightness: Brightness.light,
  ).copyWith(
    secondary: ColorsApp.instance.secondary,
    error: ColorsApp.instance.errorColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorsApp.instance.neutralWhite,
    foregroundColor: ColorsApp.instance.primary,
  ),
  scaffoldBackgroundColor: ColorsApp.instance.neutralWhite,
);

ThemeData darkMode = ThemeData(
  fontFamily: 'Kodchasan',
  brightness: Brightness.dark,
  primaryColor: ColorsApp.instance.primaryDark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorsApp.instance.primaryDark,
    brightness: Brightness.dark,
  ).copyWith(
    secondary: ColorsApp.instance.secondaryDark,
    error: ColorsApp.instance.errorColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorsApp.instance.neutralShade600,
    foregroundColor: ColorsApp.instance.secondary,
  ),
  scaffoldBackgroundColor: ColorsApp.instance.neutralShade600,
);
