import 'package:flutter/material.dart';
import 'package:money_manager/utils/theme/custome_theme/elevated_button_theme.dart';
import 'package:money_manager/utils/theme/custome_theme/text_field_theme.dart';
import 'package:money_manager/utils/theme/custome_theme/text_theme.dart';

import '../constants/colors.dart';

class MoneyManagerAppTheme {
  MoneyManagerAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    inputDecorationTheme: MTextFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
    scaffoldBackgroundColor: MColors.primaryBackground,
    appBarTheme: const AppBarTheme(color: MColors.primaryBackground),
    colorScheme: const ColorScheme.light(primary: MColors.primary),
    textTheme: MTextTheme.lightTextTheme,
  );
}
