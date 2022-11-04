import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uki_flutter/ramayana_history.dart';
import 'dart:convert';
import 'package:uki_flutter/ramayana_home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uki_flutter/models/models_act.dart';
import 'package:http/http.dart' as http;
import 'package:uki_flutter/local_database/local_list_ramayana.dart';
import 'package:uki_flutter/tugas/ramayana_list.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:uki_flutter/ramayana_db.dart';
import 'package:uki_flutter/models/activity.dart';
import 'package:uki_flutter/local_database/local_database_ramayana.dart';

class RamayanaAct extends StatefulWidget {
  // RamayanaAct({super.key});
  final KebutuhanAct? activity;

  RamayanaAct({this.activity});

  // late String nik;
  // late String full_name;
  // late String sub_divisi;
  // late String date_visit;
  // late String location;
  // // late String status;
  // late String description;
  // late String target;
  // late String stk_numbers;

  @override
  State<RamayanaAct> createState() => _RamayanaActState();
}

class _RamayanaActState extends State<RamayanaAct> {
  // const RamayanaActivity({Key? key}) : super(key: key);
  //tambah form status
  var selected;
  final List<String> data = ["Lajang", "Menikah", "Janda", "Duda"];

  //tambah gambar
  XFile? image;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = image;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 8.0,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
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
        });
  }

  //validator
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //input ke database
  DbHelper db = DbHelper();

  TextEditingController? id;
  TextEditingController? nik;
  TextEditingController? fullName;
  TextEditingController? subDivisi;
  TextEditingController? dateVisit;
  TextEditingController? location;
  TextEditingController? status;
  TextEditingController? description;
  TextEditingController? target;
  TextEditingController? stkNumbers;

  void initState() {
    nik = TextEditingController(
        text: widget.activity == null ? '' : widget.activity!.nik);
    fullName = TextEditingController(
        text: widget.activity == null ? '' : widget.activity!.fullName);
    subDivisi = TextEditingController(
        text: widget.activity == null ? '' : widget.activity!.subDivisi);
    dateVisit = TextEditingController(
        text: widget.activity == null ? '' : widget.activity!.dateVisit);
    location = TextEditingController(
        text: widget.activity == null ? '' : widget.activity!.location);
    status = TextEditingController(
        text: widget.activity == null ? '' : widget.activity!.status);
    description = TextEditingController(
        text: widget.activity == null ? '' : widget.activity!.description);
    target = TextEditingController(
        text: widget.activity == null ? '' : widget.activity!.target);
    stkNumbers = TextEditingController(
        text: widget.activity == null ? '' : widget.activity!.stkNumbers);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Add Activity',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          backgroundColor: Color.fromARGB(250, 236, 7, 7),
          actions: <Widget>[],
          elevation: 20,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, size: 18),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RamayanaHome();
                }));
              })),
      body:
      Stack(
        children: [
          ListView(
          padding: EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 16.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: TextFormField(
                controller: nik,
                validator: RequiredValidator(errorText: "Format Angka"),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    labelText: 'NIK',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: TextField(
                controller: fullName,
                decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: TextField(
                controller: subDivisi,
                decoration: InputDecoration(
                    labelText: 'Subdivisi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: TextField(
                controller: location,
                decoration: InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: TextField(
                controller: status,
                decoration: InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: TextField(
                controller: description,
                decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: TextField(
                controller: target,
                decoration: InputDecoration(
                    labelText: 'Target',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: TextField(
                controller: dateVisit,
                decoration: InputDecoration(
                    labelText: 'Date Visit',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: TextField(
                controller: stkNumbers,
                decoration: InputDecoration(
                    labelText: 'STK Numbers',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 191, 183, 183),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: IconButton(onPressed: () {
                      myAlert();
                    },
                      icon: Icon(Icons.camera_alt),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 191, 183, 183),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child:  IconButton(onPressed: () {
                        myAlert();
                      },
                        icon: Icon(Icons.photo,),
                      )
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: MaterialButton(
                color: Colors.red,
                child: (widget.activity == null)
                    ? Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                onPressed: () {
                  upsertActivity();
                },
              ),
            )
          ],
        ),
          Container(
            child:
            Text('Form Activity',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            margin: EdgeInsets.only(left: 11, top: 15),
            height: 50,
            width: 450,
            padding: EdgeInsets.only(top: 14, bottom: 14, left: 8),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 239, 237, 237),
            ),
          ),
    ]
      ),
    );
  }

  Future<void> upsertActivity() async {
    if (widget.activity != null) {
      //update
      await db.updateActivity(KebutuhanAct.fromMap({
        'id': widget.activity!.id,
        'nik': nik!.text,
        'fullName': fullName!.text,
        'subDivisi': subDivisi!.text,
        'dateVisit': dateVisit!.text,
        'location': location!.text,
        'status': status!.text,
        'description': description!.text,
        'target': target!.text,
        'stkNumbers': stkNumbers!.text,
      }));

      Navigator.pop(context, 'update');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return RamayanaTable();
      }));
    } else {
      //insert
      await db.saveActivity(KebutuhanAct(
        nik: nik!.text,
        fullName: fullName!.text,
        subDivisi: subDivisi!.text,
        dateVisit: dateVisit!.text,
        location: location!.text,
        status: status!.text,
        description: description!.text,
        target: target!.text,
        stkNumbers: stkNumbers!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
