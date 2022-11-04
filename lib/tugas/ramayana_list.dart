import 'package:flutter/material.dart';
import 'package:uki_flutter/ramayana_home.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'dart:ui';

class RamayanaList extends StatefulWidget {
  const RamayanaList({Key? key}) : super(key: key);

  @override
  State<RamayanaList> createState() => _RamayanaListState();
}

class _RamayanaListState extends State<RamayanaList> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(250, 236, 7, 7),
          actions: <Widget>[
            AnimSearchBar(width: 280,
                textController: textController,
                suffixIcon: Icon(Icons.search_outlined,
                    color: Colors.black),
                prefixIcon: Icon(Icons.search_outlined,
                color: Colors.black,),
                helpText: 'Cari di Sini',
                onSuffixTap: () {
                  setState(() {
                    textController.clear();
                  }
                  );
                }),

            IconButton(
                icon: const Icon(Icons.filter_alt_sharp),
                onPressed: () {}
            ),

          ],

          elevation: 20,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back,
                  size: 18),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          return RamayanaHome();
                        } ));
              }
          ),
      ),

      body:
      Stack(
        children: [
          Container(
            height: 900,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),

          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Color.fromARGB(250, 236, 7, 7),
            ),
          ),


        ],
      ),

    );
  }
}
