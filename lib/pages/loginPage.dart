import 'package:flutter/material.dart';

import '../functions/loginStream.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              LoginStream().signInWithGoogle();
            },
            child: const Text("Google Login")),
      ),
    );
  }
}
