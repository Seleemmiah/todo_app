// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // two things to have when creating a button
  // 1. button name
  final String text;
  // 2.  onpressed
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text, 
    required this.onPressed , 
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
