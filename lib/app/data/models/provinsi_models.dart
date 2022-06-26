class Provinsi {
  String? provinceId;
  String? province;

  Provinsi(
      {this.provinceId,
      this.province,
      required Future<List<Provinsi>> controller});

  Provinsi.fromJson(Map<String, dynamic> json) {
    provinceId = json['province_id'];
    province = json['province'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['province_id'] = this.provinceId;
    data['province'] = this.province;
    return data;
  }

  static List<Provinsi> fromJsonList(List list) {
    if (list.isEmpty) return List<Provinsi>.empty();
    return list.map((item) => Provinsi.fromJson(item)).toList();
  }
}
