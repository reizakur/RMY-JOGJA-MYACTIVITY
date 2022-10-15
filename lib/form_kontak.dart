    import 'package:flutter/material.dart';
    import 'package:uki_flutter/database/db.dart';
    import 'package:uki_flutter/model/kontak.dart';
    
    
    class FormActivity extends StatefulWidget {
        final Activity? activity;
        
    
        FormActivity({this.activity});
    
        @override
       _FormActivitykState createState() => _FormActivitykState();
    }
    
    class _FormActivitykState extends State<FormActivity> {
        DbHelper db = DbHelper();

        TextEditingController? id;
        TextEditingController? nik;
        TextEditingController? fullname;
        TextEditingController? subdivisi;
        TextEditingController? datevisit;
        TextEditingController? location;
        TextEditingController? description;
        TextEditingController? target;
        TextEditingController? stknumbers;

    
        @override
        void initState() {
          nik = TextEditingController(
            text: widget.activity == null ? '' : widget.activity!.nik);

        fullname = TextEditingController(
            text: widget.activity == null ? '' : widget.activity!.fullname);
    
        subdivisi = TextEditingController(
            text: widget.activity == null ? '' : widget.activity!.subdivisi);
    
        datevisit = TextEditingController(
            text: widget.activity == null ? '' : widget.activity!.datevisit);

        location = TextEditingController(
           text: widget.activity == null ? '' : widget.activity!.location);

        description = TextEditingController(
            text: widget.activity == null ? '' : widget.activity!.description);

        target = TextEditingController(
            text: widget.activity == null ? '' : widget.activity!.target);

        stknumbers = TextEditingController(
            text: widget.activity == null ? '' : widget.activity!.stknumbers);

        

        
            
        super.initState();
        }
    
        @override
        Widget build(BuildContext context) {
        return Scaffold(
            appBar:AppBar(
        title: Text('Add Activity', style: TextStyle(fontSize: 23)),
        backgroundColor: Color.fromARGB(255, 255, 17, 17),
        elevation: 7.20  ,
          toolbarHeight: 90,
        ),   
            body: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child:
                 TextField(
                    controller: nik,
                    decoration: InputDecoration(
                        labelText: 'NIK',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child: TextField(
                    controller: fullname,
                    decoration: InputDecoration(
                        labelText: 'Fullname',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child: TextField(
                    controller: subdivisi,
                    decoration: InputDecoration(
                        labelText: 'Subdivisi',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child: TextField(
                    controller: datevisit,
                    decoration: InputDecoration(
                        labelText: 'Date Visit',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child: TextField(
                    controller: location,
                    decoration: InputDecoration(
                        labelText: 'Location',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child: TextField(
                    controller: description,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child: TextField(
                    controller: target,
                    decoration: InputDecoration(
                        labelText: 'Target',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20,
                ),
                child: TextField(
                    controller: stknumbers,
                    decoration: InputDecoration(
                        labelText: 'Stk Numbers',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        )),
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                    top: 20
                ),
                child: MaterialButton(
                    color: Color.fromARGB(255, 255, 17, 17),
                    height: 50,
                    child: (widget.activity  == null)
                        ? Text(
                            'Add',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                        )
                        : Text(
                            'Update',
                            style: TextStyle(color: Colors.white,  fontSize: 17),
                        ),
                    onPressed: () {
                    upsertActivity();
                    },
                ),
                )
            ],
            ),
        );
        }
    
        Future<void> upsertActivity() async {
        if (widget.activity != null) {
            //update
            await db.updateActivity(Activity.fromMap({
            'id' : widget.activity!.id,
            'nik' : nik!.text,
            'fullname' : fullname!.text,
            'subdivisi' : subdivisi!.text,
            'datevisit' : datevisit!.text,
            'location' : location!.text,
            'description' : description!.text,
            'target' : target!.text,
            'stknumbers' : stknumbers!.text,
            }));

            Navigator.pop(context, 'update');


        } else {
            //insert
            await db.saveActivity(Activity(
            nik: nik!.text,
            fullname: fullname!.text,
            subdivisi: subdivisi!.text,
            datevisit: datevisit!.text,
            location: location!.text,
            description: description!.text,
            target: target!.text,
            stknumbers: stknumbers!.text,
            ));
            Navigator.pop(context, 'save');
        }
        }
    }