import 'package:cek_resi/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../models/summary_model.dart';

class SummaryProvider extends GetConnect {
  Future<Summary?> getSummary() async {
    String apiKey =
        "3abd53a294889d60f7367b6856cc5409e30bf7699f77cd04c00893bb86f9b837";
    final response = await get(
        'https://api.binderbyte.com/v1/track?api_key=$apiKey&courier=${HomeController().courierSelected.value}&awb=${HomeController().awbNumberC.text}');
    return Summary.fromJson(response.body["data"]["summary"]);
  }
}
