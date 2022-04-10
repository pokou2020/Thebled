import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thebled/Structure/Utilisateur_model.dart';
import 'package:thebled/Structure/proprieteModel.dart';

class ProprieteServices with ChangeNotifier {
  // Ajouter une proprieter
List<ProprieteModel> _items = [];
  List<ProprieteModel> get items {
   
    return [..._items];
  }
  Future<void> createPropriete(ProprieteModel proprieteModel) async {
    const url = "http://bled.ci/api/proprietes";
    try{
    final response = await http.post((Uri.parse(url)),
        body: json.encode(
          {
            "status": proprieteModel.status,
            "loyer": proprieteModel.loyer,
            "superficie": proprieteModel.superficie,
            "cuisine": proprieteModel.cuisine,
            "chambre": proprieteModel.chambre,
            "douche": proprieteModel.douche,
            "ville": proprieteModel.ville,
            "commune": proprieteModel.commune,
            "quartier": proprieteModel.quartier,
            "images": proprieteModel.images,
            "lon": proprieteModel.lon,
            "lat": proprieteModel.lat,
            "description": proprieteModel.description,
          },
        ));
    final newPropriete = ProprieteModel(
      status: proprieteModel.status,
      loyer: proprieteModel.loyer,
      superficie: proprieteModel.superficie,
      cuisine: proprieteModel.cuisine,
      chambre: proprieteModel.chambre,
      douche: proprieteModel.douche,
      garage: proprieteModel.garage,
      ville: proprieteModel.ville,
      commune: proprieteModel.commune,
      quartier: proprieteModel.quartier,
      images: proprieteModel.images,
      lon: proprieteModel.lon,
      lat: proprieteModel.lat,
      description: proprieteModel.description,
      id: json.decode(response.body)['name'],
    );
      _items.add(newPropriete);
         notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
}
}