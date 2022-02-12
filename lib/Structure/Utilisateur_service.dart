// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'Utilisateur_model.dart';

// class UserServices {

//   static Future<Utilisateur> register(
//       String name, email, password, numero, statu, matricule,  ) async {
//     Dio dio = Dio();
//     try {
//       Utilisateur users;
//       FormData formData = FormData.fromMap({
//         "name": name,
//         "email": email,
//         "password": password,
//         "repassword": password,
//         "numero": numero,
//         "statu": statu,
//         "matricule": matricule
//       });
//       Response response = await dio.post(
//         "http://bled.ci/api/register",
//         data: formData,
//       );
//       if (response.statusCode == 200) {
//         Map<String, dynamic> bodyResponce = response.data;
//         if (bodyResponce["success"]) {
//           users = Utilisateur.fromMap(bodyResponce["users"]);

//           print("news user save ${users.toMap()}");
//           return users;
//         } else {
//           throw (bodyResponce["message"]);
//         }
//       }
//     } catch (e) {
//       rethrow;
//     }
//  }
//   }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'Utilisateur_model.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<Utilisateur> register(
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
    if (response.statusCode == 200) {
      
      var _json = response.body.toString();
      debugPrint(_json);

      var _jsonDecode = json.decode(_json);
      var user = Utilisateur.fromMap(_jsonDecode);
      return user;
     
    } else {
      throw Exception('Failed to load post ');
    }
  }

    static Future<Utilisateur> login(
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
      print(response.statusCode);
      var _json = response.body.toString();
      debugPrint(_json);

      var _jsonDecode = json.decode(_json);
      var user = Utilisateur.fromMap(_jsonDecode);
      return user;
     
    } else {
      throw Exception('Failed to load post ');
    }
  }


}
