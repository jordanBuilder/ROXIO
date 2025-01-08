// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roxio/screens/rating_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 5), () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => RatingPage()),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "R\n",
              style: TextStyle(fontSize: 200, color: Colors.green),
            ),
            TextSpan(
              text: "ROXIO",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w100),
            ),
          ])),
        ));
  }
}
