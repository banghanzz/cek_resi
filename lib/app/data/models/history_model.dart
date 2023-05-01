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

  // static List<History> fromJsonList(List? data) {
  //   if (data == null || data.length == 0) return [];
  //   return data.map((e) => History.fromJson(e)).toList();
  // }
}
