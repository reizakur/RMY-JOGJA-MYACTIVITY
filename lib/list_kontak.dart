    import 'package:uki_flutter/form_kontak.dart';
import 'package:flutter/material.dart';
    import 'package:uki_flutter/database/db.dart';
    import 'package:uki_flutter/model/kontak.dart';
    class ListActivityPage extends StatefulWidget {
        const ListActivityPage({ Key? key }) : super(key: key);
    
        @override
        _ListActivityPageState createState() => _ListActivityPageState();
    }
    
    class _ListActivityPageState extends State<ListActivityPage> {
        List<Activity> listActivity = [];
        DbHelper db = DbHelper();
    
        @override
        void initState() {
        //menjalankan fungsi getallkontak saat pertama kali dimuat
        _getAllActivity();
        super.initState();
        }
    
        @override
        Widget build(BuildContext context) {
        return Scaffold(
            
            appBar: AppBar(
        title: Text('Add Activity', style: TextStyle(fontSize: 23)),
        backgroundColor: Color.fromARGB(255, 255, 17, 17),
        elevation: 7.20  ,
          toolbarHeight: 90,
        ),   
            body: ListView.builder(
                itemCount: listActivity.length,
                itemBuilder: (context, index) {
                    Activity activity = listActivity[index];
                    return Padding(
                    padding: const EdgeInsets.only(
                        top: 20
                    ),
                    child: ListTile(
                        leading: Icon(
                        Icons.person, 
                        size: 50,
                        ),
                        title: Text(
                        '${activity.fullname}'
                        ),
                        subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                            padding: const EdgeInsets.only(
                                top: 8, 
                            ),
                            child: Text("NIK: ${activity.nik}"),
                            ), 
                            Padding(
                            padding: const EdgeInsets.only(
                                top: 8,
                            ),
                            child: Text("Subdivisi: ${activity.subdivisi}"),
                            ),
                            Padding(
                            padding: const EdgeInsets.only(
                                top: 8,
                            ),
                            child: Text("Date Visit: ${activity.datevisit}"),
                            ),
                            Padding(
                            padding: const EdgeInsets.only(
                                top: 8,
                            ),
                            child: Text("Location: ${activity.location}"),
                            ),
                            Padding(
                            padding: const EdgeInsets.only(
                                top: 8,
                            ),
                            child: Text("Description: ${activity.description}"),
                            ),
                            Padding(
                            padding: const EdgeInsets.only(
                                top: 8,
                            ),
                            child: Text("Target: ${activity.target}"),
                            ),
                            Padding(
                            padding: const EdgeInsets.only(
                                top: 8,
                            ),
                            child: Text("STK Numbers: ${activity.stknumbers}"),
                            ),
                        ],
                        ),
                        trailing: 
                        FittedBox(
                        fit: BoxFit.fill,
                        child: Row(
                            children: [
                            // button edit 
                            IconButton(
                                onPressed: () {
                                _openFormEdit(activity);
                                },
                                icon: Icon(Icons.edit)
                            ),
                            // button hapus
                            IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: (){
                                //membuat dialog konfirmasi hapus
                                AlertDialog hapus = AlertDialog(
                                    title: Text("Information"),
                                    content: Container(
                                    height: 100, 
                                    child: Column(
                                        children: [
                                        Text(
                                            "Yakin ingin Menghapus Data ${activity.fullname}"
                                        )
                                        ],
                                    ),
                                    ),
                                    //terdapat 2 button.
                                    //jika ya maka jalankan _deleteKontak() dan tutup dialog
                                    //jika tidak maka tutup dialog
                                    actions: [
                                    TextButton(
                                        onPressed: (){
                                        _deleteActivity(activity, index);
                                        Navigator.pop(context);
                                        }, 
                                        child: Text("Ya")
                                    ), 
                                    TextButton(
                                        child: Text('Tidak'),
                                        onPressed: () {
                                        Navigator.pop(context);
                                        },
                                    ),
                                    ],
                                );
                                showDialog(context: context, builder: (context) => hapus);
                                }, 
                            )
                            ],
                        ),
                        ),
                    ),
                    );
                }),
                //membuat button mengapung di bagian bawah kanan layar
                floatingActionButton: FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 255, 17, 17),
                    child: Icon(Icons.add), 
                    onPressed: (){
                    _openFormCreate();
                    },
                ),
            
        );
        }
    
        //mengambil semua data Kontak
        Future<void> _getAllActivity() async {
        //list menampung data dari database
        var list = await db.getAllActivity();
    
        //ada perubahanan state
        setState(() {
            //hapus data pada listKontak
            listActivity.clear();
    
            //lakukan perulangan pada variabel list
            list!.forEach((activity) {
            
            //masukan data ke listKontak
            listActivity.add(Activity.fromMap(activity));
            });
        });
        }
    
        //menghapus data Kontak
        Future<void> _deleteActivity(Activity activity, int position) async {
        await db.deleteActivity(activity.id!);
        setState(() {
            listActivity.removeAt(position);
        });
        }
    
        // membuka halaman tambah Kontak
        Future<void> _openFormCreate() async {
        var result = await Navigator.push(
            context, MaterialPageRoute(builder: (context) => FormActivity()));
        if (result == 'save') {
            await _getAllActivity();
        }
        }
    
        //membuka halaman edit Kontak
        Future<void> _openFormEdit(Activity activity) async {
        var result = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => FormActivity(activity: activity,)));
        if (result == 'update') {
            await _getAllActivity();
        }
        }
    }