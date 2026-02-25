
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color primary = Color(0xFF101622);
  static const Color gray = Color(0xFF64748B);
  static const Color lightGray = Color(0xFF94A3B8);
  static const Color blue = Color(0xFF135BEC);
  static const Color purple = Color(0xFF4F46E5);
  static const Color splash = Color(0xFF101622);

  // Secondary Colrs
  static const Color lightning = Color(0xFFA5B4FC);
  static const Color calmOrange = Color(0xFFFDBA74);
  static const Color techBlueGreen = Color(0xFF6EE7B7);
  static const Color mallow = Color(0xFFD8B4FE);
  static const Color red = Color(0xFFEF4444);
  static const Color orange = Color(0xFFD97706);
  static const Color crystalPeak = Color(0xFFDBEAFE);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.blue, AppColors.purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight
  );

  
}