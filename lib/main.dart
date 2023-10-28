import 'package:covidstat/screens/countries.dart';
import 'package:covidstat/screens/datascreen.dart';
import 'package:covidstat/screens/home.dart';
import 'package:covidstat/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => Home(),
        '/datascreen': (context) => DataScreen(),
        '/countries': (context) => Countries()
      },
    );
  }
}
