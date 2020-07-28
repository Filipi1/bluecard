class UserModel {
  int id;
  String username;
  String name;
  String email;
  String password;
  String cpf;
  dynamic balance;
  dynamic invoice;
  bool openInvoice;
  dynamic creditLimit;
  int maxCreditLimit;
  String role;
  String imageProfile;

  UserModel(
      {this.id,
        this.username,
        this.name,
        this.email,
        this.password,
        this.cpf,
        this.balance,
        this.invoice,
        this.openInvoice,
        this.creditLimit,
        this.maxCreditLimit,
        this.role,
        this.imageProfile});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    cpf = json['cpf'];
    balance = json['balance'];
    invoice = json['invoice'];
    openInvoice = json['openInvoice'];
    creditLimit = json['creditLimit'];
    maxCreditLimit = json['maxCreditLimit'];
    role = json['role'];
    imageProfile = json['imageProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['cpf'] = this.cpf;
    data['balance'] = this.balance;
    data['invoice'] = this.invoice;
    data['openInvoice'] = this.openInvoice;
    data['creditLimit'] = this.creditLimit;
    data['maxCreditLimit'] = this.maxCreditLimit;
    data['role'] = this.role;
    data['imageProfile'] = this.imageProfile;
    return data;
  }
}
