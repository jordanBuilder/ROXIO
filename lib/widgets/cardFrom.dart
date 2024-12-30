// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields
import "package:flutter/material.dart";

class CardForm extends StatelessWidget {
  CardForm({super.key});

  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your full name",
              labelText: "Full Name",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 24, 174, 29), width: 2.0),
              ),
            ),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your full card number",
              labelText: "Card Number",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 24, 174, 29), width: 2.0),
              ),
            ),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          Row(children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your expiry date",
                  labelText: "12 / 2022",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 24, 174, 29),
                        width: 2.0),
                  ),
                ),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "CVV",
                  labelText: "010",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 24, 174, 29),
                        width: 2.0),
                  ),
                ),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 10),
          ]),
          SizedBox(height: 60),
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
                  "Add Card",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
              ),
            ),
          ), 
        ],
        
      ),
    );
  }
}
