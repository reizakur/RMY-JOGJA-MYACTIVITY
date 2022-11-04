import 'dart:ffi';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:uki_flutter/ramayana_home2.dart';
import 'package:uki_flutter/ramayana_signup.dart';
import 'package:uki_flutter/service/SP_service/SP_service.dart';
import 'package:uki_flutter/service/API_service/API_service.dart';
import 'package:dio/dio.dart';
import 'package:relative_scale/relative_scale.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:uki_flutter/auth_service.dart';
import 'package:uki_flutter/globals.dart';

class RamayanaLogin2 extends StatefulWidget {
  const RamayanaLogin2({super.key});
  @override
  _RamayanaLogin2 createState() => _RamayanaLogin2();
}

class _RamayanaLogin2 extends State<RamayanaLogin2> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _user_name = '';
  String _password = '';

  loginPressed() async {
    if (_user_name.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_user_name, _password);
      Map responseMap = jsonDecode(response.body);
      var temp = responseMap['data'];
      temp = temp['username'];
      print('tutut333');
      print(temp);
      print('UYUY 44');
      print(responseMap['status']);
      print('UYUY 55');

      print(responseMap['username']);
      print(response.statusCode);
      if (responseMap['status'] == 200) {
        print('ioio 77');
        print(responseMap);
        print(responseMap['status']);
        print('iniii 444');
        print(responseMap['data']);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => RamayanaHome2(),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => RamayanaLogin2(),
            ));

        //mass
      }
    }
  }
  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final controller_username = TextEditingController();
  // final controller_password = TextEditingController();
  // var dio = Dio();
  //
  // UserData userData = UserData();
  //
  // Future<void> fetchUser() async {
  //   print('onta');
  //   APIUserService apiUserService = APIUserService();
  //   if (controller_username.text == null ||
  //       controller_username.text == '' ||
  //       controller_password.text == null ||
  //       controller_password.text == '') {
  //     showWarning();
  //     return;
  //   }
  //   var result = await apiUserService.loginUser(
  //       user: controller_username.text, pass: controller_password.text);
  //   print('Jogja Hebat');
  //   switch (result) {
  //     case 0:
  //       if (userData.getAdminStatus()) {
  //         print('Kamalud');
  //         print('Dewi Persik');
  //         Navigator.of(context).pushAndRemoveUntil(
  //             MaterialPageRoute(builder: (context) => RamayanaProfile()),
  //             (Route<dynamic> route) => false);
  //         print('Masuk ke sini Profil');
  //       } else {
  //         print('Steven William');
  //         Navigator.of(context).pushAndRemoveUntil(
  //             MaterialPageRoute(builder: (context) => RamayanaHome2()),
  //             (Route<dynamic> route) => false);
  //         print('Masuk ke Sini Ramayana');
  //       }
  //       break;
  //
  //     case 1:
  //       controller_username.clear();
  //       controller_password.clear();
  //       setState(() {});
  //       break;
  //
  //     case 3:
  //       break;
  //
  //     default:
  //       break;
  //   }
  // }

  // Future <String> _getUserName() async {
  //   UserData userData = UserData();
  //   await userData.getPref();
  //   String userName = userData.getUsernameID();
  //
  //   return userName;
  // }
  // String userNampung = '';
  //
  // Future <String> _getUserPassword() async {
  //   UserData userData = UserData();
  //   await userData.getPref();
  //   String password = userData.getUserPassword();
  //
  //   return password;
  // }
  // String passNampung = '';

  void showWarning() {}

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 1200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            ListView(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: <Color>[
                            Color.fromARGB(255, 168, 3, 3),
                            Color.fromARGB(255, 186, 85, 85)
                          ]),
                      // color: Color.fromARGB(255, 168, 3, 3),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(110),
                          topLeft: Radius.zero,
                          bottomRight: Radius.zero,
                          topRight: Radius.zero)),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
                    height: 200,
                    width: 400,
                    // decoration: BoxDecoration(
                    //   // color: Color.fromARGB(255, 230, 230, 230),
                    //   borderRadius: BorderRadius.circular(10),
                    // //),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/ram.png",
                          height: 120,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  margin: EdgeInsets.fromLTRB(sx(20), 0, sx(20), 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          onChanged: (value) {
                            _user_name = value;
                          },
                          style: TextStyle(color: Colors.black, fontSize: 25),
                          validator:
                              RequiredValidator(errorText: "Wajib Diisi!"),
                          // validator: (value) {
                          //   if (value != '${userData.getUsernameID()}') {
                          //     return 'Enter valid username';
                          //   }
                          // },
                          // controller: controller_username,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          // validator: RequiredValidator(errorText: "Wajib Diisi!"),
                          // validator: (value) {
                          //   if (value != '${userData.getUserPassword()}') {
                          //     return 'Enter valid password';
                          //   }
                          // },
                          onChanged: (value) {
                            _password = value;
                          },
                          obscureText: true,
                          // controller: controller_password,
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(color: Colors.black, fontSize: 25),
                          decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(height: 30),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Pasword ?',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        MaterialButton(
                          height: 50,
                          minWidth: 200,
                          padding: EdgeInsets.symmetric(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          color: Colors.red,
                          onPressed: () => loginPressed(),
                          // onPressed: () async {
                          //   await fetchUser();
                          //   print('yay');
                          //   setState(() {
                          //     if (_formKey.currentState!.validate()) {
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         SnackBar(
                          //           backgroundColor: Colors.white,
                          //           content: Text(
                          //             'Cek Lagi Username dan Password!',
                          //             style: TextStyle(
                          //               color: Colors.black,
                          //             ),
                          //           ),
                          //         ),
                          //       );
                          //     } else {
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         SnackBar(
                          //           backgroundColor: Colors.white,
                          //           content: Text(
                          //             'Login Sukses',
                          //             style: TextStyle(
                          //               color: Colors.black,
                          //             ),
                          //           ),
                          //         ),
                          //       );
                          //     }
                          //   });
                          // },
                        ),
                        SizedBox(height: 5),
                        Container(
                            margin: EdgeInsets.only(left: sx(195), top: sy(30)),
                            child: Row(
                              children: [
                                Text('Belum Punya Akun?',
                                    style: TextStyle(fontSize: 18)),
                                TextButton(
                                    child: Text(
                                      'Daftar',
                                      style: TextStyle(
                                          //color: Colors.blue
                                          fontSize: 18),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return RamayanaSignup();
                                      }));
                                    })
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
