// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  // this is the hint of the text that should be entered in the
  // textfeild
  final String hintText;
  // obscure is used mostly in password textfeild
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      //borderSide: BorderSide(color: Colors.white),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.yellow.shade200,
                  filled: true,
                  hintText: hintText,
                  suffixIcon: GestureDetector(
                    onTap: () {},
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
