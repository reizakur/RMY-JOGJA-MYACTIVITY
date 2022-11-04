import 'package:flutter/material.dart';

class BeritaApp extends StatelessWidget {
  const BeritaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uki News'),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {}
            ),
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {}
          )
         ],
        elevation: 40,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu',
            onPressed: () {}
        ),
        ),

      body: Stack(children: [
        Container(
          height: 220,
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
          ),
          child:
          Image.asset(
              "assets/ored.jpg",
            width: 400,
            height: 300,
            fit: BoxFit.fitWidth,
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 190),
          height: 40,
          decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(10))
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 190, left: 10),
          height: 40,
          decoration: BoxDecoration(
              //color: Colors.green,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(10))
          ),
          child:
          Column(
            children: [
              Text('One Piece tayang di Indonesia, Catat Tanggalnya',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                ),
              ),

              Text('One Piece tayang di Indonesia, Catat Tanggalnya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )

          ],
        ),
      );
  }
}
