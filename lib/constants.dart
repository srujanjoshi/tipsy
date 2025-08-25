import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:tipsy/theme_manager.dart';

// Global variable to hold current color scheme
// This will be updated when theme changes
AppColorScheme currentColorScheme = ThemeManager.lightColorScheme;

// Dynamic color getters that use current color scheme
Color get kAppBarColor => currentColorScheme.appBarColor;
Color get kTipsyTextColor => currentColorScheme.tipsyTextColor;
Color get kBackgroundColor => currentColorScheme.backgroundColor;
Color get kHeadingTextColor => currentColorScheme.headingTextColor;
Color get kDollarSignColor => currentColorScheme.dollarSignColor;
Color get kInputTextColor => currentColorScheme.inputTextColor;
Color get kTextFieldUnderlineColor => currentColorScheme.textFieldUnderlineColor;
Color get kInactiveTipAmountTextColor => currentColorScheme.inactiveTipAmountTextColor;
Color get kActiveTipAmountTextColor => currentColorScheme.activeTipAmountTextColor;
Color get kActiveTipAmountBubbleColor => currentColorScheme.activeTipAmountBubbleColor;
Color get kInactiveTipAmountBubbleColor => currentColorScheme.inactiveTipAmountBubbleColor;
Color get kSplitTextColor => currentColorScheme.splitTextColor;
Color get kResultCardColor => currentColorScheme.resultCardColor;
Color get kResultCardTextColor => currentColorScheme.resultCardTextColor;
Color get kResultCardAmountTextColor => currentColorScheme.resultCardAmountTextColor;

// Dynamic text style that uses current color scheme
TextStyle get kInputTextStyle => TextStyle(
  color: currentColorScheme.inputTextColor,
  fontWeight: FontWeight.w700
);

// Helper function to update the current color scheme
// This will be called when the theme changes
void updateColorScheme(AppColorScheme newColorScheme) {
  currentColorScheme = newColorScheme;
}

// Helper function to update color scheme based on theme mode
void updateTheme(ThemeMode themeMode) {
  currentColorScheme = ThemeManager.getColorScheme(themeMode);
}


