// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

class RegisterModal {
  RegisterModal({
    this.name,
    this.email,
    this.password,
  });

  String? name;
  String? email;
  String? password;

  factory RegisterModal.fromJson(Map<String, dynamic> json) => RegisterModal(
        name: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,  
      };
}

class LoginModal {
  LoginModal({
    this.email,
    this.password,
  });

  String? email;
  String? password;
  // Null email;
  // Null password;

  factory LoginModal.fromJson(Map<String, dynamic> json) => LoginModal(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,  
      };
}
