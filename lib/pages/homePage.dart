import 'package:flutter/material.dart';

import '../functions/loginStream.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("home page")),
      body: Center(
        child: TextButton(
          child: const Text("Google Logout"),
          onPressed: () {
            LoginStream().signOut();
          },
        ),
      ),
    );
  }
}
