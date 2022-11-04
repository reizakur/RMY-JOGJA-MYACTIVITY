import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:uki_flutter/auth_service.dart';
import 'package:uki_flutter/ramayana_home.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:uki_flutter/ramayana_home2.dart';
import 'package:uki_flutter/ramayana_print_%20harga.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:uki_flutter/service/API_service/API_service.dart';
import 'package:uki_flutter/service/SP_service/SP_service.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RamayanaVoid extends StatefulWidget {
  const RamayanaVoid({super.key});

  @override
  State<RamayanaVoid> createState() => _RamayanaVoidState();
}

class _RamayanaVoidState extends State<RamayanaVoid> {
  TextEditingController kodeBarcode = TextEditingController();
  String _scanBarcode = '';
  String data = '';
  bool _visible = false;

  Future<void> startBarcodeScanStream2() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  //
  // // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcode() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<String> _getEncryptNumber() async {
    AuthServices authServices = AuthServices();
    await authServices.toString();

    String userId = '999999';

    // UserData userData = UserData();
    // await userData.getPref();
    // String userId = userData.getUserID();
    String? inputNumber = kodeBarcode.text;

    late int code1;
    late int code2;

    late String result;

    if (inputNumber != null && userId != null) {
      code1 = stepOne(input: inputNumber);
      code2 = stepTwo(input: code1);
      result = stepThree(encrypt_kode: code2.toString(), masukkan_user: userId);
      print('Hasil: ${result}');
    }
    return result;
  }

  int stepOne({required String input}) {
    int current = 1;
    for (int i = 0; i < input.length; i++) {
      print('Check number :${input[i]} at index $i');
      if (input[i] == '0') {
        // print('catch 1');
        // print('current = $current * ${i + 1}');
        current = current * i + 1;
        print('coba current if');
        print(current);
      } else {
        // print('catch 2');
        // print('current = $current * ${int.parse(input[i])}');
        current = current * int.parse(input[i]);
        print('coba current else');
        print(current);
      }
      print('current value is $current');
    }
    return current;
  }

  int stepTwo({required int input}) {
    print('coba hasil input');
    print(input);
    return (input * 121) - 100;
  }

  String stepThree(
      {required String masukkan_user, required String encrypt_kode}) {
    int prefixNumber = 0;
    int postNumber = 0;
    if (masukkan_user.length >= 3) {
      prefixNumber = int.parse(masukkan_user.substring(0, 3)) + 13;
      postNumber =
          int.parse(masukkan_user.substring(3, masukkan_user.length)) + 18;
      // } else if (userId.length > 0) {
      //   prefixNumber = int.parse(userId.substring(0, userId.length)) + 13;
    } else {}
    return '${prefixNumber}X${encrypt_kode}B${postNumber}';
  }
  // List<ScanResult>? scanResult;

  @override
  void initState() {
    super.initState();
    // findDevices();
  }

  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        appBar: AppBar(
            title: Text(
              'Void',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            backgroundColor: Color.fromARGB(250, 236, 7, 7),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.print),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Harga();
                    }));
                  })
            ],
            elevation: 20,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back, size: 18),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RamayanaHome2();
                  }));
                })),
        body: Container(
          decoration: BoxDecoration(color: Colors.red),
          child: Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Form Void',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text(
                      'Isikan kode Void di bawah ini: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                margin: EdgeInsets.only(left: 11, top: 15),
                height: 100,
                width: 450,
                padding: EdgeInsets.only(top: 14, bottom: 14, left: 20),
                // decoration: BoxDecoration(
                //   color: Color.fromARGB(255, 239, 237, 237),
                // ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100, left: 20, right: 20),
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
              ListView(
                children: [
                  AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(sx(40), sy(220), sx(40), 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            QrImage(
                              data: '$data',
                              version: QrVersions.auto,
                              size: 250,
                            ),
                            SizedBox(height: 20),
                            BarCodeImage(
                              params: Code128BarCodeParams(
                                "$data",
                                lineWidth: 2.0,
                                // width for a single black/white bar (default: 2.0)
                                barHeight: 100.0,
                                // height for the entire widget (default: 100.0)
                                withText: true,
                                // Render with text label or not (default: false)
                              ),
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.only(bottom: 7),
                              onError: (error) {
                                // Error handler
                                print('error = $error');
                              },
                            ),
                          ]),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(sx(40), sy(95), sx(40), 0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    hoverColor: Colors.grey.shade50,
                    // fillColor: Colors.red.shade100,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    labelText: 'Code',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Kode Barcode',
                    hintStyle: TextStyle(color: Colors.black12),
                    prefixIcon: Icon(Icons.code_outlined, color: Colors.black),
                  ),
                  // controller: _editingController..text = '$_scanBarcode',
                  controller: kodeBarcode..text = '$_scanBarcode',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: sy(140)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Container(
                    //   // margin: EdgeInsets.only(top: sy(112), left: sx(185)),
                    //   // alignment: Alignment.center,
                    // //   child: MaterialButton(
                    // //       padding: EdgeInsets.symmetric(),
                    // //       height: sy(40),
                    // //       minWidth: sx(240),
                    // //       shape: RoundedRectangleBorder(
                    // //         borderRadius: BorderRadius.circular(100),
                    // //       ),
                    // //       child: Text(
                    // //         'Scan Barcode',
                    // //         style: TextStyle(color: Colors.white, fontSize: 20),
                    // //       ),
                    // //       color: Colors.orangeAccent,
                    // //       onPressed: () =>
                    // //           setState(() {
                    // //             scanBarcode();
                    // //           })
                    // //   ),
                    // // ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(),
                      height: sy(40),
                      minWidth: sx(190),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        'Scan Barcode',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.orangeAccent,
                      onPressed: () {
                        setState(() {
                          scanBarcode();
                        });
                      },
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(),
                      height: sy(40),
                      minWidth: sx(190),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        'Generate',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.red,
                      onPressed: () async {
                        data = await _getGenerate();
                        setState(() {
                          _visible = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      );
    });
  }

  Future<String> _getGenerate() async {
    UserData userData = UserData();
    await userData.getPref();
    // String userId = userData.getUserID();
    String userId = '999999';
    print('grgr 123');
    print(userId);
    String? inputNumber = kodeBarcode.text;
    late int encryptNumber;
    late int encryptNumber2;

    late String result;

    if (inputNumber != null && userId != null) {
      encryptNumber = _stepOne(input: inputNumber);
      encryptNumber2 = _stepTwo(input: encryptNumber);
      result = _stepThree(
          masukan_kedua: encryptNumber2.toString(), masukan_satu: userId);
      print('Hasil : ${result}');
    }
    return result;
  }

  int _stepOne({required String input}) {
    int current = 1;
    for (int i = 0; i < input.length; i++) {
      // print('Check number :${input[i]} at index $i');
      if (input[i] == '0') {
        // print('catch 1');
        // print('current = $current * ${i + 1}');
        current = current * i + 1;
      } else {
        // print('catch 2');
        // print('current = $current * ${int.parse(input[i])}');
        current = current * int.parse(input[i]);
      }
      // print('current val is $current');
    }
    return current;
  }

  int _stepTwo({required int input}) {
    return (input * 121) - 100;
  }

  String _stepThree(
      {required String masukan_satu, required String masukan_kedua}) {
    print('masukan kedua');
    print(masukan_kedua);
    print(masukan_satu);

    int prefixNumber = 0;
    int postNumber = 0;
    if (masukan_satu.length >= 3) {
      prefixNumber = int.parse(masukan_satu.substring(0, 3)) + 13;
      postNumber =
          int.parse(masukan_satu.substring(3, masukan_satu.length)) + 18;
    } else if (masukan_satu.length > 0) {
      prefixNumber =
          int.parse(masukan_satu.substring(0, masukan_satu.length)) + 13;
    } else {}
    return '${prefixNumber}X${masukan_kedua}B$postNumber';
  }
}
