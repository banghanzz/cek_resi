import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/providers/summary_provider.dart';
import '../../../data/providers/detail_provider.dart';
import '../../../data/providers/history_provider.dart';

import '../../../data/models/summary_model.dart';
import '../../../data/models/detail_model.dart';
import '../../../data/models/history_model.dart';

class HomeController extends GetxController {
  //User Input Controller
  RxString courierSelected = "".obs;
  RxString courierLogo = "".obs;
  TextEditingController awbNumberC = TextEditingController();

  //Get data controller
  SummaryProvider summaryProv = SummaryProvider();
  Future<Summary?> getDataSummary() async {
    return await summaryProv.getSummary();
  }

  DetailProvider detailProv = DetailProvider();
  Future<Detail?> getDataDetail() async {
    return await detailProv.getDetail();
  }

  HistoryProvider historyProv = HistoryProvider();
  Future<List<History>> getDataHistory() async {
    return await historyProv.getHistory();
  }
}
