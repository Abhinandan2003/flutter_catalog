// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mytheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      primaryTextTheme: GoogleFonts.latoTextTheme( Theme.of(context).textTheme, 
        ).apply(
          bodyColor: Colors.black, // Set the default text color to black
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
       
       )
      );
        static ThemeData DarkTheme(BuildContext context) => ThemeData(brightness: Brightness.dark,
      );
      
  
}