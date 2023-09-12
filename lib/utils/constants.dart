import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();


double getDeviceHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

double getDeviceWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

Widget heightBox(double height) => SizedBox(height: height);

const double smallPadding = 12;
const double mediumPadding = 20;
const double largePadding = 40;

const String dummyImage =  "https://media.istockphoto.com/id/933421794/vector/live-reportage-conceptual-logo-vector-illustration-created-with-microphones-equipment-and.jpg?s=1024x1024&w=is&k=20&c=vEROz2SwUIfLP6kQ1IPz_HHUKvukNctrypczcnbE0xQ=";


showGlobalSnackBar(String text) {
  rootScaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          text,
          style: GoogleFonts.openSans(
            fontSize: 13,
            color: AppColors.light,
          ),
        ),
      ),
    ),
  );
}