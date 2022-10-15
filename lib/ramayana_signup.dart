import 'package:dio/dio.dart';
// import 'package:passwordfield/passwordfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uki_flutter/ramayana_home.dart';
import 'package:uki_flutter/ramayana_login.dart';
import 'package:form_field_validator/form_field_validator.dart';  

class RamayanaSignup extends StatefulWidget {
  @override
  _RamayanaSignup createState() => _RamayanaSignup();
}

class _RamayanaSignup extends State<RamayanaSignup> {
   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller_nama_user = TextEditingController();
  final controller_password = TextEditingController();
  final controller_subdivisi = TextEditingController();

  var dio = Dio();
  late Size ukuranlayar;
  var akses = 'usr';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // height: 900,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 168, 3, 3),
            ),
          ),

          ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 120, 20, 0),
                height: 200,
                width: 400,
                // decoration: BoxDecoration(
                //   // color: Color.fromARGB(255, 230, 230, 230),
                //   borderRadius: BorderRadius.circular(10),
                // //),
                child:
                
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/ram.png",
                      height: 190,
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                child:
                Form(
                  key: _formKey,
                  child: 
                 Column(
                  children: <Widget>[
                   TextFormField(
                  cursorColor: Colors.white,
                      controller: controller_nama_user,
                      validator: RequiredValidator(errorText: "Please Enter"),
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                        errorBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                        errorStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                      labelStyle: TextStyle(
                      color: Colors.white
                        ),

                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                        hintText: 'Username', 
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                        enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                            )
                      ),
                    ),
                    SizedBox(height: 30),

                    TextFormField(
                      controller: controller_password,
                      cursorColor: Colors.white,
                     validator: RequiredValidator(errorText: "Please Enter"),
                      obscureText: true,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        errorBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                        errorStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                        labelStyle: TextStyle(
                            color: Colors.white
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 30,
                        ),
                         hintText: 'Password', 
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                        enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                            )
                      ),
                    ),
                    SizedBox(height: 30),

                    TextFormField(
                      controller: controller_subdivisi,
                      cursorColor: Colors.white,
                     validator: RequiredValidator(errorText: "Please Enter"),
                     
                      obscureText: true,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                        errorBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                        errorStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                      labelStyle: TextStyle(
                      color: Colors.white
                        ),

                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                        hintText: 'Subdivisi', 
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                        enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),

                        focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                            )
                      ),
                    ),
                    SizedBox(height: 40),

                    MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.red,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'Validation Successful',
                              style: TextStyle(
                                  color: Colors.black,
                              ),
                            ),
                          ),
                      );
                        DateTime now = new DateTime.now();
                        //var _image;
                        var formData = FormData.fromMap({
                          'nama_user': controller_nama_user.text,
                          'password': controller_password.text,
                          'subdivisi': controller_subdivisi.text,

                        });
                        var response = await dio.post(
                            'http://ramayana.joeloecs.com/mobileapi/tambah_user.php',
                            data: formData
                        );
                        print('Berhasil, ${controller_nama_user.text}, ${controller_password.text}, ${controller_subdivisi.text}');
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return RamayanaLogin();
                                } ));
                      };
                      }
                    ),
                  ],
                ),
                )
              )
            ],
          ),

        ],
      ),
    );
  }
}
