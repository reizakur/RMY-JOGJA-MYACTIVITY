import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uki_flutter/models/models_act.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:uki_flutter/ramayana_activity.dart';
import 'package:uki_flutter/ramayana_home.dart';
import 'package:uki_flutter/ramayana_home2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:flutter/services.dart';
import 'package:uki_flutter/service/SP_service/SP_service.dart';
import 'package:cupertino_lists/cupertino_lists.dart' as prefix;
import 'package:flutter/cupertino.dart';

class RamayanaHistory extends StatefulWidget {
  const RamayanaHistory({super.key});

  @override
  State<RamayanaHistory> createState() => _RamayanaHistoryState();
}

class _RamayanaHistoryState extends State<RamayanaHistory> {
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

  void deleteProduk(id_act) async {
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

  void dapetinData() async {
    print('qwe');
    UserData userData = UserData();
    await userData.getPref();
    String userName = userData.getUsernameID();
    print('yuhu 123');
    print(userName);
  }

  UserData userData = UserData();

  void initState() {
    super.initState();
    fetchProduk();

    dapetinData();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        appBar: AppBar(
            title: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                isCollapsed: true,
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                // suffixText: 'Search'
              ),
            ),
            backgroundColor: Color.fromARGB(255, 255, 17, 17),
            elevation: 7.20,
            toolbarHeight: 75,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.filter_1),
                onPressed: () {},
              ),
            ],
            leading: IconButton(
                icon: const Icon(Icons.arrow_back, size: 18),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RamayanaHome2();
                  }));
                })),
        body: Stack(children: <Widget>[
          Container(
              height: sy(100),
              width: sx(720),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 232, 15, 15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 3,
                    blurRadius: 3,
                  )
                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(left: sx(10), top: sy(20)),
            child: Text('List Activity',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
              margin: EdgeInsets.only(left: sx(10), top: sy(80)),
              child: Text(userData.getUsernameID(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ))),
          Container(
              margin: EdgeInsets.only(top: sy(100)),
              color: Colors.white,
              child: ListView(
                children: AktivitasModel.aktivitaslist.map((e) {
                  print('nama user ${e.fullname}');
                  return ListTile(
                    leading: Text('${e.id_act}'),
                    title: Text('${e.fullname}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteProduk(e.id_act);
                        fetchProduk();
                        setState(() {});
                      },
                    ),
                    subtitle: Text('${e.subdivisi}'),
                    tileColor: Colors.green[100],
                  );
                }).toList(),
              )),
          Container(
            margin: EdgeInsets.only(top: sy(100)),
            height: sy(40),
            width: sx(720),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 5, blurRadius: 15)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('ALL',
                    style: TextStyle(
                        color: Color.fromARGB(221, 101, 89, 89),
                        fontSize: 13,
                        fontWeight: FontWeight.w700)),
                Text('TRASH',
                    style: TextStyle(
                        color: Color.fromARGB(221, 101, 89, 89),
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 255, 17, 17),
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return RamayanaActivity();
                  }));
            }),
      );
    });
  }
}


