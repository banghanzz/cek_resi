class Summary {
  String? awb;
  String? courier;
  String? service;
  String? status;
  String? date;
  String? desc;
  String? amount;
  String? weight;

  Summary(
      {this.awb,
      this.courier,
      this.service,
      this.status,
      this.date,
      this.desc,
      this.amount,
      this.weight});

  Summary.fromJson(Map<String, dynamic> json) {
    awb = json['awb'];
    courier = json['courier'];
    service = json['service'];
    status = json['status'];
    date = json['date'];
    desc = json['desc'];
    amount = json['amount'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['awb'] = awb;
    data['courier'] = courier;
    data['service'] = service;
    data['status'] = status;
    data['date'] = date;
    data['desc'] = desc;
    data['amount'] = amount;
    data['weight'] = weight;
    return data;
  }

  // static List<Summary> fetchAlbum(List? data) {
  //   if (data == null || data.length == 0) return [];
  //   return data.map((e) => Summary.fromJson(e)).toList();
  // }
}
