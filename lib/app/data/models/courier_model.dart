class Courier {
  String? courierId;
  String? courierName;

  Courier({this.courierId, this.courierName});

  Courier.fromJson(Map<String, dynamic> json) {
    courierId = json['courier_id'];
    courierName = json['courier_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['courier_id'] = courierId;
    data['courier_name'] = courierName;
    return data;
  }
}
