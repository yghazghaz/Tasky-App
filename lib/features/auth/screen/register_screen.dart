import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky/features/auth/screen/login_screen.dart';
import 'package:tasky/features/auth/widgets/text_form_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100, right: 24, left: 24),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 24,
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
              controller: usernameController,
            ),
            TextFormFieldWidget(
              title: "Email",
              hintText: "enter email...",
              controller: emailController,
            ),
            TextFormFieldWidget(
              title: "Password",
              hintText: "enter password...",
              controller: passwordController,
              isPassword: true,
              obscureText: true,
            ),
            TextFormFieldWidget(
              title: "Confirm password",
              hintText: "enter confirm password...",
              controller: confirmPasswordController,
              isPassword: true,
              obscureText: true,
            ),
            SizedBox(height: 104),
            MaterialButton(
              onPressed: () async {
                print("Register button pressed");
                print("Username: ${usernameController.text}");
                print("Email: ${emailController.text}");
                print("Password: ${passwordController.text}");
                print("Confirm Password: ${confirmPasswordController.text}");
                try {
                  final credential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                "Register",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              color: Color(0xff5F33E1),
              textColor: Colors.white,
              minWidth: double.infinity,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff716C7E),
              ),
            ),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff5F33E1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
