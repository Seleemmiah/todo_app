// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/part/my_button.dart';
import 'package:todo_app/part/my_textfield.dart';
import 'package:todo_app/part/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // textfield controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // checkbox controllers

  // user sign in method

  void SignUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "loginPage",
          style: Theme.of(context).primaryTextTheme.titleMedium,
        ),
      ),
      backgroundColor: Colors.yellow[200],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // logo
              Icon(
                Icons.lock,
                size: 70,
              ),

              const SizedBox(height: 50),
              // welcome we miss you
              Text(
                "Welcome back we missed you!",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username or E-mail',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // remember me checkbox

              //forget password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button 
              MyButton(
                onTap: SignUserIn,
              ),

              const SizedBox(height: 25),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or continue with'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // google or apple sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //goggle image
                  SquareTile(ImagePath: 'lib/image/google.png'),

                  const SizedBox(width: 10),

                  // apple image
                  SquareTile(ImagePath: 'lib/image/apple.png'),
                ],
              ),

              const SizedBox(height: 20),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?"),
                  const SizedBox(width: 4),
                  Text(
                    "Register now",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
