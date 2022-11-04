import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uki_flutter/ramayana_home.dart';
import 'dart:io';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:barcode_image/barcode_image.dart';
import 'package:barcode_flutter/barcode_flutter.dart';


class RamayanaProfile extends StatefulWidget {
  //const RamayanaProfile({Key? key}) : super(key: key);

  @override
  _RamayanaProfile createState() => _RamayanaProfile();
//State<RamayanaProfile> createState() => _RamayanaProfile();
}

class _RamayanaProfile extends State<RamayanaProfile> {
  //const RamayanaActivity({Key? key}) : super(key: key);
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
            Container(
              margin: EdgeInsets.only(top: 400),

              child: ListView(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Full Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(),
                        SizedBox(height: 20),

                        Text('Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(),
                        SizedBox(height: 20),

                        Text('Divisi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(),

                        SizedBox(height: 30),
                      ],
                    ),
                    margin: EdgeInsets.only(left: 20, right: 20),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 0, right: 0),
                    alignment: Alignment.center,
                    height: 50,
                    //width: 370,
                    child: Text(
                      'UPDATE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(250, 236, 7, 7),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 370,
              decoration: BoxDecoration(
                color: Color.fromARGB(250, 236, 7, 7),
              ),
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(120, 250, 0, 0),
                    child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            QrImage(
                              foregroundColor: Colors.white,
                              data: '0460548',
                              version: QrVersions.auto,
                              size: 100,
                            ),

                            BarCodeImage(
                              params: Code39BarCodeParams(
                                "1234ABCD",
                                lineWidth: 1.0,                // width for a single black/white bar (default: 2.0)
                                barHeight: 80.0,               // height for the entire widget (default: 100.0)
                                withText: true,
                                // Render with text label or not (default: false)
                              ),
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.only(bottom: 5),
                              onError: (error) {               // Error handler
                                print('error = $error');
                              },
                            )

                          ],
                        ),

                ),
              ],
            ),

            Container(
              margin: EdgeInsets.fromLTRB(180, 30, 180, 0),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                //color: Colors.green,
                borderRadius: BorderRadius.circular(75),
                border:
                  Border.all(
                      color: Colors.white,
                  width: 3)
              ),
            ),

            // Container(
            //   margin: EdgeInsets.only(top: 30),
            //   alignment: Alignment.topCenter,
            //   child:
            //   image != null
            //       ? Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(150),
            //       child: Image.file(
            //         //to show image, you type like this.
            //         File(image!.path),
            //         fit: BoxFit.cover,
            //         width: 120,
            //         height: 120,
            //       ),
            //     ),
            //   )
            //       : Text(
            //     "No Image",
            //     style: TextStyle(fontSize: 20),
            //   ),
            // ),

            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/sabo.png'),
                radius: 60,
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 160),
              alignment: Alignment.topCenter,
              child: Text(
                '0460548', style:
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 140, left: 180),
                height: 120,
                width: 120,
                //color: Colors.green,
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                    myAlert();
                  },
                  child: Text('Upload Photo'),
                  ),
                  SizedBox(height: 10),

                ],
              ),
            )
          ],
      )
    );
  }
}
