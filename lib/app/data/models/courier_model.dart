class Courier {
  String? code;
  String? name;
  List<Costs>? costs;

  Courier({this.code, this.name, this.costs});

  Courier.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    if (json['costs'] != null) {
      costs = <Costs>[];
      json['costs'].forEach((v) {
        costs!.add(new Costs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    if (this.costs != null) {
      data['costs'] = this.costs!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static List<Courier> fromJsonList(List list) {
    if (list.isEmpty) return List<Courier>.empty();
    return list.map((item) => Courier.fromJson(item)).toList();
  }
}

class Costs {
  String? service;
  String? description;
  List<Cost>? cost;

  Costs({this.service, this.description, this.cost});

  Costs.fromJson(Map<String, dynamic> json) {
    service = json['service'];
    description = json['description'];
    if (json['cost'] != null) {
      cost = <Cost>[];
      json['cost'].forEach((v) {
        cost!.add(new Cost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service'] = this.service;
    data['description'] = this.description;
    if (this.cost != null) {
      data['cost'] = this.cost!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cost {
  int? value;
  String? etd;
  String? note;

  Cost({this.value, this.etd, this.note});

  Cost.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    etd = json['etd'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['etd'] = this.etd;
    data['note'] = this.note;
    return data;
  }
}
