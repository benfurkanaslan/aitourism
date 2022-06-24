// ignore_for_file: file_names

import 'package:flutter/material.dart';

class WaitingPage extends StatefulWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              child: Image.asset('assets/images/logo-1.png'),
              width: width * 0.7,
            ),
          ],
        ),
      ),
    );
  }
}
