import 'package:dropdown_search2/dropdown_search2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'component/kota.dart';
import 'component/provins.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ongkos Kirim '),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Provins(tipe: "asal"),
          Obx(
            () => controller.hiddenKotaAsal.isTrue
                ? SizedBox()
                : Kota(
                    provId: controller.provAsalId.value,
                    tipe: "asal",
                  ),
          ),
          SizedBox(height: 10),
          Provins(tipe: "tujuan"),
          Obx(
            () => controller.hiddenKotaTujuan.isTrue
                ? SizedBox()
                : Kota(
                    provId: controller.provTujuanId.value,
                    tipe: "tujuan",
                  ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Berat Barang",
                    hintText: "Masukkan Berat",
                    border: OutlineInputBorder(),
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: controller.beratC,
                  onChanged: (value) => controller.conversiBerat(value),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 150,
                // color: Colors.red,
                child: DropdownSearch<String>(
                  mode: Mode.BOTTOM_SHEET,
                  showSelectedItems: true,
                  items: [
                    "Ton",
                    "Kg",
                    "Gram",
                    "Ons",
                  ],
                  // ignore: deprecated_member_use
                  hint: "satuan",
                  // ignore: deprecated_member_use
                  label: "Satuan",
                  onChanged: (value) => controller.conversiSatuan(value!),
                  selectedItem: "Gram",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
