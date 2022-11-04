// import 'dart:ffi';
//
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:uki_flutter/ramayana_home.dart';
// import 'package:uki_flutter/ramayana_home2.dart';
// import 'package:uki_flutter/ramayana_profile.dart';
// import 'package:uki_flutter/ramayana_signup.dart';
// import 'package:uki_flutter/service/SP_service/SP_service.dart';
// import 'package:uki_flutter/service/API_service/API_service.dart';
// import 'package:dio/dio.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
//
// class RamayanaLogin extends StatefulWidget {
//   @override
//   _RamayanaLogin createState() => _RamayanaLogin();
// }
//
// class _RamayanaLogin extends State<RamayanaLogin> {
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final controller_username = TextEditingController();
//   final controller_password = TextEditingController();
//   var dio = Dio();
//
//   UserData userData = UserData();
//
//   Future<void> fetchUser() async {
//     print('onta');
//     APIUserService apiUserService = APIUserService();
//     if (controller_username.text == null ||
//         controller_username.text == '' ||
//         controller_password.text == null ||
//         controller_password.text == '') {
//       showWarning();
//       return;
//     }
//
//     var result = await apiUserService.loginUser(
//         user: controller_username.text, pass: controller_password.text);
//     print('Jogja Hebat');
//     switch (result) {
//       case 0:
//         if (userData.getAdminStatus()) {
//           print('Kamalud');
//           print('Dewi Persik');
//           Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(builder: (context) => RamayanaProfile()),
//               (Route<dynamic> route) => false);
//           print('Masuk ke sini Profil');
//         } else {
//           print('Steven William');
//           Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(builder: (context) => RamayanaHome2()),
//               (Route<dynamic> route) => false);
//           print('Masuk ke Sini Ramayana');
//         }
//         break;
//       case 1:
//         controller_username.clear();
//         controller_password.clear();
//         setState(() {});
//         break;
//       case 3:
//         break;
//       default:
//         break;
//     }
//   }
//
//   void showWarning() {}
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: 1200,
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 168, 3, 3),
//             ),
//           ),
//           ListView(
//             children: [
//               Container(
//                 margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
//                 height: 200,
//                 width: 400,
//                 // decoration: BoxDecoration(
//                 //   // color: Color.fromARGB(255, 230, 230, 230),
//                 //   borderRadius: BorderRadius.circular(10),
//                 // //),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Image.asset(
//                       "assets/ram.png",
//                       height: 200,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 60),
//               Container(
//                 margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: <Widget>[
//                       TextFormField(
//                         style: TextStyle(color: Colors.white, fontSize: 25),
//                         //validator: RequiredValidator(errorText: "Wajib Diisi!"),
//                         validator: (value) {
//                           if (value != 'jogjatim') {
//                             return 'Enter valid username';
//                           }
//                         },
//                         controller: controller_username,
//                         keyboardType: TextInputType.multiline,
//                         decoration: InputDecoration(
//                             errorStyle: TextStyle(color: Colors.white),
//                             labelStyle: TextStyle(color: Colors.white),
//                             prefixIcon: Icon(
//                               Icons.person,
//                               color: Colors.white,
//                             ),
//                             hintText: 'Username',
//                             hintStyle: TextStyle(color: Colors.white)),
//                       ),
//                       SizedBox(height: 10),
//                       TextFormField(
//                         //validator: RequiredValidator(errorText: "Wajib Diisi!"),
//                         validator: (value) {
//                           if (value != 'jogjatim') {
//                             return 'Enter valid password';
//                           }
//                         },
//                         obscureText: true,
//                         controller: controller_password,
//                         keyboardType: TextInputType.multiline,
//                         style: TextStyle(color: Colors.white, fontSize: 25),
//                         decoration: InputDecoration(
//                             errorStyle: TextStyle(color: Colors.white),
//                             labelStyle: TextStyle(color: Colors.white),
//                             prefixIcon: Icon(
//                               Icons.lock,
//                               color: Colors.white,
//                             ),
//                             hintText: 'Password',
//                             hintStyle: TextStyle(color: Colors.white)),
//                       ),
//                       SizedBox(height: 30),
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'Forgot Pasword ?',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       MaterialButton(
//                         padding: EdgeInsets.symmetric(),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                         color: Colors.red,
//                         onPressed: () async {
//                           if (_formKey.currentState!.validate()) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 backgroundColor: Colors.white,
//                                 content: Text(
//                                   'Login sukses!',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             );
//                             await fetchUser();
//                             print('huhu');
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 backgroundColor: Colors.white,
//                                 content: Text(
//                                   'Cek Lagi Username dan Password',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }
//                         },
//                       ),
//                       SizedBox(height: 5),
//                       Container(
//                           margin: EdgeInsets.only(left: 120),
//                           child: Row(
//                             children: [
//                               Text('Belum Punya Akun?',
//                                   style: TextStyle(fontSize: 18)),
//                               TextButton(
//                                   child: Text(
//                                     'Daftar',
//                                     style: TextStyle(
//                                         //color: Colors.blue
//                                         fontSize: 18),
//                                   ),
//                                   onPressed: () {
//                                     Navigator.push(context,
//                                         MaterialPageRoute(builder: (context) {
//                                       return RamayanaSignup();
//                                     }));
//                                   })
//                             ],
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
