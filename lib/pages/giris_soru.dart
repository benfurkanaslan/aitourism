import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class girisSoru extends StatelessWidget {
  const girisSoru({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 35, 71, 121),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Guide App'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/images/logo2.png',
              ),
            ),
            const Text(
              'Uygulamaya hoşgeldiniz!!',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                letterSpacing: 2,
                wordSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Lütfen Giriş Seçeneğini Seçiniz!!',
              style: TextStyle(
                  height: 5.0,
                  fontSize: 20.0,
                  color: Colors.white,
                  letterSpacing: 2,
                  wordSpacing: 2,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: 300,
              child: const Divider(
                color: Colors.white,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed:
                        () {}, // Turist sayfası giriş ekranına yönlendirilir
                    // ignore: prefer_const_constructors
                    child: Text(
                      'Turist girişi',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        height: 2.0,
                        fontSize: 20.0,
                        color: Colors.white,
                        letterSpacing: 2,
                        wordSpacing: 2,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ), //Turist girişi butonu
              ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: () {}, // Öğrenci giriş ekranına yönlendirilir
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Öğrenci girişi',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      height: 2.0,
                      fontSize: 20.0,
                      color: Colors.white,
                      letterSpacing: 2,
                      wordSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  )), //Öğrenci girişi butonu
            ]),
            SizedBox(
                width: 100,
                height: 250,
                child: Image.asset('assets/images/logo3.png'))
          ]),
        ),
      ),
    );
  }
}
