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

// class TabelLagi extends StatefulWidget {
//   const TabelLagi({super.key});

//   @override
//   State<TabelLagi> createState() => _TabelLagiState();
// }

// class _TabelLagiState extends State<TabelLagi> {
//   List<KebutuhanAct> listActivity = [];
//   DbHelper db = DbHelper();

//   final ScrollController _horizontal = ScrollController(),
//       _vertical = ScrollController();

//   @override
//   void initState() {
//     //menjalankan fungsi getallkontak saat pertama kali dimuat
//     _getAllActivity();
//     super.initState();
//   }

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
//           scrollDirection: Axis.horizontal,
//           controller: _vertical,
//           itemCount: listActivity.length,
//           itemBuilder: (context, index) {
//             KebutuhanAct activityy = listActivity[index];
//             return DataTable(columns: <DataColumn>[
//               DataColumn(label: Text('NIK')),
//               DataColumn(label: Text('Full Name')),
//               DataColumn(label: Text('Sub Divisi')),
//               DataColumn(label: Text('Date Visit')),
//               DataColumn(label: Text('Location')),
//               DataColumn(label: Text('Description')),
//               DataColumn(label: Text('Target')),
//               DataColumn(label: Text('STK Numbers')),
//               DataColumn(label: Text('Delete')),
//               DataColumn(label: Text('Edit')),
//             ], rows: <DataRow>[
//               DataRow(cells: [
//                 DataCell(Text("${activityy.nik}".toString())),
//                 DataCell(Text("${activityy.fullName}".toString())),
//                 DataCell(Text("${activityy.subDivisi}".toString())),
//                 DataCell(Text("${activityy.dateVisit}".toString())),
//                 DataCell(Text("${activityy.location}".toString())),
//                 DataCell(Text("${activityy.description}".toString())),
//                 DataCell(Text("${activityy.target}".toString())),
//                 DataCell(Text("${activityy.stkNumbers}".toString())),
//               ])
//             ]);
//           }),
//     );
//   }

//   //mengambil semua data Kontak
//   Future<void> _getAllActivity() async {
//     //list menampung data dari database
//     var list = await db.getAllActivity();

//     //ada perubahanan state
//     setState(() {
//       //hapus data pada listKontak
//       listActivity.clear();

//       //lakukan perulangan pada variabel list
//       list!.forEach((activity) {
//         //masukan data ke listKontak
//         listActivity.add(KebutuhanAct.fromMap(activity));
//       });
//     });
//   }

//   //menghapus data Kontak
//   Future<void> _deleteActivity(KebutuhanAct activity, int position) async {
//     await db.deleteActivity(activity.id!);
//     setState(() {
//       listActivity.removeAt(position);
//     });
//   }

//   // membuka halaman tambah Kontak
//   Future<void> _openFormCreate() async {
//     var result = await Navigator.push(
//         this.context, MaterialPageRoute(builder: (context) => RamayanaAct()));
//     if (result == 'save') {
//       await _getAllActivity();
//     }
//   }

//   //membuka halaman edit Kontak
//   Future<void> _openFormEdit(KebutuhanAct activity) async {
//     var result = await Navigator.push(
//         this.context,
//         MaterialPageRoute(
//             builder: (context) => RamayanaAct(
//                   activity: activity,
//                 )));
//     if (result == 'update') {
//       await _getAllActivity();
//     }
//   }
// }
