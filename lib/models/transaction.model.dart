class TransactionModel {
  int id;
  String name;
  String value;
  Category category;
  int parcels;
  String totalValue;
  String dataOperacao;

  TransactionModel(
      {this.id,
        this.name,
        this.value,
        this.category,
        this.parcels,
        this.totalValue,
        this.dataOperacao});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    parcels = json['parcels'];
    totalValue = json['totalValue'];
    dataOperacao = json['dataOperacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['value'] = this.value;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['parcels'] = this.parcels;
    data['totalValue'] = this.totalValue;
    data['dataOperacao'] = this.dataOperacao;
    return data;
  }
}

class Category {
  int id;
  String name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}