import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../data/models/summary_model.dart';
import '../../../data/providers/summary_provider.dart';
import '../../../data/models/detail_model.dart';
import '../../../data/models/history_model.dart';

class HomeController extends GetxController {
  RxString courierSelected = "null".obs;
  TextEditingController awbNumberC = TextEditingController();

  SummaryProvider summaryProv = SummaryProvider();

  Future<Summary?> getDataSummary() async {
    return await summaryProv.getSummary();
  }

}
