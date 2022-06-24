import 'package:aitourism/main.dart';
import 'package:aitourism/pages/loginPage.dart';
import 'package:aitourism/pages/mainPage.dart';
import 'package:aitourism/pages/waitingPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? page;
  User? user;
  @override
  void initState() {
    super.initState();
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('user boş');
        setState(() {
          page = 'login';
        });
      } else {
        debugPrint('user boş değil');
        debugPrint(user.uid);
        this.user = user;
        setState(() {
          page = 'main';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 'login':
        {
          return const LoginPage();
        }
      case 'main':
        {
          return const MainPage();
        }
      default:
        {
          return const WaitingPage();
        }
    }
  }
}
