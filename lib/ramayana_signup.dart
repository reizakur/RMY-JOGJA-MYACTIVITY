import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:passwordfield/passwordfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uki_flutter/login2.dart';
import 'package:uki_flutter/ramayana_home.dart';
import 'package:uki_flutter/ramayana_login.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:uki_flutter/service/SP_service/SP_service.dart';
import 'package:uki_flutter/service/API_service/API_service.dart';
import 'package:http/http.dart' as http;

class RamayanaSignup extends StatefulWidget {
  @override
  _RamayanaSignup createState() => _RamayanaSignup();
}

class _RamayanaSignup extends State<RamayanaSignup> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller_nama_user = TextEditingController();
  final controller_email = TextEditingController();
  final controller_password = TextEditingController();
  final controller_noHp = TextEditingController();
  final messageController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();

  Future sendEmail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send"
    );
    const serviceId = "service_lm2kg1a";
    const templateId = "template_ztwi48d";
    const userId = "oROL4cvfSkx9YRqkR";

    final response = await http.post(url,
      headers: {'Content-Type': 'application/json', 'origin': 'http://localhost'},
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'name': controller_nama_user.text,
          'subject': controller_email.text,
          'message': controller_noHp.text,
          'user_email': controller_email.text,
          // "subject": subjectController.text,
          // "message": messageController,
          // "user_email": emailController,
        }
      })
    );
    return response.statusCode;
  }

  var dio = Dio();

  late Size ukuranlayar;
  var akses = 'usr';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 1200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 168, 3, 3),
            ),
          ),

          ListView(
            children: [
              Container(
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
                      height: 200,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),

              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: RequiredValidator(errorText: "Wajib Diisi!"),
                      controller: controller_nama_user,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: Colors.white
                        ),
                        labelStyle: TextStyle(
                            color: Colors.white
                        ),
                        prefixIcon: Icon(
                          Icons.person_add,
                          color: Colors.white,
                        ),
                        labelText: 'Username sesuai NIK',
                      ),
                    ),
                    SizedBox(height: 10),

                    TextFormField(
                      validator: RequiredValidator(errorText: "Wajib Diisi!"),
                      controller: controller_email,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: Colors.white
                        ),
                        labelStyle: TextStyle(
                            color: Colors.white
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 10),

                    // TextFormField(
                    //   validator: RequiredValidator(errorText: "Wajib Diisi!"),
                    //   controller: controller_password,
                    //   obscureText: true,
                    //   keyboardType: TextInputType.multiline,
                    //   style: TextStyle(color: Colors.white, fontSize: 25),
                    //   decoration: InputDecoration(
                    //     errorStyle: TextStyle(
                    //         color: Colors.white
                    //     ),
                    //     labelStyle: TextStyle(
                    //         color: Colors.white
                    //     ),
                    //     prefixIcon: Icon(
                    //       Icons.lock,
                    //       color: Colors.white,
                    //     ),
                    //     labelText: 'Password',
                    //   ),
                    // ),
                    // SizedBox(height: 10),

                    TextFormField(
                      validator: RequiredValidator(errorText: "Wajib Diisi!"),
                      controller: controller_noHp,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.white
                        ),
                        labelStyle: TextStyle(
                            color: Colors.white
                        ),
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Colors.white,
                        ),
                        labelText: 'Nomor HP',
                      ),
                    ),
                    SizedBox(height: 10),

                    MaterialButton(
                      padding: EdgeInsets.symmetric(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                      color: Colors.red,
                      onPressed: () async {
                        sendEmail();
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: Text(
                                'Pendaftaran Berhasil!',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        }
                        DateTime now = new DateTime.now();
                        //var _image;
                        var formData = FormData.fromMap({
                          'nama_user': controller_nama_user.text,
                          'password': controller_password.text,
                          'subdivisi': controller_email.text,

                        });
                        var response = await dio.post(
                            'http://ramayana.joeloecs.com/mobileapi/tambah_user.php',
                            data: formData
                        );
                        print('Berhasil, ${controller_nama_user.text}, ${controller_password.text}, ${controller_email.text}');

                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 5),
              Container(
                  margin: EdgeInsets.only(left: 130),
                  child:
                  Row(
                    children: [
                      Text('Sudah Punya Akun?',
                          style:
                          TextStyle(fontSize: 18)),
                      TextButton(
                          child: Text('Masuk',
                            style: TextStyle(
                              //color: Colors.blue
                                fontSize: 18
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) {
                                      return RamayanaLogin2();
                                    } ));
                          }
                      )
                    ],
                  )
              )
            ],
          ),

        ],
      ),
    );
  }
}
