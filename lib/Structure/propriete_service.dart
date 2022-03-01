import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thebled/Structure/Utilisateur_model.dart';

class ProprieteServices {

  // Afficher les proprieterUser

   static Future proprieterUser(
    int id,
    String superficie,
    String chambre,
    String douche,
    String cuisine,
    String garage,
    String prix,
    String loyer,
    String statu,
    String type,
    String description,
    String priorite,
    String logitude,
    String latitude,
    String quartierId,
    String userId,
    DateTime createdAt,
    DateTime updatedAt,
    ) async {
    String url = 'http://bled.ci/api/proprietes';

    try {
      
      final response = await http.get(Uri.parse(url));

      if(response.statusCode == 200) {
        var _json = response.body.toString();
         var _jsonDecode = json.decode(_json);
        return _jsonDecode;
      }

      print("============== Data fetched");

    } catch (error) {
      throw error;
    }
  }
}
