


// import 'dart:convert';
// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
// import 'package:thebled/Screen/propriete.dart';
// import 'package:thebled/Structure/propriete_service.dart';

// class ProprieteProvider with ChangeNotifier{

//   //Ajouter les propriertes
//   Future<void> addProprietr(
//       {required String status,
//       required String loyer,
//       required String superficie,
//       required String cuisine,
//       required String chambre,
//       required String douche,
//       required String garage,
//       required String ville, 
//       required String commune,
//       required String quartier,
//       required String images,
//       required String lon,
//       required String lat,
//       required String description,


//       }) async {
//     try {
//       _user = await ProprieteServices.createPropriete(
//           status, loyer, superficie, cuisine, chambre, douche,garage,ville,commune,quartier,images,lon,lat,description);

//       notifyListeners();
//     } catch (e) {
//       print(e);
//     }
//   }
  
// }