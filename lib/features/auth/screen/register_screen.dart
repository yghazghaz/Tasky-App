import 'package:flutter/material.dart';
import 'package:tasky/features/auth/widgets/text_form_widget.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100, right: 24, left: 24),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 11,
          children: [
            Text(
              "Register",
              style: TextStyle(
                color: Color(0xff404147),
                fontSize: 32,
                fontWeight: .bold,
              ),
            ),
            TextFormFieldWidget(
              title: "Username",
              hintText: "enter username...",
              controller: TextEditingController(),
            ),
            TextFormFieldWidget(
              title: "Email",
              hintText: "enter email...",
              controller: TextEditingController(),
            ),
            TextFormFieldWidget(
              title: "Password",
              hintText: "enter password...",
              controller: TextEditingController(),
              isPassword: true,
              obscureText: true,
            ),
            TextFormFieldWidget(
              title: "Confirm password",
              hintText: "enter confirm password...",
              controller: TextEditingController(),
              isPassword: true,
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
