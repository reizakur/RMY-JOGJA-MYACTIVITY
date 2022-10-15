class Activity{
    int? id;
    String? nik;
    String? fullname;
    String? subdivisi;
    String? datevisit;
    String? location;
    String? description;
    String? target;
    String? stknumbers;
    
    Activity({this.id, this.nik, this.fullname, this.subdivisi, this.datevisit, this.location, this.description, this.target, this.stknumbers});
    
    Map<String, dynamic> toMap() {
        var map = Map<String, dynamic>();
  
  if (id != null) {
          map['id'] = id;
        }
        map['nik'] = nik;
        map['fullname'] = fullname;
        map['subdivisi'] = subdivisi;
        map['datevisit'] = datevisit;
        map['location'] = location;
        map['description'] = description;
        map['target'] = target;
        map['stknumbers'] = stknumbers;
        
        return map;
    }
    
    Activity.fromMap(Map<String, dynamic> map) {
        this.id = map['id'];
        this.nik = map['nik'];
        this.fullname = map['fullname'];
        this.subdivisi = map['subdivisi'];
        this.datevisit = map['datevisit'];
        this.location = map['location'];
        this.description = map['description'];
        this.target = map['target'];
        this.stknumbers = map['stknumbers'];
    }
}