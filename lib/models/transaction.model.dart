class TransactionModel {
  String name;
  String value;
  String category;
  int parcels;
  String totalValue;
  String dataOperacao;

  TransactionModel(
      {this.name,
        this.value,
        this.category,
        this.parcels,
        this.totalValue,
        this.dataOperacao});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    category = json['category'];
    parcels = json['parcels'];
    totalValue = json['totalValue'];
    dataOperacao = json['dataOperacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['category'] = this.category;
    data['parcels'] = this.parcels;
    data['totalValue'] = this.totalValue;
    data['dataOperacao'] = this.dataOperacao;
    return data;
  }
}