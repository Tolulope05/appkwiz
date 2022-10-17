import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

// If you want to inherit a Mixin properties in another class,
// You use *with* so as to make the properties available
// for the new class.

mixin SubThemeData {
  TextTheme getTextTheme() {
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(
      color: onSurfaceTextColor,
      size: 16,
    );
  }
}
