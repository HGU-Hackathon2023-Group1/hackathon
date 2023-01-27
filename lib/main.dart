import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon/pages/addPage.dart';
import 'package:hackathon/pages/myPage.dart';
import 'package:hackathon/pages/transactionStatus.dart';
import 'package:hackathon/provider/productProvider.dart';
import 'package:hackathon/provider/userProvider.dart';
import 'package:provider/provider.dart';

import "firebase_options.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import 'functions/loginStream.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "blockchain test",
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      home: LoginStream().handleAuthState(),

      initialRoute: '/',
      routes: {
        // '/splash/init': (context) => const InitPage(),
        '/pages/addPage' : (context) => const AddPage(),
        '/pages/transaction' : (context) => const TransactionStatus(),
      },
    );
  }
}
