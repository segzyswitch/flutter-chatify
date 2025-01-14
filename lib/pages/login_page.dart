import 'package:flutter/material.dart';
import 'package:chatify/components/my_input.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // form inputs
  final userName = TextEditingController();

  final passWord = TextEditingController();

  // Sign in method
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userName.text,
        password: passWord.text
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
            title: Text('Login failed'),
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
                Icons.lock,
                size: 100
              ),

              const SizedBox(height: 40),

              Text(
                'Welcome back, you\'ve been missed!',
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 10),

              GestureDetector(
                onTap: signUserIn,
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
                    'Sign In',
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
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Register now',
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