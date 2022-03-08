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
    this.message,
    this.email,
    this.numero,
  });

  final User? user;
  final String? token;
  final String? tokenType;
  final String? message;
  final List<dynamic>? email;
  final List<dynamic>? numero;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"] == null ? null : json["token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        message: json["message"] == null ? null : json["message"],
        email: json["email"] == null
            ? null
            : List<dynamic>.from(json["email"].map((x) => x)),
        numero: json["numero"] == null
            ? null
            : List<dynamic>.from(json["numero"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user!.toJson(),
        "token": token == null ? null : token,
        "token_type": tokenType == null ? null : tokenType,
        "message": message == null ? null : message,
        "email":
            email == null ? null : List<dynamic>.from(email!.map((x) => x)),
        "numero":
            numero == null ? null : List<dynamic>.from(numero!.map((x) => x)),
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
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        numero: json["numero"] == null ? null : json["numero"],
        idmclu: json["idmclu"] == null ? null : json["idmclu"],
        statu: json["statu"] == null ? null : json["statu"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "numero": numero == null ? null : numero,
        "idmclu": idmclu == null ? null : idmclu,
        "statu": statu == null ? null : statu,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "id": id == null ? null : id,
      };
}
