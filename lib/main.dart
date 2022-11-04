import 'package:flutter/material.dart';
import 'package:uki_flutter/ramayana_history2.dart';
import 'package:uki_flutter/ramayana_home2.dart';
import 'package:uki_flutter/login2.dart';
import 'package:uki_flutter/ramayana_profile_2.dart';
import 'package:uki_flutter/ramayana_profile_3.dart';
import 'package:uki_flutter/tugas/list_tile.dart';
import 'package:uki_flutter/local_database/local_form_ramayana.dart';
import 'package:uki_flutter/local_database/local_list_ramayana.dart';
import 'package:uki_flutter/tugas/tabel_lagi.dart';
import 'package:uki_flutter/tugas/news.dart';
import 'package:uki_flutter/tugas/popup.dart';
import 'package:uki_flutter/ramayana_history.dart';
import 'package:uki_flutter/ramayana_signup.dart';
import 'package:uki_flutter/ramayana_user.dart';
import 'package:uki_flutter/ramayana_history.dart';
import 'package:uki_flutter/ramayana_activity.dart';
import 'package:uki_flutter/ramayana_home.dart';
import 'package:uki_flutter/tugas/ramayana_list.dart';
import 'package:uki_flutter/ramayana_login.dart';
import 'package:uki_flutter/ramayana_profile.dart';
import 'package:uki_flutter/ramayana_void.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:uki_flutter/tugas/untuk_main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
              child,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.autoScale(480, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
              ],
            ),
        title: 'Tugas Flutter',
        debugShowCheckedModeBanner: false,
        home: RamayanaLogin2());
  }
}
