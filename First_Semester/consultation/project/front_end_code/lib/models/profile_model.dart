class ProfileModel {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? city;
  String? birthDate;
  String? role;
  String? address;

  ProfileModel(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.city,
      this.birthDate,
      this.role,
      this.address});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    city = json['city'];
    birthDate = json['birthDate'];
    role = json['role'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'city': city,
      'birthDate': birthDate,
      'role': role,
      'Address': address,
    };
    return data;
  }
}
