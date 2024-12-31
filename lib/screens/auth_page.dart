import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_numeric_keyboard/flutter_numeric_keyboard.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 120,
                backgroundColor: Color.fromARGB(255, 9, 20, 26),
                child: Icon(
                  Icons.mail_outlined,
                  color: Colors.green,
                  size: 140,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Verification ', style: TextStyle(fontSize: 35)),
                    TextSpan(
                      text: 'Code',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    TextSpan(
                        text: "Please type the verification code\n sent to ",
                        style: TextStyle(fontSize: 15)),
                    TextSpan(
                        text: "+998 555 66 77",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ])),
              SizedBox(
                height: 25,
              ),
              OtpForm()
            ],
          ),
        ),
      ),
    );
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final codeFieldOne = TextEditingController();

  final codeFieldTwo = TextEditingController();

  final codeFieldThree = TextEditingController();

  final codeFieldFour = TextEditingController();

  String otpCode = '';
  // Variable pour stocker le code OTP
  void clearOtpFields() {
    setState(() {
      otpCode = '';
    });
    FocusScope.of(context).unfocus(); // Retire le focus
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 46.0, right: 46.0),
      child: Column(children: [
        Form(
            child: Row(
          children: [
            Expanded(
              child: OtpTextField(
                textStyle: const TextStyle(
                  fontSize: 25,
                ),
                fieldWidth: 60,
                borderRadius: BorderRadius.circular(35),
                numberOfFields: 4,
                fieldHeight: 80,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  otpCode = code;
                  print("Code changé : $code");
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  setState(() {
                    otpCode = verificationCode;
                  });
                  print("Code complet : $verificationCode");
                },
                // end onSubmit
              ),
            ),
          ],
        )),
        // FlutterNumericKeyboard(
        //   width: 400,
        //   height: 300,
        //   showDivider: false,
        //   showResult: false,
        //   resultTextStyle: const TextStyle(
        //       color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        //   resultFunction: (value) {
        //     codeFieldOne.text = value;
        //   },
        //   obscureResult: false,
        //   rightIconBack: const Icon(
        //     Icons.backspace,
        //     color: Colors.blueGrey,
        //   ),
        //   showRightIcon: true,
        //   digitStyle: const TextStyle(
        //       color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        //   backgroundColor: Colors.white,
        // ),
      ]),
    );
  }
}
