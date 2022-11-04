import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:uki_flutter/local_database/local_list_ramayana.dart';
import 'package:uki_flutter/login2.dart';
import 'package:uki_flutter/ramayana_history.dart';
import 'package:uki_flutter/ramayana_activity.dart';
import 'package:uki_flutter/ramayana_profile_3.dart';
import 'package:uki_flutter/tugas/ramayana_list.dart';
import 'package:uki_flutter/ramayana_profile.dart';
import 'package:uki_flutter/ramayana_user.dart';
import 'package:uki_flutter/ramayana_void.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:flutter/services.dart';
import 'package:uki_flutter/service/SP_service/SP_service.dart';
import 'package:uki_flutter/local_database/local_form_ramayana.dart';

class RamayanaHome extends StatefulWidget {
  const RamayanaHome({Key? key}) : super(key: key);

  @override
  State<RamayanaHome> createState() => _RamayanaHomeState();
}

class _RamayanaHomeState extends State<RamayanaHome> {
  bool _visible = false;

  void dapetinData() async {
    print('qwe');
    UserData userData = UserData();
    await userData.getPref();
    String userName = userData.getUsernameID();
    print('yuhu 123');
    print(userName);
  }

  UserData userData = UserData();

  signOut() async {
    await userData.logOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RamayanaLogin2()));
  }

  void initState() {
    super.initState();
    //   await userData.getPref();
    //   String userName = userData.getUsernameID();
    //   print('yuhu 123');
    //
    dapetinData();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
          appBar: AppBar(
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: sy(14),
                ),
              ),
              backgroundColor: Color.fromARGB(250, 236, 7, 7),
              actions: <Widget>[
                IconButton(
                    icon: CircleAvatar(
                      backgroundImage: AssetImage('assets/aot.jpg'),
                      backgroundColor: Colors.white,
                      radius: 20,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RamayanaProfile3();
                      }));
                    }),
                IconButton(
                    icon: const Icon(Icons.logout_outlined),
                    onPressed: () async {
                      setState(() {
                        signOut();
                      });
                    }),
              ],
              elevation: 20,
              leading: IconButton(
                  icon: const Icon(Icons.home, size: 18), onPressed: () {})),
          body: Stack(
            fit: StackFit.loose,
            children: [
              ListView(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/ram.png',
                          height: sy(150),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                        top: sy(75), left: sy(20), right: sy(20)),
                    height: sy(200),
                    width: sy(400),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: const Offset(
                              3.0,
                              3.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow
                        ]),
                  ),
                  AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    // maintainAnimation: true,
                    // maintainState: true,
                    // maintainSize: true,
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon:
                                    Icon(Icons.add_circle, color: Colors.white),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RamayanaActivity();
                                  }));
                                },
                              ),
                              Text(
                                'ADD ACT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sy(10),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.list_alt, color: Colors.white),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RamayanaHistory();
                                  }));
                                },
                              ),
                              Text(
                                'LIST ACT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sy(10),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.featured_play_list_outlined,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RamayanaVoid();
                                  }));
                                },
                              ),
                              Text(
                                'VOID',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sy(10),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.local_attraction,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RamayanaTable();
                                  }));
                                },
                              ),
                              Text(
                                'LOCAL',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sy(10),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(
                          top: sy(30), left: sy(25), right: sy(25)),
                      height: sy(50),
                      // width: sy(360),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 0, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: sy(100),
                    width: sy(100),
                    child: MaterialButton(
                      color: Colors.red,
                        child:
                           Icon(Icons.menu, color: Colors.white, size: 60),
                            onPressed: () {
                              setState(() {
                                _visible = !_visible;
                              });
                            },
                              minWidth: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.width / 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70)
                      ),
                    )
                  ),
                ]
              ),
              Container(
                height: sy(50),
                decoration: BoxDecoration(
                  color: Color.fromARGB(250, 255, 0, 0),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '     Welcome, ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: sy(10),
                      ),
                    ),
                    Text(
                      userData.getUsernameID(),
                      style: TextStyle(
                          fontSize: sy(10),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      ' ${userData.getUserID()} in My Activity ',
                      style: TextStyle(
                        fontSize: sy(10),
                      ),
                    )
                  ],
                ),
                margin:
                    EdgeInsets.only(top: sy(33), left: sy(20), right: sy(15)),
                height: sy(30),
                width: sy(300),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(sy(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: const Offset(
                          3.0,
                          3.0,
                        ),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                    ]),
              ),
            ],
          ));
    });
  }
}
