import 'package:flutter/foundation.dart';

class ProprieteModel with ChangeNotifier {
  final String? id;
  final String? status;
  final String? loyer;
  final String? superficie;
  final String? cuisine;
  final String? chambre;
  final String? douche;
  final String? garage;
  final String? ville;
  final String? commune;
  final String? quartier;
  final String? images;
  final String? lon;
  final String? lat;
  final String? description;
  bool isFavorite;

  ProprieteModel({
    required this.id,
    required this.status,
    required this.loyer,
    required this.superficie,
    required this.cuisine,
    required this.chambre,
    required this.douche,
    required this.garage,
    required this.ville,
    required this.commune,
    required this.quartier,
    required this.images,
     required this.lon,
      required this.lat,
    required this.description, 
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
