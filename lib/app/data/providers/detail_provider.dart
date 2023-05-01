import 'package:get/get.dart';

import '../../modules/home/controllers/home_controller.dart';
import '../models/detail_model.dart';

class DetailProvider extends GetConnect {
  Future<Detail?> getDetail() async {
    final homeC = Get.put(HomeController());

    String apiKey =
        "15b6c6ef87bd41b5bac89fe094f87cf808af7d6927fb5fde15c4b456533ac1d3";
    final response = await get(
        'https://api.binderbyte.com/v1/track?api_key=$apiKey&courier=${homeC.courierSelected.value}&awb=${homeC.awbNumberC.text}');
    return Detail.fromJson(response.body['data']['detail']);
  }
}
