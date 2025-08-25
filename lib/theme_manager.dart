import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeMode { light, dark }

class AppColorScheme {
  final Color appBarColor;
  final Color tipsyTextColor;
  final Color backgroundColor;
  final Color headingTextColor;
  final Color dollarSignColor;
  final Color inputTextColor;
  final Color textFieldUnderlineColor;
  final Color inactiveTipAmountTextColor;
  final Color activeTipAmountTextColor;
  final Color activeTipAmountBubbleColor;
  final Color inactiveTipAmountBubbleColor;
  final Color splitTextColor;
  final Color resultCardColor;
  final Color resultCardTextColor;
  final Color resultCardAmountTextColor;

  const AppColorScheme({
    required this.appBarColor,
    required this.tipsyTextColor,
    required this.backgroundColor,
    required this.headingTextColor,
    required this.dollarSignColor,
    required this.inputTextColor,
    required this.textFieldUnderlineColor,
    required this.inactiveTipAmountTextColor,
    required this.activeTipAmountTextColor,
    required this.activeTipAmountBubbleColor,
    required this.inactiveTipAmountBubbleColor,
    required this.splitTextColor,
    required this.resultCardColor,
    required this.resultCardTextColor,
    required this.resultCardAmountTextColor,
  });
}

class ThemeManager {
  static const String _themePreferenceKey = 'theme_preference';
  
  // Light theme colors (current green-based theme)
  static const AppColorScheme lightColorScheme = AppColorScheme(
    appBarColor: Color(0xFFCEF5E6),
    tipsyTextColor: Color(0xFF074e2f),
    backgroundColor: Color(0xFFf8fffd),
    headingTextColor: Color(0xFF9b9c9c),
    dollarSignColor: Color(0xFF188856),
    inputTextColor: Color(0xFF0d8a52),
    textFieldUnderlineColor: Color(0xFFc1c3c3),
    inactiveTipAmountTextColor: Color(0xFF479473),
    activeTipAmountTextColor: Color(0xFFebfffd),
    activeTipAmountBubbleColor: Color(0xFF16A464),
    inactiveTipAmountBubbleColor: Color(0xFFFFFFFF),
    splitTextColor: Color(0xFF0D8A52),
    resultCardColor: Color(0xFFCEF5E6),
    resultCardTextColor: Color(0xFF9AA5A0),
    resultCardAmountTextColor: Color(0xFF0c8a52),
  );

  // Dark theme colors (complementary dark theme with good contrast)
  static const AppColorScheme darkColorScheme = AppColorScheme(
    appBarColor: Color(0xFF1A2E23),
    tipsyTextColor: Color(0xFF8FD4A8),
    backgroundColor: Color(0xFF0F1611),
    headingTextColor: Color(0xFF9B9C9C),
    dollarSignColor: Color(0xFF4CAF50),
    inputTextColor: Color(0xFF66BB6A),
    textFieldUnderlineColor: Color(0xFF424242),
    inactiveTipAmountTextColor: Color(0xFF81C784),
    activeTipAmountTextColor: Color(0xFF0F1611),
    activeTipAmountBubbleColor: Color(0xFF4CAF50),
    inactiveTipAmountBubbleColor: Color(0xFF2C2C2C),
    splitTextColor: Color(0xFF66BB6A),
    resultCardColor: Color(0xFF1A2E23),
    resultCardTextColor: Color(0xFF9AA5A0),
    resultCardAmountTextColor: Color(0xFF66BB6A),
  );

  // Get the current theme preference from SharedPreferences
  static Future<ThemeMode> getThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themePreferenceKey);
    
    if (themeString == 'dark') {
      return ThemeMode.dark;
    }
    return ThemeMode.light; // Default to light theme
  }

  // Save the theme preference to SharedPreferences
  static Future<void> setThemePreference(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themePreferenceKey, themeMode.toString().split('.').last);
  }

  // Get the appropriate color scheme based on the current theme
  static AppColorScheme getColorScheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return darkColorScheme;
      case ThemeMode.light:
      default:
        return lightColorScheme;
    }
  }
}

