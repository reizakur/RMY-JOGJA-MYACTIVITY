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
      title: 'Data Karyawan',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          elevation: 7.7,
          leading: Icon(Icons.home_outlined),
          // title: Center(child: Text('Welcome Bos')),
          title: Text('Data Karyawan'),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 30, 10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  padding: EdgeInsets.symmetric(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    'Tambah',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {},
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    'Filter',
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Text('M Syauqi'),
                onPressed: () {},
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Text('Jaka P'),
                onPressed: () {},
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Text('Luqman Dwi'),
                onPressed: () {},
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Text('Adhelia Putri'),
                onPressed: () {},
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  padding: EdgeInsets.symmetric(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    'Simpan',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {},
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    'Keluar',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
