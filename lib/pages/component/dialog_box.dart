// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/pages/component/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              // _controller.clear();
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new task",
                  // textcontroller.clear();
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: 10,
                  )),
            ),
            // buttons => save and cancel
            Center(
              child: Row(
                children: [
                  // save button
                  MyButton(text: "Save", onPressed: (onSave)),

                  const SizedBox(
                    width: 8,
                  ),

                  // cancel button
                  MyButton(
                    text: "Cancel",
                    onPressed: (onCancel),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
