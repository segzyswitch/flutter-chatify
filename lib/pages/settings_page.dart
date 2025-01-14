import 'package:chatify/components/my_drawer.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}