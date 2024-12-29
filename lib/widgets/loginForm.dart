// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IntlPhoneField(
            decoration: InputDecoration(
                labelText: "Numéro de Téléphone",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF101523),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text(
                  "C'est Parti",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 18),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Je n'ai pas encore de compte !",
              style: TextStyle(color: Color(0xFF101523), fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
