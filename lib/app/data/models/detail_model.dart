class Detail {
  String? origin;
  String? destination;
  String? shipper;
  String? receiver;

  Detail({this.origin, this.destination, this.shipper, this.receiver});

  Detail.fromJson(Map<String, dynamic> json) {
    origin = json['origin'];
    destination = json['destination'];
    shipper = json['shipper'];
    receiver = json['receiver'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['origin'] = origin;
    data['destination'] = destination;
    data['shipper'] = shipper;
    data['receiver'] = receiver;
    return data;
  }
}
