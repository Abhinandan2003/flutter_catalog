

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/cartpage.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme:mytheme.LightTheme(context),
      darkTheme: mytheme.DarkTheme(context),
   
      debugShowCheckedModeBanner: false,
      initialRoute: Myroutes.loginroute,

      routes: {
        "/": (context) => const LoginPage(),
        Myroutes.loginroute: (context) => const LoginPage(),
        Myroutes.homeroute: (context) => const HomePage(),
        Myroutes.cartpageroute: (context) => const Cartpage()
      },
    );
  }
}
