import 'package:flutter/material.dart';
import 'package:uki_flutter/ramayana_print.dart';
import 'package:uki_flutter/ramayana_history.dart';
import 'package:uki_flutter/ramayana_signup.dart';
import 'package:uki_flutter/ramayana_user.dart';
import 'package:uki_flutter/ramayana_history.dart';
import 'package:uki_flutter/ramayana_activity.dart';
import 'package:uki_flutter/ramayana_home.dart';
import 'package:uki_flutter/ramayana_login.dart';
import 'package:uki_flutter/ramayana_profile.dart';
import 'package:uki_flutter/ramayana_void.dart';
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:uki_flutter/shopping.dart';
import 'db.dart';


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
        ResponsiveBreakpoint.autoScale(600, name : PHONE),
        ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ResponsiveBreakpoint.autoScale(600, name : DESKTOP),
      ],
    ),
        title: 'Tugas Flutter',
        debugShowCheckedModeBanner: false,
        home:  RamayanaLogin());
  }
}


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initilizaeDb();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ramayana Adel',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'My Shopping list'),
//     );
//   }
// }


