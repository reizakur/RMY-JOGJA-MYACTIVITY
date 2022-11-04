import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uki_flutter/ramayana_history.dart';
import 'dart:convert';
import 'package:uki_flutter/ramayana_home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uki_flutter/models/models_act.dart';
import 'package:http/http.dart' as http;
import 'package:uki_flutter/ramayana_home2.dart';
import 'package:uki_flutter/tugas/ramayana_list.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:uki_flutter/ramayana_db.dart';

class RamayanaActivity extends StatefulWidget {
  const RamayanaActivity({super.key});

  @override
  _RamayanaActivity createState() => _RamayanaActivity();
}

class _RamayanaActivity extends State<RamayanaActivity> {
  // const RamayanaActivity({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller_nik = TextEditingController();
  final controller_fullname = TextEditingController();
  final controller_subdivisi = TextEditingController();
  final controller_date_visit = TextEditingController();
  final controller_location = TextEditingController();
  final controller_status = TextEditingController();
  final controller_description = TextEditingController();
  final controller_target = TextEditingController();
  final controller_stk_numbers = TextEditingController();
  final controller_data_gambar = TextEditingController();

  var dio = Dio();
  late Size ukuranlayar;
  var akses = 'usr';

  var selected;
  final List<String> data = ["Lajang", "Menikah", "Janda", "Duda"];

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
              height: MediaQuery.of(context).size.height / 0,
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

  void fetchProduk() async {
    AktivitasModel.aktivitaslist.clear();
    final responseku = await http.post(
        Uri.parse('http://ramayana.joeloecs.com/mobileapi/fetch_data_act.php'),
        body: {
          "id_act": 'nothing',
        });
    var data = jsonDecode(responseku.body);
    if (data[0]['result'] == '1') {
      int count = data[1].length;
      for (int i = 0; i < count; i++) {
        AktivitasModel.aktivitaslist.add(AktivitasModel.fromjson(data[1][i]));
      }
      print('check length ${AktivitasModel.aktivitaslist.length}');
      print(data[1].toString());
    } else {
      print('NO DATA');
    }
    setState(() {});
  }

  void tambahProduk(id_act) async {
    AktivitasModel.aktivitaslist.clear();
    final responseku = await http.post(
        Uri.parse(
            'http://ramayana.joeloecs.com/mobileapi/deleted_data_act.php'),
        body: {
          "id_act": id_act,
        });

    var data = jsonDecode(responseku.body);
    if (['value'] == 1) {
      setState(() {
        fetchProduk();
      });

      print('check length ${AktivitasModel.aktivitaslist.length}');
    } else {
      print('NO DATA');
    }
    setState(() {});
  }

  void initState() {
    super.initState();
    fetchProduk();
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
                  return RamayanaHome2();
                }));
              })),
      body: Stack(
        children: [
          Container(
            child: Text(
              'Form Activity',
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
          Container(
            margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Text(
                    'NIK',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  TextFormField(
                    controller: controller_nik,
                    validator: RequiredValidator(errorText: "Format Angka"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Full Name',
                    style: TextStyle(
                      color: Colors.deepOrange,
                    ),
                  ),
                  TextField(
                    controller: controller_fullname,
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Sub Divisi',
                    style: TextStyle(
                      color: Colors.deepOrange,
                    ),
                  ),
                  TextField(
                    controller: controller_subdivisi,
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Date Visit',
                    style: TextStyle(
                      color: Colors.deepOrange,
                    ),
                  ),
                  TextField(
                    controller: controller_date_visit,
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Location',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),

                  TextField(
                    style: TextStyle(
                      height: 0,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Cari di sini..',
                      border: OutlineInputBorder(),
                    ),
                    controller: controller_location,
                  ),
                  SizedBox(height: 14),

                  DropdownButton(
                    value: selected,
                    hint: Text(
                      "Status",
                      style: TextStyle(color: Colors.deepOrange, fontSize: 14),
                    ),
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        selected = value;
                      });
                    },
                    items: data
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.deepOrange,
                    ),
                  ),
                  TextField(
                    controller: controller_description,
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Target',
                    style: TextStyle(
                      color: Colors.deepOrange,
                    ),
                  ),
                  TextField(
                    controller: controller_target,
                  ),
                  SizedBox(height: 10),

                  Text(
                    'STK Numbers',
                    style: TextStyle(
                      color: Colors.deepOrange,
                    ),
                  ),
                  TextFormField(
                    controller: controller_stk_numbers,
                    validator: RequiredValidator(errorText: "Format Angka"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(height: 10),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 191, 183, 183),
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            onPressed: () {
                              myAlert();
                            },
                            icon: Icon(Icons.camera_alt),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 191, 183, 183),
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              onPressed: () {
                                myAlert();
                              },
                              icon: Icon(
                                Icons.photo,
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 17, 17),
                      //  borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextButton(
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        DateTime now = new DateTime.now();
                        //var _image;
                        var formData = FormData.fromMap({
                          'nik': controller_nik.text,
                          'fullname': controller_fullname.text,
                          'subdivisi': controller_subdivisi.text,
                          'date_visit ': controller_date_visit.text,
                          'location': controller_location.text,
                          'status': controller_status.text,
                          'description': controller_description.text,
                          'target': controller_target.text,
                          'stk_numbers': controller_stk_numbers.text,
                          //   'gambar': await MultipartFile.fromFile(
                          //       _image.path,
                          //       filename: 'gambar${now.toString()}.png'
                          //   ),
                        });
                        var response = await dio.post(
                            'http://ramayana.joeloecs.com/mobileapi/tambah_act.php',
                            data: formData);
                        print(
                            'Berhasil, ${controller_nik.text}, ${controller_fullname.text}, ${controller_subdivisi.text}, ${controller_date_visit.text}, ${controller_location.text}, ${controller_status.text}, ${controller_description.text}, ${controller_target.text}, ${controller_stk_numbers.text}');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RamayanaHistory();
                        }));
                        setState(() {});
                      },
                    ),
                  ),

                  // onPressed: () {}
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
