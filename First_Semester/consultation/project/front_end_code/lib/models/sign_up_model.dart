class SignUpModel {
  String? username;
  String? password;
  String? firstName;
  String? lastName;
  String? role;

  SignUpModel(
      {this.username, this.password, this.firstName, this.lastName, this.role});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'username': username,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
    };
    return data;
  }
}
