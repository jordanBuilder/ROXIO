// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:roxio/widgets/signupForm.dart";

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarFloatingPage(),
    );
  }
}

class CarFloatingPage extends StatelessWidget {
  const CarFloatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(45.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome To ",
                      style: TextStyle(
                          color: Color(0xFF101523),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Roxio",
                      style: TextStyle(
                          color: Color(0xFF101523),
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SignupForm()
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF101523),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(250),
                  bottomRight: Radius.circular(250),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.4,
            )),
        Positioned(
          top: 139,
          left: (MediaQuery.of(context).size.width - 250) / 2,
          child: Image.asset(
            'assets/images/greenCarTopView.png',
            width: 250,
            height: 250,
          ),
        )
      ],
    );
  }
}
