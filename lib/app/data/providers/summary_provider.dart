import 'package:get/get.dart';

import '../models/summary_model.dart';

class SummaryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Summary.fromJson(map);
      if (map is List)
        return map.map((item) => Summary.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Summary?> getSummary(int id) async {
    final response = await get('summary/$id');
    return response.body;
  }

  Future<Response<Summary>> postSummary(Summary summary) async =>
      await post('summary', summary);
  Future<Response> deleteSummary(int id) async => await delete('summary/$id');
}
