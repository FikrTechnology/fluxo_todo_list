

import 'package:flutter/material.dart';
import 'package:fluxo_todo_list/core/constants/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.blue,
      foregroundColor: AppColors.white,
    ),
    cardColor: AppColors.black,
    dialogBackgroundColor: AppColors.primary,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.black,
      hintStyle: TextStyle(color: AppColors.lightGray),
      labelStyle: TextStyle(color: AppColors.white),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.white),
      displayMedium: TextStyle(color: AppColors.white),
      displaySmall: TextStyle(color: AppColors.white),
      headlineLarge: TextStyle(color: AppColors.white),
      headlineMedium: TextStyle(color: AppColors.white),
      headlineSmall: TextStyle(color: AppColors.white),
      titleLarge: TextStyle(color: AppColors.white),
      titleMedium: TextStyle(color: AppColors.white),
      titleSmall: TextStyle(color: AppColors.white),
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.white),
      bodySmall: TextStyle(color: AppColors.lightGray),
      labelLarge: TextStyle(color: AppColors.white),
      labelSmall: TextStyle(color: AppColors.lightGray),
    ),
  );
}