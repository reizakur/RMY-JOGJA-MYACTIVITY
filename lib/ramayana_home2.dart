import 'package:flutter/material.dart';
import 'package:flutter_collapsing_toolbar/flutter_collapsing_toolbar.dart';
import 'package:flutter/services.dart';
import 'package:uki_flutter/login2.dart';
import 'package:uki_flutter/ramayana_activity.dart';
import 'package:uki_flutter/ramayana_history.dart';
import 'package:uki_flutter/ramayana_void.dart';
import 'package:uki_flutter/service/SP_service/SP_service.dart';
import 'package:uki_flutter/ramayana_profile_3.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:reviews_slider/reviews_slider.dart';

const kSampleIcons = [
  Icons.add_circle_outline_outlined,
  Icons.history_edu_outlined,
  Icons.qr_code_scanner_outlined,
];
const kSampleIconLabels = [
  'Add Activity',
  'History',
  'Void',
];
const kSampleRoute = [RamayanaActivity(), RamayanaHistory(), RamayanaVoid()];

class RamayanaHome2 extends StatefulWidget {
  // RamayanaHome2(String temp);

  @override
  _RamayanaHome2State createState() => _RamayanaHome2State();
}

class _RamayanaHome2State extends State<RamayanaHome2> {
  final controller = ScrollController();
  double headerOffset = 0.0;
  late DateTime _selectedDate;
  int selectedValue1 = 0;

  void dapetinData() async {
    print('qwe');
    UserData userData = UserData();
    await userData.getPref();
    String userName = userData.getUsernameID();
    print('yuhu 123');
    print(userName);
  }

  signOut() async {
    await userData.logOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RamayanaLogin2()));
  }

  UserData userData = UserData();

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 2));
  }

  void initState() {
    super.initState();
    dapetinData();
    _resetSelectedDate();
  }

  void onChange1(int value) {
    setState(() {
      selectedValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ramayana Home',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        // appBar:
        //     AppBar(
        //       backgroundColor: Color.fromARGB(255, 198, 7, 7),
        //       toolbarHeight: 70,
        //       title: Container(
        //         margin: EdgeInsets.only(right: 10, left: 10, top: 5),
        //         child: TextField(
        //           decoration: InputDecoration(
        //             filled: true,
        //             fillColor: Colors.white,
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(5),
        //               borderSide: BorderSide.none,
        //             ),
        //             isCollapsed: true,
        //             labelText: 'Search',
        //             prefixIcon: Icon(Icons.search),
        //             // suffixText: 'Search'
        //           ),
        //         ),
        //       ),
        //     ),
        body: Stack(children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CollapsingToolbar(
                    controller: controller,
                    expandedHeight: 230,
                    collapsedHeight: 64,
                    decorationForegroundColor: Color(0xffd90000),
                    decorationBackgroundColor: Colors.white,
                    animationCurve: Curves.easeOut,
                    onCollapsing: (double offset) {
                      setState(() {
                        headerOffset = offset;
                      });
                    },
                    leading: Container(
                      margin: EdgeInsets.only(left: 12),
                      // padding: EdgeInsets.all(4),
                      // decoration: ShapeDecoration(
                      //   // color: Colors.white,
                      //   shape: CircleBorder(),
                      // ),
                      child: IconButton(
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
                    ),
                    title: Text(
                      userData.getUsernameID() + ' ' + userData.getUserID(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(CircleBorder()),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            child: Icon(
                              Icons.logout_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                            onPressed: () {
                              setState(() {
                                signOut();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                    key: ValueKey(
                      Container(
                        child: TextField(
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
                      ),
                    ),
                    featureCount: 3,
                    featureIconBuilder: (context, index) {
                      return Icon(
                        kSampleIcons[index],
                        size: 54,
                        color: Colors.white,
                      );
                    },
                    featureLabelBuilder: (context, index) {
                      return Text(
                        kSampleIconLabels[index],
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      );
                    },
                    featureOnPressed: (context, index) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return kSampleRoute[index];
                      }));
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        children: [
                          Container(
                            height: headerOffset,
                            margin: EdgeInsets.only(top: 40),
                          ),
                          Image.asset('assets/ram.png'),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.copyright_outlined),
                              Text(
                                'Copyright by Ramayana RB17',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 70),
                          // CalendarTimeline(
                          //   showYears: true,
                          //   initialDate: _selectedDate,
                          //   firstDate: DateTime.now(),
                          //   lastDate: DateTime.now().add(Duration(days: 365 * 4)),
                          //   onDateSelected: (date) => setState(() => _selectedDate = date),
                          //   leftMargin: 10,
                          //   monthColor: Colors.blueGrey,
                          //   dayColor: Colors.teal[200],
                          //   activeDayColor: Colors.white,
                          //   activeBackgroundDayColor: Colors.redAccent[100],
                          //   dotsColor: Color(0xFF333A47),
                          //   selectableDayPredicate: (date) => date.day != 23,
                          //   locale: 'en_ISO',
                          // ),
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     Text(
                          //       'Bagaimana Kabarmu Hari ini?',
                          //       style: TextStyle(
                          //           color: Color(0xFF6f7478),
                          //           fontSize: 18,
                          //       ),
                          //     ),
                          //     SizedBox(height: 20),
                          //     ReviewSlider(
                          //       onChange: onChange1,
                          //     ),
                          //     Text(selectedValue1.toString()),
                          //     SizedBox(height: 30),
                          //   ],
                          // ),
                          Container(
                            height: 200,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 90, left: 45, right: 50),
            child: TextField(
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
          ),
        ]),
      ),
    );
  }
}
