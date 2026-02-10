import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky/features/auth/screen/register_screen.dart';
import 'package:tasky/features/auth/widgets/text_form_widget.dart';
import 'package:tasky/features/home/screen/home_screen.dart';

class Login extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 124),
        child: Column(
          spacing: 26,
          crossAxisAlignment: .start,
          children: [
            Text(
              "Login",
              style: TextStyle(
                color: Color(0xff404147),
                fontSize: 32,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 53 - 26),
            TextFormFieldWidget(
              title: "Email",
              hintText: "enter username...",
              controller: widget.emailController,
            ),
            TextFormFieldWidget(
              title: "Password",
              hintText: "enter password...",
              controller: widget.passwordController,
              isPassword: true,
              obscureText: true,
            ),
            SizedBox(height: (71 - 26)),
            MaterialButton(
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
              child: Text(
                "Login",
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
            MaterialPageRoute(builder: (context) => Register()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t have an account?",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff716C7E),
              ),
            ),
            Text(
              "Register",
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
