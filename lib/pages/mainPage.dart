// ignore_for_file: file_names

import 'package:aitourism/main.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<bool?> emailVerified() async {
    bool? x = auth.currentUser?.emailVerified;
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: emailVerified(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const CircularProgressIndicator.adaptive();
                } else {
                  return ((){
                    if (snapshot.data) {
                      return Text('"${auth.currentUser?.email}" doğrulandı');
                    } else {
                      return const Text('E mail doğrulanmadı');
                    }
                  }());
                }
              },
            ),
            // Text(auth.currentUser?.emailVerified.toString()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {auth.signOut()},
              child: const Text('logout'),
            ),
          ],
        ),
      ),
    );
  }
}
