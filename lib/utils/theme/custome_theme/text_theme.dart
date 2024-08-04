import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MTextTheme {
  MTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14,
      color: MColors.textSecondary,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 17,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}
