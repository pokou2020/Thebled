// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    this.user,
    this.token,
    this.tokenType,
  });

  final User? user;
  final String? token;
  final String? tokenType;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        user: User.fromJson(json["user"]),
        token: json["token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "token": token,
        "token_type": tokenType,
      };
}

class User {
  User({
    this.name,
    this.email,
    this.numero,
    this.idmclu,
    this.statu,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  final String? name;
  final String? email;
  final String? numero;
  final String? idmclu;
  final String? statu;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        numero: json["numero"],
        idmclu: json["idmclu"],
        statu: json["statu"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "numero": numero,
        "idmclu": idmclu,
        "statu": statu,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
      };
}
