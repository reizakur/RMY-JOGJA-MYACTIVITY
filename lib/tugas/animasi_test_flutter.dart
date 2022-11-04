import 'package:flutter/material.dart';

class Animasi extends StatefulWidget {
  const Animasi({super.key});

  @override
  State<Animasi> createState() => _AnimasiState();
}

class _AnimasiState extends State<Animasi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 90,
            height: 90,
            color: Colors.green,
          ),
          Container(
            width: 80,
            height: 80,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
