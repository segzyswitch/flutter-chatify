import 'package:chatify/components/my_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // form inputs
  final userName = TextEditingController();
  final passWord = TextEditingController();
  final confirmPassword = TextEditingController();

  // Sign in method
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
    if (passWord.text != confirmPassword.text) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Oops 🤦‍♂️'),
            content: Text( 'Passwords do not match!' ),
          );
        }
      );
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userName.text,
        password: passWord.text,
      );
      userName.clear();
      passWord.clear();
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Request failed'),
            content: Text( e.message ?? 'An unknown error occurred, try again' ),
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 60
              ),

              const SizedBox(height: 40),

              Text(
                'Let\'s create an account for you',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              
              const SizedBox(height: 30),
              
              MyInput(
                controller: userName,
                hintText: 'Email Address',
                obscureText: false
              ),
              
              const SizedBox(height: 15),

              MyInput(
                controller: passWord,
                hintText: 'Password',
                obscureText: true
              ),
              
              const SizedBox(height: 15),

              MyInput(
                controller: confirmPassword,
                hintText: 'Confirm Password',
                obscureText: true
              ),
              
              const SizedBox(height: 30),

              GestureDetector(
                onTap: signUserUp,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal:25,
                    vertical: 20
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  )
                )
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ]
          ),
        )
      )
    );
  }
}