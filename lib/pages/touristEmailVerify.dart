// ignore_for_file: file_names

import 'package:aitourism/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TouristEmailVerify extends StatefulWidget {
  const TouristEmailVerify({Key? key}) : super(key: key);

  @override
  State<TouristEmailVerify> createState() => _MyHomePageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool? _success;
String? _userEmail;

class _MyHomePageState extends State<TouristEmailVerify> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SizedBox(
            width: width * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Turist Girişi',
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "E mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
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
                    child: const Text('Submit'),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    _success == null
                        ? ''
                        : (_success!
                            ? 'Successfully registered ' + _userEmail!
                            : 'Registration failed'),
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

    //   body: Center(
    //     child: SizedBox(
    //       width: width * 0.85,
    //       child: Form(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             SizedBox(height: height * 0.12),
    //             const Text(
    //               "Verification Code",
    //               style: TextStyle(fontSize: 28, fontFamily: "Plus Jakarta"),
    //             ),
    //             SizedBox(height: height * 0.01),
    //             const Text(
    //               "We have sent the verification code to",
    //               style: TextStyle(fontSize: 14, fontFamily: "Plus Jakarta",color: Colors.grey),
    //             ),
    //             SizedBox(height: height * 0.01),
    //             Row(
    //               children:  [
    //                  const Text(
    //                   "+905*****5768",
    //                   style: TextStyle(fontSize: 14, fontFamily: "Plus Jakarta",),
    //                 ),
    //                 SizedBox(width: width*0.05),
    //                 const Text(
    //                   "Change phone number?",
    //                   style: TextStyle(fontSize: 14, fontFamily: "Plus Jakarta",color: Colors.blue),
    //                 ),
    //               ],
    //             ),
    //             SizedBox(height: height * 0.03),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 SizedBox(
    //                   width: 64,
    //                   height: 68,
    //                   child: TextFormField(
    //                     onChanged: (value) => {
    //                       if (value.length == 1)
    //                         {FocusScope.of(context).nextFocus()}
    //                     },
    //                     decoration: const InputDecoration(
    //                       border: OutlineInputBorder(
    //                         borderRadius:
    //                             BorderRadius.all(Radius.circular(12.0)),
    //                         borderSide: BorderSide(color: Colors.transparent),
    //                       ),
    //                     ),
    //                     style: Theme.of(context).textTheme.headline6,
    //                     textAlign: TextAlign.center,
    //                     keyboardType: TextInputType.number,
    //                     inputFormatters: [
    //                       LengthLimitingTextInputFormatter(1),
    //                       FilteringTextInputFormatter.digitsOnly,
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: 64,
    //                   height: 68,
    //                   child: TextFormField(
    //                     onChanged: (value) => {
    //                       if (value.length == 1)
    //                         {FocusScope.of(context).nextFocus()}
    //                       else if (value.isEmpty)
    //                         {FocusScope.of(context).previousFocus()}
    //                     },
    //                     decoration: const InputDecoration(
    //                       border: OutlineInputBorder(
    //                         borderRadius:
    //                             BorderRadius.all(Radius.circular(12.0)),
    //                         borderSide: BorderSide(color: Colors.transparent),
    //                       ),
    //                     ),
    //                     style: Theme.of(context).textTheme.headline6,
    //                     textAlign: TextAlign.center,
    //                     keyboardType: TextInputType.number,
    //                     inputFormatters: [
    //                       LengthLimitingTextInputFormatter(1),
    //                       FilteringTextInputFormatter.digitsOnly,
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: 64,
    //                   height: 68,
    //                   child: TextFormField(
    //                     onChanged: (value) => {
    //                       if (value.length == 1)
    //                         {FocusScope.of(context).nextFocus()}
    //                       else if (value.isEmpty)
    //                         {FocusScope.of(context).previousFocus()}
    //                     },
    //                     decoration: const InputDecoration(
    //                       border: OutlineInputBorder(
    //                         borderRadius:
    //                             BorderRadius.all(Radius.circular(12.0)),
    //                         borderSide: BorderSide(color: Colors.transparent),
    //                       ),
    //                     ),
    //                     style: Theme.of(context).textTheme.headline6,
    //                     textAlign: TextAlign.center,
    //                     keyboardType: TextInputType.number,
    //                     inputFormatters: [
    //                       LengthLimitingTextInputFormatter(1),
    //                       FilteringTextInputFormatter.digitsOnly,
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: 64,
    //                   height: 68,
    //                   child: TextFormField(
    //                     onChanged: (value) => {
    //                       if (value.isEmpty)
    //                         {FocusScope.of(context).previousFocus()}
    //                     },
    //                     decoration: const InputDecoration(
    //                         border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.all(Radius.circular(12.0)),
    //                       borderSide: BorderSide(
    //                         color: Colors.transparent,
    //                       ),
    //                     )),
    //                     style: Theme.of(context).textTheme.headline6,
    //                     textAlign: TextAlign.center,
    //                     keyboardType: TextInputType.number,
    //                     inputFormatters: [
    //                       LengthLimitingTextInputFormatter(1),
    //                       FilteringTextInputFormatter.digitsOnly,
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const Spacer(),
    //             const Divider(
    //               thickness: 1,
    //               color: Colors.grey,
    //               height: 1,
    //             ),
    //             SizedBox(
    //               height: height * 0.02,
    //             ),
    //             SizedBox(
    //               height: height * 0.13,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   CupertinoButton(
    //                     child: const Text("Resend",
    //                         style: TextStyle(fontFamily: "Plus Jakarta")),
    //                     onPressed: () {},
    //                   ),
    //                   CupertinoButton(
    //                       child: const Text("Confirm",style: TextStyle(fontFamily: "Plus Jakarta")),
    //                       onPressed: () {},
    //                       color: Colors.blue),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  