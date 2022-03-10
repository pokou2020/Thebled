// To parse this JSON data, do
//
//     final propriete = proprieteFromMap(jsonString);

import 'dart:convert';

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
  final String? superficie;
  final String? chambre;
  final String? douche;
  final String? cuisine;
  final String? garage;
  final String? prix;
  final String? loyer;
  final String? statu;
  final String? type;
  final String? description;
  final String? priorite;
  final String? logitude;
  final String? latitude;
  final String? quartierId;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Propriete.fromJson(String str) => Propriete.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Propriete.fromMap(Map<String, dynamic> json) => Propriete(
        id: json["id"],
        superficie: json["superficie"],
        chambre: json["chambre"],
        douche: json["douche"],
        cuisine: json["cuisine"],
        garage: json["garage"],
        prix: json["prix"],
        loyer: json["loyer"],
        statu: json["statu"],
        type: json["type"],
        description: json["description"],
        priorite: json["priorite"],
        logitude: json["logitude"],
        latitude: json["latitude"],
        quartierId: json["quartier_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "superficie": superficie,
        "chambre": chambre,
        "douche": douche,
        "cuisine": cuisine,
        "garage": garage,
        "prix": prix,
        "loyer": loyer,
        "statu": statu,
        "type": type,
        "description": description,
        "priorite": priorite,
        "logitude": logitude,
        "latitude": latitude,
        "quartier_id": quartierId,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
