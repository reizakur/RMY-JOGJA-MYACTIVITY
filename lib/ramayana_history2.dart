import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uki_flutter/models/models_act.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:uki_flutter/ramayana_home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:flutter/services.dart';
import 'package:uki_flutter/service/SP_service/SP_service.dart';
import 'package:cupertino_lists/cupertino_lists.dart' as prefix;
import 'package:flutter/cupertino.dart';

class RamayanaHistory2 extends StatefulWidget {
  const RamayanaHistory2({super.key});

  @override
  State<RamayanaHistory2> createState() => _RamayanaHistory2State();
}

class _RamayanaHistory2State extends State<RamayanaHistory2> {
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
        Uri.parse('http://ramayana.joeloecs.com/mobileapi/deleted_data_act.php'),
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
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child:
      CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text('Reminders'),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text('Ramayana History'),
              onPressed: () {},
            ),
            backgroundColor: CupertinoColors.systemGroupedBackground,
            border: null,
            stretch: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                CupertinoListSection.insetGrouped(
                  header: const Text('My Lists'),
                  children: <CupertinoListTile>[
                    CupertinoListTile.notched(
                        title: const Text('Reminders'),
                        leading: const _DummyIcon(
                          color: CupertinoColors.activeBlue,
                          icon: CupertinoIcons.list_bullet,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MaterialButton(
                              minWidth: 20,
                              padding: EdgeInsets.only(left: 30),
                              child: const _DummyIcon(color: CupertinoColors.systemYellow, icon: CupertinoIcons.pencil),
                              onPressed: () {},
                            ),
                            MaterialButton(
                              minWidth: 20,
                              padding: EdgeInsets.only(right: 10),
                              child: const _DummyIcon(color: CupertinoColors.destructiveRed, icon: CupertinoIcons.delete),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        onTap: () {}
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _DummyIcon extends StatelessWidget {
  const _DummyIcon({Key? key, required this.color, required this.icon})
      : super(key: key);

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Icon(
          icon,
          color: CupertinoColors.white,
          size: 18.0,
        ),
      ),
    );
  }
}