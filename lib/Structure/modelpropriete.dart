// To parse this JSON data, do
//
//     final proprietes = proprietesFromJson(jsonString);

import 'dart:convert';

Proprietes proprietesFromJson(String str) =>
    Proprietes.fromJson(json.decode(str));

String proprietesToJson(Proprietes data) => json.encode(data.toJson());

class Proprietes {
  Proprietes({
    this.proprietes,
  });

  final List<Propriete>? proprietes;

  factory Proprietes.fromJson(Map<String, dynamic> json) => Proprietes(
        proprietes: json["proprietes"] == null
            ? null
            : List<Propriete>.from(
                json["proprietes"].map((x) => Propriete.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "proprietes": proprietes == null
            ? null
            : List<dynamic>.from(proprietes!.map((x) => x.toJson())),
      };
}

class Propriete {
  Propriete({
    this.id,
    this.superficie,
    this.chambre,
    this.douche,
    this.cuisine,
    this.garage,
    this.prix,
    this.loyer,
    this.statu,
    this.type,
    this.description,
    this.priorite,
    this.logitude,
    this.latitude,
    this.quartierId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? superficie;
  final int? chambre;
  final int? douche;
  final int? cuisine;
  final int? garage;
  final int? prix;
  final int? loyer;
  final String? statu;
  final String? type;
  final String? description;
  final int? priorite;
  final double? logitude;
  final double? latitude;
  final int? quartierId;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Propriete.fromJson(Map<String, dynamic> json) => Propriete(
        id: json["id"] == null ? null : json["id"],
        superficie: json["superficie"] == null ? null : json["superficie"],
        chambre: json["chambre"] == null ? null : json["chambre"],
        douche: json["douche"] == null ? null : json["douche"],
        cuisine: json["cuisine"] == null ? null : json["cuisine"],
        garage: json["garage"] == null ? null : json["garage"],
        prix: json["prix"] == null ? null : json["prix"],
        loyer: json["loyer"] == null ? null : json["loyer"],
        statu: json["statu"] == null ? null : json["statu"],
        type: json["type"] == null ? null : json["type"],
        description: json["description"] == null ? null : json["description"],
        priorite: json["priorite"] == null ? null : json["priorite"],
        logitude: json["logitude"] == null ? null : json["logitude"].toDouble(),
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        quartierId: json["quartier_id"] == null ? null : json["quartier_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "superficie": superficie == null ? null : superficie,
        "chambre": chambre == null ? null : chambre,
        "douche": douche == null ? null : douche,
        "cuisine": cuisine == null ? null : cuisine,
        "garage": garage == null ? null : garage,
        "prix": prix == null ? null : prix,
        "loyer": loyer == null ? null : loyer,
        "statu": statu == null ? null : statu,
        "type": type == null ? null : type,
        "description": description == null ? null : description,
        "priorite": priorite == null ? null : priorite,
        "logitude": logitude == null ? null : logitude,
        "latitude": latitude == null ? null : latitude,
        "quartier_id": quartierId == null ? null : quartierId,
        "user_id": userId == null ? null : userId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
