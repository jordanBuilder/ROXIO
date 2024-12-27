// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});

  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: "Nom d' Utilisateur",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
          SizedBox(height: 20),
          IntlPhoneField(
            decoration: InputDecoration(
                labelText: "Numéro de Téléphone",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
          SizedBox(height: 20),
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
                  "M'inscrire",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
