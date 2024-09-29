import 'package:flutter/material.dart';

import '../utils/color.dart';

final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.indigo,
    primaryColor: PRIMARY_COLOR,
    scaffoldBackgroundColor: BACKGROUND_COLOR,
    appBarTheme: const AppBarTheme(
      backgroundColor: PRIMARY_COLOR,
      foregroundColor: Colors.white,
    ));

final ThemeData dartkTheme = ThemeData(
  brightness: Brightness.dark,
);
