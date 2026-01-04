import 'dart:async';

import 'package:books_store/helpers/consts.dart';
import 'package:books_store/widgets/cickables/main_button.dart';
import 'package:books_store/widgets/inputs/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login to explore Books", style: displayMedium),

              TextFieldWidget(
                label: "Username",
                controller: usernameController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "username is required";
                  }

                  return null;
                },
              ),
              TextFieldWidget(
                prefixWidget: GestureDetector(
                  child: Icon(Icons.phone, color: primaryColor),
                ),
                label: "Phone",
                keyboardType: TextInputType.phone,
                controller: phoneController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "phone is required";
                  }

                  if (v.length != 10) {
                    return "phone must bet 10 digits";
                  }

                  return null;
                },
              ),
              TextFieldWidget(
                suffixWidget: Icon(
                  Icons.remove_red_eye,
                  color: primaryColor,
                  size: 22,
                ),
                label: "Password",
                controller: passwordController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "password is required!";
                  }
                  if (v.length < 8) {
                    return "password must be 8 chars least!";
                  }
                  return null;
                },
              ),

              MainButton(
                busy: false,
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                },
                title: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
