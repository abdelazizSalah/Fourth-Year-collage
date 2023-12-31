import 'package:flutter/material.dart';
import 'package:front_end_code/data/routes.dart';
import 'package:front_end_code/networks/constant_end_points.dart';
import 'package:front_end_code/networks/dio_helper.dart';
import 'package:front_end_code/screens/home_page_screen.dart';
import 'package:front_end_code/screens/login_screen.dart';
import 'package:front_end_code/shared_preferences.dart/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  DioHelper.init();
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final routes = {'' : (ctx)=>'sf'};
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    role = 'Fan';
    return MaterialApp(
      title: 'EPL Reservo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            background: const Color.fromARGB(207, 0, 0, 0),
            seedColor: Colors.white,
            inversePrimary: Colors.black),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w500,
            fontFamily: 'RubikBubbles',
            color: Colors.red,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            // fontWeight: FontWeight.w500,
            fontFamily: 'RubikBubbles',
            color: Colors.red,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'EPL Reservo'),
      // home: const MyHomePage(t),
      routes: routes,
    );
  }
}
