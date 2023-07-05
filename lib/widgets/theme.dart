// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class mytheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      primaryTextTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      ).apply(
        bodyColor: Colors.black, // Set the default text color to black
      ),
      canvasColor: creamcolor,
      cardColor: Colors.white,
      hintColor: darkbluish,
        buttonTheme: ButtonThemeData(
        buttonColor: darkbluish,
      ),
         colorScheme: ColorScheme.fromSwatch(
        accentColor: darkbluish,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        toolbarTextStyle: TextStyle(
          color: Colors.black, // Change the app bar title text color here
        ),
        titleTextStyle: TextStyle(
          color: Colors.black, // Change the app bar title text color here
        ),
      ));

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
      colorScheme: Theme.of(context).colorScheme.copyWith(
    brightness: Brightness.dark, // Set the brightness in the color scheme
    secondary: Vx.white, // Set the accent color
  ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      primaryTextTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      ).apply(
        bodyColor: Colors.white, // Set the default text color to black
      ),
      canvasColor: darkcreamcolor,
      cardColor: Colors.black,
      hintColor: lightbluish,
      buttonTheme: ButtonThemeData(


        buttonColor: lightbluish,
      ),
      
   
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        toolbarTextStyle: TextStyle(
          color: Colors.white, // Change the app bar title text color here
        ),
        titleTextStyle: TextStyle(
          color: Colors.white, // Change the app bar title text color here
        ),
      ));
  //colors

  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkcreamcolor = Vx.gray800;
  static Color darkbluish = Color(0xff403b58);
  static Color lightbluish = Vx.indigo500;
}
