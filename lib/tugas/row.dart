import 'package:flutter/material.dart';

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
      title: 'Welcome',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          elevation: 7.7,
          leading: Icon(Icons.home_outlined),
          title: Center(child: Text('Welcome Bos')),
        ),
        body: Container(
          color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.access_alarm,
                size: 40,
              ),
              Icon(
                Icons.access_alarm,
                size: 80,
              ),
              Icon(
                Icons.access_alarm,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
