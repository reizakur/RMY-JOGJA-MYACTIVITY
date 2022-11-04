class KebutuhanAct{
  int? id;
  String? nik;
  String? fullName;
  String? subDivisi;
  String? dateVisit;
  String? location;
  String? status;
  String? description;
  String? target;
  String? stkNumbers;

  KebutuhanAct({this.nik, this.id, this.fullName, this.subDivisi, this.dateVisit, this.location, this.status, this.description, this.target, this.stkNumbers});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['nik'] = nik;
    map['fullName'] = fullName;
    map['subDivisi'] = subDivisi;
    map['dateVisit'] = dateVisit;
    map['location'] = location;
    map['status'] = status;
    map['description'] = description;
    map['target'] = target;
    map['stkNumbers'] = stkNumbers;

    return map;
  }

  KebutuhanAct.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nik = map['nik'];
    this.fullName = map['fullName'];
    this.subDivisi = map['subDivisi'];
    this.dateVisit = map['dateVisit'];
    this.location = map['location'];
    this.status = map['status'];
    this.description = map['description'];
    this.target = map['target'];
    this.stkNumbers = map['stkNumbers'];
  }
}