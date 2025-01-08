// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:roxio/screens/auth_page.dart';
import 'package:roxio/screens/destination_page.dart';
import 'package:roxio/screens/rating_page.dart';
import 'package:roxio/screens/signup_page.dart';
import 'package:roxio/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home : SplashScreen(),
    );
  }
}
