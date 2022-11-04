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
          color: Colors.amber,
          margin: EdgeInsets.all(20),
          child: Container(
            color: Colors.red,
            margin: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.yellow,
                        Colors.blue,
                      ]),
                  borderRadius: BorderRadius.circular(100)),
              margin: EdgeInsets.fromLTRB(90, 80, 90, 400),
            ),
          ),
        ),
      ),
    );
  }
}
