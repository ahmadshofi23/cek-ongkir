import 'package:dropdown_search2/dropdown_search2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/city_models.dart';
import '../../controllers/home_controller.dart';

class Kota extends GetView<HomeController> {
  const Kota({
    Key? key,
    required this.tipe,
    required this.provId,
  }) : super(key: key);

  final provId;
  final String tipe;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<City>(
      onFind: (text) => controller.getCity(provId),
      showSearchBox: true,
      // mode: Mode.,
      showClearButton: true,
      dropdownSearchDecoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 25,
        ),
        // hintText: "Cari Provinsi",
        labelText: tipe == "asal"
            ? "Kota / Kabupaten Asal"
            : "Kota / Kabupaten Tujuan",
        border: OutlineInputBorder(),
      ),
      popupItemBuilder: (context, item, isSelected) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "${item.type}  ${item.cityName}",
            style: TextStyle(fontSize: 18),
          ),
        );
      },
      itemAsString: (item) => item!.type! + item.cityName!,
      onChanged: (value) {
        if (value != null) {
          // print(value.cityName);
          if (tipe == "asal") {
            controller.kotaAsalId.value = int.parse(value.cityId!);
            controller.hiddenKotaAsal.value = false;
            print("Kota Asal : ${value.cityName}");
            print("Kota Asal : ${value.cityId}");
          } else {
            controller.hiddenKotaTujuan.value = false;
            controller.kotaTujuanId.value = int.parse(value.cityId!);
            print("Kota Tujuan : ${value.cityName}");
            print("Kota Asal : ${value.cityId}");
          }
          // print(controller.provId.value);
          controller.showButton();
        } else {
          if (tipe == "asal") {
            controller.hiddenKotaAsal.value = true;
            controller.provAsalId.value = 0;
            // print(value.provinceId);
            controller.codeKurir.value = "";
          } else {
            controller.hiddenKotaTujuan.value = true;
            controller.provTujuanId.value = 0;
            controller.codeKurir.value = "";
          }
          controller.showButton();
        }
      },
    );
  }
}
