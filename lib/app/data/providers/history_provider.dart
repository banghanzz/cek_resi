import 'package:get/get.dart';

import '../models/history_model.dart';

class HistoryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return History.fromJson(map);
      if (map is List)
        return map.map((item) => History.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<History?> getHistory(int id) async {
    final response = await get('history/$id');
    return response.body;
  }

  Future<Response<History>> postHistory(History history) async =>
      await post('history', history);
  Future<Response> deleteHistory(int id) async => await delete('history/$id');
}
