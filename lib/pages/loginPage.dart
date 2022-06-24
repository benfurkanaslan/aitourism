// ignore_for_file: file_names

import 'package:aitourism/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aitourism/pages/guideEmailVerify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool? _success;
String? _warning;
// String? _userEmail;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Rehber Öğrenci Girişi',
      //     // style: TextStyle(fontFamily: 'Plus Jakarta'),
      //   ),
      // ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SizedBox(
            width: width * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  child: Image.asset('assets/images/logo-2.png'),
                  width: width * 0.7,
                ),
                const SizedBox(height: 30),
                const Text(
                  'AI-Alphas',
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 30),
                // email girişi için textfield
                TextFormField(
                  controller: _emailController,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "E mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Alanı boş bırakmayınız!';
                    } else if (!value.contains('edu')) {
                      return 'Üniversite maili giriniz!';
                    }
                    setState(() {
                      _success = false;
                    });
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // şifre girişi için textfield
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: "Şifre",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  //
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Alanı boş bırakmayınız!';
                    }
                    _warning = '';
                    setState(() {
                      _success = false;
                    });
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      alignment: Alignment.center,
                      // kaydol butonu
                      child: ElevatedButton(
                        // tuşa basıldığında e mail doğrulamasının gönderilmesi
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final User? user =
                                (await auth.createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ))
                                    .user;
                            if (user != null) {
                              if (!user.emailVerified) {
                                auth.currentUser
                                    ?.sendEmailVerification(acs)
                                    .then((val) {
                                  // Verification email sent.
                                  _warning = 'Doğrulama e maili gönderildi';
                                  debugPrint('doğrulama maili gönderildi.');
                                }).catchError((error) {
                                  debugPrint('doğrulama maili gönderilemedi.');
                                  debugPrint(error.toString());
                                  // Error occurred. Inspect error.code.
                                });
                              }
                              _warning = 'Doğrulama e maili gönderildi';
                              setState(() {
                                _success = true;
                                // _userEmail = user.email;
                              });
                            } else {
                              _warning = 'Doğrulama e maili gönderilemedi';
                              setState(() {
                                _success = true;
                              });
                            }
                          }
                        },
                        child: const Text('Kaydol'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      alignment: Alignment.center,
                      // giriş yap butonu
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final User? user =
                                (await auth.signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ))
                                    .user;
                            if (user != null) {
                              if (!user.emailVerified) {
                                auth.currentUser
                                    ?.sendEmailVerification(acs)
                                    .then((val) {
                                  // Verification email sent.
                                  debugPrint('doğrulama maili gönderildi.');
                                }).catchError((error) {
                                  debugPrint('doğrulama maili gönderilemedi.');
                                  debugPrint(error.toString());
                                  // Error occurred. Inspect error.code.
                                });
                              }
                              setState(() {
                                _success = true;
                                // _userEmail = user.email;
                              });
                            } else {
                              setState(() {
                                _success = true;
                              });
                            }
                            await firestore
                                .collection('users')
                                .doc(user!.uid)
                                .set({
                              'userName': 'asdasd',
                              'userUid': user.uid,
                              'userEmail': user.email,
                              'userEmailVerified': user.emailVerified,
                              'lastLogin': DateTime.now(),
                            });
                          }
                        },
                        child: const Text('Giriş Yap'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      child: const Text(
                        'Rehber misiniz?',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: (() => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const GuideEmailVerify(),
                            ),
                          )),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    _success == null ? '' : (_warning!),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         ElevatedButton(
    //           onPressed: (() => Navigator.pushAndRemoveUntil(
    //               context,
    //               CupertinoPageRoute(
    //                 builder: (context) => const GuideEmailVerify(),
    //               ),
    //               (route) => true)),
    //           child: const Text('Rehber Girişi'),
    //         ),
    //         const SizedBox(height: 20),
    //         ElevatedButton(
    //           onPressed: (() => Navigator.pushAndRemoveUntil(
    //               context,
    //               CupertinoPageRoute(
    //                 builder: (context) => const TouristEmailVerify(),
    //               ),
    //               (route) => true)),
    //           child: const Text('Turist Girişi'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
