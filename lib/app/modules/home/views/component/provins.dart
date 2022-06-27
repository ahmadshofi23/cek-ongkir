import 'package:dropdown_search2/dropdown_search2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/provinsi_models.dart';
import '../../controllers/home_controller.dart';

class Provins extends GetView<HomeController> {
  const Provins({
    Key? key,
    required this.tipe,
  }) : super(key: key);

  final String tipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownSearch<Provinsi>(
        onFind: (text) => controller.getProvinsi(),
        showSearchBox: true,
        // mode: Mode.,
        showClearButton: true,
        dropdownSearchDecoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 25,
          ),
          // hintText: "Cari Provinsi",
          labelText: tipe == "asal" ? "Provinsi Asal" : "Provinsi Tujuan",
          border: OutlineInputBorder(),
        ),
        popupItemBuilder: (context, item, isSelected) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "${item.province}",
              style: TextStyle(fontSize: 18),
            ),
          );
        },
        itemAsString: (item) => item!.province!,
        onChanged: (value) {
          if (value != null) {
            // print(value.province);
            if (tipe == "asal") {
              controller.hiddenKotaAsal.value = false;
              controller.provAsalId.value = int.parse(value.provinceId!);
              print("Provinsi Asal ${value.province}");
            } else {
              controller.hiddenKotaTujuan.value = false;
              controller.provTujuanId.value = int.parse(value.provinceId!);
              print("Provinsi Tujuan ${value.province}");
            }
            // print(controller.provId.value);
          } else {
            if (tipe == "asal") {
              controller.hiddenKotaAsal.value = true;
              controller.provAsalId.value = 0;
              // print(value.provinceId);
            } else {
              controller.hiddenKotaTujuan.value = true;
              controller.provTujuanId.value = 0;
            }
            controller.showButton();
          }
        },
      ),
    );
  }
}
