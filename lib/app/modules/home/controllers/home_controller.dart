import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rajaongkir/app/data/models/city_models.dart';

import '../../../data/models/provinsi_models.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var hiddenKotaAsal = true.obs;
  var provAsalId = 0.obs;
  var kotaAsalId = 0.obs;
  var hiddenKotaTujuan = true.obs;
  var provTujuanId = 0.obs;
  var kotaTujuanId = 0.obs;
  double berat = 0.0;
  String satuan = "Gram";
  late TextEditingController beratC;

  void conversiBerat(String value) {
    berat = double.tryParse(value) ?? 0.0;
    String cekSatuan = satuan;
    switch (cekSatuan) {
      case "Ton":
        berat = berat * 1000000;
        break;
      case "Kg":
        berat = berat * 1000;
        break;
      case "Gram":
        berat = berat;
        break;
      case "Ons":
        berat = berat * 100;
        break;
      default:
        berat = berat;
    }
    print("$berat gram");
    // print(berat);
  }

  void conversiSatuan(String value) {
    berat = double.tryParse(beratC.text) ?? 0.0;

    switch (value) {
      case "Ton":
        berat = berat * 1000000;
        break;
      case "Kg":
        berat = berat * 1000;
        break;
      case "Gram":
        berat = berat;
        break;
      case "Ons":
        berat = berat * 100;
        break;
      default:
        berat = berat;
    }
    satuan = value;
    print("$berat gram");
  }

  @override
  void onInit() {
    beratC = TextEditingController(text: "$berat");
    super.onInit();
  }

  @override
  void onClose() {
    beratC.dispose();
    super.onClose();
  }

  Future<List<Provinsi>> getProvinsi() async {
    var models;
    var url = Uri.parse("https://api.rajaongkir.com/starter/province");
    try {
      var response = await http
          .get(url, headers: {"key": "8993d65330dda201b54a3560bcc08fd6"});

      var statusCode =
          jsonDecode(response.body)["rajaongkir"]["status"]["code"];

      if (statusCode != 200) {
        throw "error";
      }
      var data =
          json.decode(response.body)["rajaongkir"]["results"] as List<dynamic>;

      models = Provinsi.fromJsonList(data);
    } catch (e) {
      print(e);
    }
    return models;
  }

  Future<List<City>> getCity(int provid) async {
    var models;
    var url =
        Uri.parse("https://api.rajaongkir.com/starter/city?province=$provid");
    try {
      var response = await http
          .get(url, headers: {"key": "8993d65330dda201b54a3560bcc08fd6"});

      var statusCode =
          jsonDecode(response.body)["rajaongkir"]["status"]["code"];

      if (statusCode != 200) {
        throw "error";
      }
      var data =
          json.decode(response.body)["rajaongkir"]["results"] as List<dynamic>;

      models = City.fromJsonList(data);
    } catch (e) {
      print(e);
    }
    return models;
  }
}
