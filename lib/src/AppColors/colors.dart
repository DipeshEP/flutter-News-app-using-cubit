
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final colors = AppColors();

  static ThemeData define() {
    return ThemeData(
        primaryColor: Color(0xff17202A),
        focusColor:  Color(0xffffffff),
        scaffoldBackgroundColor: Color(0xff17202A)
    );
  }
}