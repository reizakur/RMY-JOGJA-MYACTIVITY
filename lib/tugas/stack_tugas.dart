import 'package:flutter/material.dart';

class TampilanAtas extends StatelessWidget {
  const TampilanAtas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[

        Container(
            //color: Colors.pinkAccent,
            height: 350,
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(30)
            ),
        ),

        Container(
          margin: EdgeInsets.fromLTRB(20, 70, 20, 630),
          //color: Colors.green,
          width: 200,

          //Ini kolom tulisan
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Syauqi',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 28,
                    )
                ),

              Text(
                '082237300203',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20
                ),
              ),
             ],
           ),
        ),

        Container(
          margin: EdgeInsets.fromLTRB(20, 220, 20, 20),
          height: 520,

          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 90),
                height: 75,
                color: Colors.orangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.subdirectory_arrow_left_outlined,
                        color: Colors.redAccent),
                    Text('Makan Sebulan',
                        style: TextStyle(
                            color: Colors.white)
                    ),
                    Text('700.000'),
                  ],
                ),
              ),

              Container(
                height: 75,
                margin: EdgeInsets.only(top: 5),
                color: Colors.orangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.subdirectory_arrow_left_outlined,
                        color: Colors.redAccent),
                    Text('Service Motor',
                        style: TextStyle(
                            color: Colors.white)
                    ),
                    Text('100.000'),
                  ],
                ),
              ),

              Container(
                height: 75,
                margin: EdgeInsets.only(top: 5),
                color: Colors.orangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.subdirectory_arrow_right_outlined,
                        color: Colors.green),
                    Text('Gajian',
                        style: TextStyle(
                            color: Colors.white)
                    ),
                    Text('7.000.000'),
                  ],
                ),
              ),

              Container(
                height: 75,
                margin: EdgeInsets.only(top: 5),
                color: Colors.orangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.subdirectory_arrow_left_outlined,
                        color: Colors.redAccent),
                    Text('Cicilan motor',
                        style: TextStyle(
                            color: Colors.white)
                    ),
                    Text('1.000.000'),
                  ],
                ),
              ),

              Container(
                height: 75,
                margin: EdgeInsets.only(top: 5),
                color: Colors.orangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.subdirectory_arrow_right_outlined,
                        color: Colors.green),
                    Text('Jualan Fashion',
                        style: TextStyle(
                            color: Colors.white)
                    ),
                    Text('3.000.000'),
                  ],
                ),
              ),

              Container(
                height: 75,
                margin: EdgeInsets.only(top: 5),
                color: Colors.orangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.subdirectory_arrow_left_outlined,
                        color: Colors.redAccent),
                    Text('Investasi',
                        style: TextStyle(
                            color: Colors.white)
                    ),
                    Text('1.000.000'),
                  ],
                ),
              ),

              Container(
                height: 75,
                margin: EdgeInsets.only(top: 5),
                color: Colors.orangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.subdirectory_arrow_right_outlined,
                        color: Colors.green),
                    Text('Setoran Parkiran',
                        style: TextStyle(
                            color: Colors.white)
                    ),
                    Text('1.000.000'),
                  ],
                ),
              ),

              Container(
                height: 75,
                margin: EdgeInsets.only(top: 5),
                color: Colors.orangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.subdirectory_arrow_left_outlined,
                        color: Colors.redAccent),
                    Text('Makan Siang',
                        style: TextStyle(
                            color: Colors.white)
                    ),
                    Text('13.000'),
                  ],
                ),
              )
            ],
          ),
        ),


       Container(
            margin: EdgeInsets.fromLTRB(15, 175.5, 15, 200),
            height: 175,
            width: 400,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
             children: [Text(
                 'Penghasilan',
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 12,
               ),
             ),
               Text(
                 '11.000.000',
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                 ),
               ),
             ],
           ),

             Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [Text(
                 'Pengeluaran',
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 12,
                 ),
               ),
                 Text(
                   '3.000.000',
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 20,
                   ),
                 ),
               ],
             ),
           ],
         ),
        ),


        ],
    ),
    );
  }
}
