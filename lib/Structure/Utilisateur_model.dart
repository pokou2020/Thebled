// To parse this JSON data, do
//
//     final utilisateur = utilisateurFromMap(jsonString);

import 'dart:convert';

class Utilisateur {
    Utilisateur({
        required this.name,
        required this.email,
        required this.password,
        required this.numero,
        required this.statu,
        required this.matricule,
    });

    List<String> name;
    List<String> email;
    List<String> password;
    List<String> numero;
    List<String> statu;
    List<String> matricule;

    factory Utilisateur.fromJson(String str) => Utilisateur.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Utilisateur.fromMap(Map<String, dynamic> json) => Utilisateur(
        name: List<String>.from(json["name"].map((x) => x)),
        email: List<String>.from(json["email"].map((x) => x)),
        password: List<String>.from(json["password"].map((x) => x)),
        numero: List<String>.from(json["numero"].map((x) => x)),
        statu: List<String>.from(json["statu"].map((x) => x)),
        matricule: List<String>.from(json["matricule"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "name": List<dynamic>.from(name.map((x) => x)),
        "email": List<dynamic>.from(email.map((x) => x)),
        "password": List<dynamic>.from(password.map((x) => x)),
        "numero": List<dynamic>.from(numero.map((x) => x)),
        "statu": List<dynamic>.from(statu.map((x) => x)),
        "matricule": List<dynamic>.from(matricule.map((x) => x)),
    };
}
