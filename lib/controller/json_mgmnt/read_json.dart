import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:newsanbercode/models/job_model.dart';
import 'package:newsanbercode/models/provinsi_kota.dart';

class ReadJson {
  Future<List<JobModel>> readJsonData(String jsonName) async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/json/joblist2.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => JobModel.fromJson(e)).toList();
  }

  Future<List<ProvinsiKotaModel>> readCityData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/json/city.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => ProvinsiKotaModel.fromJson(e)).toList();
  }
}
