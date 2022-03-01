import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thebled/Structure/Utilisateur_model.dart';

class UserServices {

  // S'inscrire
  static Future register(
    String name,
    String email,
    String password,
    String numero,
    String statu,
    String matricule,
  ) async {
    String url = "http://bled.ci/api/register";

    final response = await http.post(
      (Uri.parse(url)),
      body: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password,
        "numero": numero,
        "statu": statu,
        "matricule": matricule
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var _json = response.body.toString();
      var _jsonDecode = json.decode(_json);
      // debugPrint(_json);
      return _jsonDecode;
    } else {
      throw Exception('Failed to load post ');
    }
  }
//Se connecter
  static Future login(
    String email,
    String password,
  ) async {
    String url = "http://bled.ci/api/login";

    final response = await http.post(
      (Uri.parse(url)),
      body: {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      var _json = response.body.toString();
      var _jsonDecode = json.decode(_json);
      debugPrint(_json);
      return _jsonDecode;
    } else {
      throw Exception('Failed to load post ');
    }
  }

  //Afficher le profile de la personne conneter

  
  static Future profilUser(
    String name,
    String email,
    ) async {
    String url = 'http://bled.ci/api/profil';

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
