import 'package:get/get.dart';

import '../models/detail_model.dart';

class DetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Detail.fromJson(map);
      if (map is List) return map.map((item) => Detail.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Detail?> getDetail(int id) async {
    final response = await get('detail/$id');
    return response.body;
  }

  Future<Response<Detail>> postDetail(Detail detail) async =>
      await post('detail', detail);
  Future<Response> deleteDetail(int id) async => await delete('detail/$id');
}
