class LogInModel {
  String? email;
  String? password;
  String? role;

  LogInModel({this.email, this.password, this.role});

  LogInModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
      'role': role,
    };
    return data;
  }
}
