import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primary,
  primarySwatch: Colors.orange,
  scaffoldBackgroundColor: AppColors.dark,
  textTheme: GoogleFonts.openSansTextTheme(),
);

ThemeData lightTheme = ThemeData();
