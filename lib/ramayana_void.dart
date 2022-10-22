import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:uki_flutter/ramayana_print.dart';
import 'package:uki_flutter/ramayana_print_%20harga.dart';
import 'package:uki_flutter/service/SP_service/SP_service.dart';

class Void extends StatefulWidget {
  const Void({super.key});

  @override
  State<Void> createState() => _VoidState();
}

class _VoidState extends State<Void> {
  // final List<Map<String, dynamic>> dataPrint = [
  //   {
  //     'title': 'Produk 1',
  //     'price': 10000,
  //     'qty': 2,
  //     'total_price': 20000,
  //   },
  //   {
  //     'title': 'Produk 2',
  //     'price': 20000,
  //     'qty': 2,
  //     'total_price': 40000,
  //   },
  //   {
  //     'title': 'Produk 3',
  //     'price': 12000,
  //     'qty': 1,
  //     'total_price': 12000,
  //   },
  // ];

  TextEditingController _editingController = TextEditingController(text: '');
  String data = '';
  @override
  Widget build(BuildContext context) {
    //  int _total = 0;

    // for (var i = 0; i < data.length; i++) {
    //   _total += dataPrint[i]['total_price'] as int;
    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Void', style: TextStyle(fontSize: 23)),
        backgroundColor: const Color.fromARGB(255, 255, 17, 17),
        elevation: 7.20,
        toolbarHeight: 90,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Harga();
              }));
            },
            icon: const Icon(
              Icons.print,
              size: 30,
            ),
          )
        ],
      ),
      body: Stack(children: <Widget>[
        Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: const Color.fromARGB(255, 253, 249, 249)),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          width: 500,
          height: 50,
          color: const Color.fromARGB(255, 239, 237, 237),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: const Text(
            'Form Void',
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 23, color: Colors.black),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 90, 30, 0),
          child: ListView(
            children: <Widget>[
              const Text(
                'Code',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 17, 17),
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelStyle: const TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black),
                    )),
                controller: _editingController,
              ),
              const SizedBox(
                height: 20,
                width: 20,
              ),
            ],
          ),
        ),
        Container(
            color: const Color.fromARGB(255, 255, 17, 17),
            margin: const EdgeInsets.only(top: 180),
            height: 60,
            child: Container(
              margin: const EdgeInsets.only(right: 7),
              width: 500,
              child: TextButton(
                child: const Text(
                  'GENERATE',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                ),
                onPressed: () async {
                  data = await _getEncryptNumber();
                  setState(() {});
                },
              ),
            )),
        Container(
          color: const Color.fromARGB(255, 239, 237, 237),
          width: 500,
          height: 50,
          margin: const EdgeInsets.fromLTRB(10, 260, 10, 0),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Scan Barcode',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 350, 30, 0),
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: QrImage(
                  data: '$data',
                  version: QrVersions.auto,
                  size: 220.0,
                ),
              ),

              //            Column(
              //   children: <Widget>[
              //     Expanded(
              //       child: ListView.builder(
              //         itemCount: data.length,
              //         itemBuilder: (c, i) {
              //           return ListTile(
              //             title: Text(dataPrint[i]['title']),
              //             subtitle: Text('Rp ${dataPrint[i]['price']} x ${dataPrint[i]['qty']}'),
              //             trailing: Text('Rp ${dataPrint[i]['total_price']}'),
              //           );
              //         },
              //       ),
              //     ),
              //     Container(
              //       color: Colors.grey[200],
              //       padding: EdgeInsets.all(20),
              //       child: Row(
              //         children: <Widget>[
              //           Column(
              //             children: <Widget>[
              //               Text(
              //                 'Total :',
              //                 style: TextStyle(fontWeight: FontWeight.bold),
              //               ),
              //               Text(
              //                 'Rp $_total :',
              //                 style: TextStyle(fontWeight: FontWeight.bold),
              //               )
              //             ],
              //           ),
              //           SizedBox(width: 20),
              //           Expanded(
              //             child: FlatButton(
              //               color: Theme.of(context).primaryColor,
              //               textColor: Colors.white,
              //               child: Text('Print'),
              //               onPressed: () {
              //                 Navigator.push(context,
              //                     MaterialPageRoute(builder: (_) => Print(dataPrint)));
              //               },
              //             ),
              //           )
              //         ],
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
        )
      ]),
    );
  }

  Future<String> _getEncryptNumber() async {
    UserData userData = UserData();
    await userData.getPref();
    String userId = userData.getUserID();
    String? inputNumber = _editingController.text;
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
