import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxString courierSelected = "null".obs;
  TextEditingController awbNumberC = TextEditingController();

  void cekResi() async {
    if (courierSelected != "null" && awbNumberC.text != "") {
      try {
        String apiKey =
            "3abd53a294889d60f7367b6856cc5409e30bf7699f77cd04c00893bb86f9b837";
        // var resultResponse = await http.get(Uri.parse(
        //     'https://api.binderbyte.com/v1/track?api_key=$apiKey&courier=$courierSelected&awb=$awbNumberC'));
        // print(resultResponse.statusCode);
        // print(resultResponse.body);

        var request = http.Request(
            'GET',
            Uri.parse(
                'https://api.binderbyte.com/v1/track?api_key=$apiKey&courier=${courierSelected.value}&awb=${awbNumberC.text}'));

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
        } else {
          print(response.reasonPhrase);
          print(response.statusCode);
        }
      } catch (e) {
        print("Kesalahan");
      }
    }
  }
}
