import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uki_flutter/ramayana_home.dart';
import 'dart:io';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:barcode_image/barcode_image.dart';
import 'package:barcode_flutter/barcode_flutter.dart';


class RamayanaProfile2 extends StatefulWidget {
  //const RamayanaProfile({Key? key}) : super(key: key);

  @override
  _RamayanaProfile2 createState() => _RamayanaProfile2();
//State<RamayanaProfile> createState() => _RamayanaProfile();
}

class _RamayanaProfile2 extends State<RamayanaProfile2> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Column(
                children: [
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Profile',
              style: TextStyle(
                fontSize: 18,
              ),),
            backgroundColor: Color.fromARGB(250, 236, 7, 7),
            actions: <Widget>[

            ],
            elevation: 20,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back,
                    size: 18),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) {
                            return RamayanaHome();
                          } ));
                }
            )
        ),

        body:
        Stack(
          children: [
            // Figma Flutter Generator Androidlarge1Widget - FRAME
            Container(
                width: 500,
                height: 800,
                decoration: BoxDecoration(
                  color : Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 360,
                              height: 489,
                              decoration: BoxDecoration(
                                color : Color.fromRGBO(235, 22, 22, 1),
                              )
                          )
                      ),Positioned(
                          top: 69,
                          left: 11,
                          child: Container(
                              width: 338,
                              height: 191,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(9),
                                  topRight: Radius.circular(9),
                                  bottomLeft: Radius.circular(9),
                                  bottomRight: Radius.circular(9),
                                ),
                                boxShadow : [BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0,4),
                                    blurRadius: 4
                                )],
                                border : Border.all(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  width: 1,
                                ),
                                image : DecorationImage(
                                    image: AssetImage('assets/1.png'),
                                    fit: BoxFit.fitWidth
                                ),
                              )
                          )
                      ),Positioned(
                          top: 278,
                          left: 11,
                          child: Container(
                              width: 338,
                              height: 192,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(9),
                                  topRight: Radius.circular(9),
                                  bottomLeft: Radius.circular(9),
                                  bottomRight: Radius.circular(9),
                                ),
                                boxShadow : [BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0,4),
                                    blurRadius: 4
                                )],
                                border : Border.all(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  width: 1,
                                ),
                                image : DecorationImage(
                                    image: AssetImage('assets/2.png'),
                                    fit: BoxFit.fitWidth
                                ),
                              )
                          )
                      ),
                      Positioned(
                          top: 692,
                          left: 118,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                              color: Colors.black),
                              labelText: 'Full Name',
                            ),
                          )
                      ),
                      Positioned(
                          top: 507,
                          left: 19,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Colors.black),
                              labelText: 'Email',
                            ),
                          )
                      ),
                      // Positioned(
                      //     top: 570,
                      //     left: 19,
                      //     child: null
                      // ),
                      // Positioned(
                      //     top: 633,
                      //     left: 19,
                      //     child: null
                      // ),
                    ]
                )
            )
          ],
        )
    );
  }
}
