class History {
  String? date;
  String? desc;
  String? location;

  History({this.date, this.desc, this.location});

  History.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    desc = json['desc'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['desc'] = desc;
    data['location'] = location;
    return data;
  }
}
