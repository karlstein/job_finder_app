import 'package:cloud_firestore/cloud_firestore.dart';

class ProvinsiKotaModel {
  String? id;
  String? provinsi;
  List<dynamic>? kota;

  ProvinsiKotaModel({this.id, this.provinsi, this.kota});

  // Must change kota data type to List<dynamic>?
  ProvinsiKotaModel.fromJson(Map<String, dynamic> json) {
    provinsi = json['provinsi'];
    kota = json['kota'];
  }
}

class CityModel {
  String? provinsi;
  String? kota;
  String? search_string;

  CityModel({this.provinsi, this.kota, this.search_string});

  CityModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    provinsi = snapshot['provinsi'];
    kota = snapshot['kota'];
    search_string = snapshot['search_string'];
  }

  // CityModel.fromDocumentSnapshotString(DocumentSnapshot snapshot) {
  //   search_string = snapshot['search_string'];
  // }
}
