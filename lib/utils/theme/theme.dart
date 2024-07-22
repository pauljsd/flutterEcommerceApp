import 'package:ecommerce/utils/theme/custom_theme/appbar_theme.dart';
import 'package:ecommerce/utils/theme/custom_theme/button_sheet_theme.dart';
import 'package:ecommerce/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:ecommerce/utils/theme/custom_theme/chip_theme.dart';
import 'package:ecommerce/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:ecommerce/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:ecommerce/utils/theme/custom_theme/text_field_theme.dart';
import 'package:ecommerce/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class PAppTheme {
  PAppTheme._();

  ///light Theme
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      textTheme: PTextTheme.lightTextTheme,
      chipTheme: PChipTheme.lightChipTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: PAppBarTheme.lightAppBarTheme,
      checkboxTheme: PCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: PButtomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: PElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: POutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: PTextFormFieldTheme.lightInputDecorationTheme);

  ///dart theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: PTextTheme.darkTextTheme,
    elevatedButtonTheme: PElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: PAppBarTheme.darkAppBarTheme,
  );
}
