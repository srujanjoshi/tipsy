import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:tipsy/theme_manager.dart';

// Global variable to hold current color scheme
// This will be updated when theme changes
AppColorScheme currentColorScheme = ThemeManager.lightColorScheme;

// Dynamic text style that uses current color scheme
TextStyle get kInputTextStyle => TextStyle(
  color: currentColorScheme.inputTextColor, 
  fontWeight: FontWeight.w700
);



