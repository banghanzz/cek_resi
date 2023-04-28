import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../data/models/summary_model.dart';
import '../../../data/providers/summary_provider.dart';
import '../../../data/models/detail_model.dart';
import '../../../data/models/history_model.dart';
import '../widgets/result_widget.dart';

class HomeController extends GetxController {
  RxString courierSelected = "null".obs;
  TextEditingController awbNumberC = TextEditingController();

  SummaryProvider summaryProv = SummaryProvider();

  Future<Summary?> getSummary() async {
    return await summaryProv.getSummary();
  }

  void cekResi() {
    print("Nih datanya : $getSummary()");
  }

  //   if (courierSelected != "null" && awbNumberC.text != "") {
  //     try {
  //       String apiKey =
  //           "3abd53a294889d60f7367b6856cc5409e30bf7699f77cd04c00893bb86f9b837";

  //       var response = await http.get(Uri.parse(
  //           'https://api.binderbyte.com/v1/track?api_key=$apiKey&courier=${courierSelected.value}&awb=${awbNumberC.text}'));

  //       if (response.statusCode == 200) {
  //         print(await response);
  //       } else {
  //         print(response.reasonPhrase);
  //         print(response.statusCode);
  //       }
  //     } catch (e) {
  //       print("Kesalahan");
  //     }
  //   }
}
