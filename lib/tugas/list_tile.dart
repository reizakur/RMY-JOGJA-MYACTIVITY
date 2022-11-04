// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:uki_flutter/models/models_act.dart';
// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
// import 'package:uki_flutter/local_database/local_form_ramayana.dart';
// import 'package:uki_flutter/ramayana_home.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:uki_flutter/ramayana_db.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:uki_flutter/models/helper.dart';
// import 'package:uki_flutter/local_database/local_database_ramayana.dart';
//
// class RamayanaTable extends StatefulWidget {
//   const RamayanaTable({super.key});
//
//   @override
//   State<RamayanaTable> createState() => _RamayanaTableState();
// }
//
// class _RamayanaTableState extends State<RamayanaTable> {
//   List<KebutuhanAct> listActivity = [];
//   DbHelper db = DbHelper();
//
//   final ScrollController _horizontal = ScrollController(),
//       _vertical = ScrollController();
//
//   @override
//   void initState() {
//     //menjalankan fungsi getallkontak saat pertama kali dimuat
//     _getAllActivity();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: TextField(
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//                 borderSide: BorderSide.none,
//               ),
//               isCollapsed: true,
//               labelText: 'Search',
//               prefixIcon: Icon(Icons.search),
//               // suffixText: 'Search'
//             ),
//           ),
//           backgroundColor: Color.fromARGB(255, 255, 17, 17),
//           elevation: 7.20,
//           toolbarHeight: 75,
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.filter_alt),
//               onPressed: () {},
//             ),
//           ],
//           leading: IconButton(
//               icon: const Icon(Icons.arrow_back, size: 18),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return RamayanaAct();
//                 }));
//               })),
//       body: ListView.builder(
//         // scrollDirection: Axis.horizontal,
//         // controller: _vertical,
//           itemCount: listActivity.length,
//           itemBuilder: (context, index) {
//             KebutuhanAct activityy = listActivity[index];
//             return Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: ListTile(
//                 title: Text('${activityy.fullName}'),
//                 subtitle: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 8,
//                       ),
//                       child: Text("nik: ${activityy.nik}"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 8,
//                       ),
//                       child: Text("Full Name: ${activityy.fullName}"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 8,
//                       ),
//                       child: Text("Sub Divisi: ${activityy.subDivisi}"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 8,
//                       ),
//                       child: Text("Lokasi: ${activityy.location}"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 8,
//                       ),
//                       child: Text("Date Visit: ${activityy.dateVisit}"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 8,
//                       ),
//                       child: Text("Deskripsi: ${activityy.description}"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 8,
//                       ),
//                       child: Text("Target: ${activityy.target}"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 8,
//                       ),
//                       child: Text("STK Numbers: ${activityy.stkNumbers}"),
//                     ),
//                   ],
//                 ),
//                 trailing: FittedBox(
//                   fit: BoxFit.fill,
//                   child: Row(
//                     children: [
//                       // button edit
//                       IconButton(
//                           onPressed: () {
//                             _openFormEdit(activityy);
//                           },
//                           icon: Icon(Icons.edit)
//                       ),
//                       // button hapus
//                       IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () {
//                           //membuat dialog konfirmasi hapus
//                           AlertDialog hapus = AlertDialog(
//                             title: Text("Information"),
//                             content: Container(
//                               height: 100,
//                               child: Column(
//                                 children: [
//                                   Text(
//                                       "Yakin ingin Menghapus Data ${activityy.fullName}")
//                                 ],
//                               ),
//                             ),
//                             //terdapat 2 button.
//                             //jika ya maka jalankan _deleteKontak() dan tutup dialog
//                             //jika tidak maka tutup dialog
//                             actions: [
//                               TextButton(
//                                   onPressed: () {
//                                     _deleteActivity(activityy, index);
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text("Ya")),
//                               TextButton(
//                                 child: Text('Tidak'),
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                             ],
//                           );
//                           showDialog(
//                               context: context, builder: (context) => hapus);
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
//
//   //mengambil semua data Kontak
//   Future<void> _getAllActivity() async {
//     //list menampung data dari database
//     var list = await db.getAllActivity();
//
//     //ada perubahanan state
//     setState(() {
//       //hapus data pada listKontak
//       listActivity.clear();
//
//       //lakukan perulangan pada variabel list
//       list!.forEach((activity) {
//         //masukan data ke listKontak
//         listActivity.add(KebutuhanAct.fromMap(activity));
//       });
//     });
//   }
//
//   //menghapus data Kontak
//   Future<void> _deleteActivity(KebutuhanAct activity, int position) async {
//     await db.deleteActivity(activity.id!);
//     setState(() {
//       listActivity.removeAt(position);
//     });
//   }
//
//   // membuka halaman tambah Kontak
//   Future<void> _openFormCreate() async {
//     var result = await Navigator.push(
//         this.context, MaterialPageRoute(builder: (context) => RamayanaAct()));
//     if (result == 'save') {
//       await _getAllActivity();
//     }
//   }
//
//   //membuka halaman edit Kontak
//   Future<void> _openFormEdit(KebutuhanAct activity) async {
//     var result = await Navigator.push(
//         this.context,
//         MaterialPageRoute(
//             builder: (context) => RamayanaAct(
//               activity: activity,
//             )));
//     if (result == 'update') {
//       await _getAllActivity();
//     }
//   }
// }
