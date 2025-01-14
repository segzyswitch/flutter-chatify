import 'package:chatify/pages/home_page.dart';
import 'package:chatify/pages/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  
  // sign out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(child: Center(
                child: Icon(
                  Icons.message,
                  color: Colors.grey[600],
                  size: 50,
                ),
              )),

              Padding(padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 10,
                  top: 15
                ),
                child: ListTile(
                  title: const Text('H O M E'),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ),

              Padding(padding: EdgeInsets.only(left: 15, right: 15),
                child: ListTile(
                  title: const Text('S E T T I N G S'),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsPage()),
                    );
                  },
                ),
              ),
            ],
          ),

          Padding(padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: ListTile(
              title: const Text('L O G O U T'),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
                signUserOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}