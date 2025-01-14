import 'package:chatify/components/my_drawer.dart';
import 'package:chatify/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Firestore
  final FirestoreService firestoreService = FirestoreService();
  
  final user = FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatify'),
      ),
      drawer: MyDrawer(),
    );
  }
}