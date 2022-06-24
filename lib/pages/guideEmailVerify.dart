// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aitourism/main.dart';

class GuideEmailVerify extends StatefulWidget {
  const GuideEmailVerify({Key? key}) : super(key: key);

  @override
  State<GuideEmailVerify> createState() => _MyGuideEmailVerifyPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool? _success;
String? _userEmail;
var acs = ActionCodeSettings(
    url: 'https://aitourism-a6ea3.web.app',
    handleCodeInApp: true,
    iOSBundleId: 'com.fuasl.aitourism',
    androidPackageName: 'com.fuasl.aitourism',
    androidInstallApp: true,
    androidMinimumVersion: '12');

class _MyGuideEmailVerifyPageState extends State<GuideEmailVerify> {
  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

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
              children: <Widget>[
                
                const SizedBox(height: 30),
                const Text(
                  'Rehber Öğrenci Girişi',
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 30),
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
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Alanı boş bırakmayınız!';
                    }
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
                      child: ElevatedButton(
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
                                  debugPrint('doğrulama maili gönderildi.');
                                }).catchError((error) {
                                  debugPrint('doğrulama maili gönderilemedi.');
                                  debugPrint(error.toString());
                                  // Error occurred. Inspect error.code.
                                });
                              }
                              setState(() {
                                _success = true;
                                _userEmail = user.email;
                              });
                            } else {
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
                                _userEmail = user.email;
                              });
                            } else {
                              setState(() {
                                _success = true;
                              });
                            }
                          }
                        },
                        child: const Text('Giriş Yap'),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    _success == null
                        ? ''
                        : (_success!
                            ? _userEmail! +
                                ' maili başarıyla kaydedildi, şimdi giriş yap tuşuna basabilirsiniz.'
                            : 'Kayıt tamamlanamadı'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
