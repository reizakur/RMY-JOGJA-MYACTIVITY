import 'package:flutter/material.dart';

class TugasNews extends StatelessWidget {
  const TugasNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uki News'),
        //backgroundColor: Colors.blueGrey,
        backgroundColor: Colors.black54,
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
        leading: PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return[
              PopupMenuItem(child: Text('Anime')),
              PopupMenuItem(child: Text('Games')),
            ];
          }
        ),
      ),

      body:
      Stack(
        children: [
          Container(
            child:
            Image.asset(
              "assets/yel.jpg",
              // width: 400,
              // height: 300
            )
          ),

          ListView(
            children: [
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
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(10))
                ),
                child:
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('One Piece tayang di Indonesia, Catat Tanggalnya',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text('Selasa, 30 Agustus 2022',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Container(
              //   //margin: EdgeInsets.only(left: 20, top: 20),
              //   margin: EdgeInsets.all(20),
              //   height: 150,
              //   color: Colors.black12,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: <Widget>[
              //       ClipRRect(
              //         borderRadius: BorderRadius.circular(30),
              //         child:
              //           Image.asset('assets/sabo.png',
              //             width: 80,
              //             height: 80,
              //             fit: BoxFit.fitHeight,
              //           )
              //       ),
              //
              //       Expanded(
              //         child:
              //           Text('Sabo tertangkap, Bagaimana nasib Revolutionary Army? Dragon mulai bergerak!',
              //             style: TextStyle(
              //                 color: Colors.black54),
              //             softWrap: false,
              //             maxLines: 2,
              //             overflow: TextOverflow.ellipsis
              //           ),
              //       )
              //
              //     ],
              //   ),
              // ),

              Card(
              color: Colors.white70,
               child: ListTile(
                 leading: ClipRRect(
                     borderRadius: BorderRadius.circular(25),
                     child:
                     Image.asset('assets/sabo.png',
                       width: 100,
                       height: 200,
                       fit: BoxFit.fitHeight,
                     )
                 ),
                 title: Text(
                     'Sabo tertangkap, Bagaimana nasib Revolutionary Army? Dragon mulai bergerak!',
                   maxLines: 4,
                   overflow: TextOverflow.ellipsis,
                 ),
               ),
              ),

              Card(
                color: Colors.white70,
                child: ListTile(
                  leading:
                  ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:
                      Image.asset('assets/shanks.jpg',
                        width: 100,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      )
                  ),
                  title: Text(
                    'Terungkap Kemampuan Kru Akagami no Shanks!',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              Card(
                color: Colors.white70,
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:
                      Image.asset('assets/aot.jpg',
                        width: 100,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      )
                  ),
                  title: Text(
                    'Attack On Titan Final Season Sebentar Lagi!',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              Card(
                color: Colors.white70,
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:
                      Image.asset('assets/doma2.jpg',
                        width: 100,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      )
                  ),
                  title: Text(
                    'Demon Slayer Season 4 Akan Tayang 2023. Terungkap kekuatan Upper Moon 2!',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              Card(
                color: Colors.white70,
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:
                      Image.asset('assets/joyboy.jpg',
                        width: 100,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      )
                  ),
                  title: Text(
                    'Prediksi Sosok JoyBoy ada di Final Saga!',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              Card(
                color: Colors.white70,
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:
                      Image.asset('assets/mera.jpg',
                        width: 100,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      )
                  ),
                  title: Text(
                    '5 Fakta Kekuatan Mera Mera Milik Sabo!',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              Card(
                color: Colors.white70,
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:
                      Image.asset('assets/jijutsu.jpg',
                        width: 100,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      )
                  ),
                  title: Text(
                    'Kabar Gembira buat Fans Jijutsu Kaizen, Simak Beritanya!',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              Card(
                color: Colors.white70,
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:
                      Image.asset('assets/akanomi.jpg',
                        width: 100,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      )
                  ),
                  title: Text(
                    'Berikut Pemakan Buah Iblis dan Kekuatannya!',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              Card(
                color: Colors.white70,
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:
                      Image.asset('assets/uta.jpeg',
                        width: 100,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      )
                  ),
                  title: Text(
                    'Shanks, Bang Toyib yang Meninggalkan Putri Cantik Uta.',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

            ],
          )
        ],
      ),



    );
  }
}
