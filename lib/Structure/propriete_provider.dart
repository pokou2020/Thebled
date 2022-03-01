// // ignore_for_file: empty_catches
// import 'package:flutter/material.dart';
// import 'package:thebled/Structure/propriete_service.dart';
// import 'Utilisateur_service.dart';

// class ProprieteProvider with ChangeNotifier {
//   dynamic _propriete;
//   dynamic get proprietes => _propriete;

//   Future<void> getproprieterUser(
//       {
//         id,
//         superficie,
//         chambre,
//         douche,
//         cuisine,
//         garage,
//         prix,
//         loyer,
//         statu,
//         type,
//         description,
//         priorite,
//         logitude,
//         latitude,
//         quartierId,
//         userId,
//         createdAt,
//         updatedAt,
//       }) async {
//     try {
      
//       _propriete = await ProprieteServices.proprieterUser(
//             id,
//             superficie, 
//             chambre, 
//             douche,
//             cuisine, 
//             garage,
//              prix,
//              loyer,
//              statu,
//              type,
//              description,
//              priorite,
//              logitude,
//              latitude,
//              quartierId,
//              userId,
//              createdAt,
//              updatedAt,
//             );

//       notifyListeners();
//     } catch (e) {
//       print(e);
//     }
//   }

  

// }

import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:thebled/Screen/propriete.dart';

class ProprieteProvider with ChangeNotifier{

  List<Propriete> _propriete = [];
  List<Propriete> get propriete {
    return [..._propriete];
  }


  Future<void> fetchAndSetPosts() async {
    final url = 'http://bled.ci/api/proprietes';

    try {
      
      final response = await http.get(Uri.parse(url));
      print('get:' + '${response.statusCode}');
      final extractedProprete = json.decode(response.body);

      if(extractedProprete == null) {
        return;
      }

      print("============== Data fetched");

      final List<Propriete> loadedPropriete = [];
      for (var i = 0; i < extractedProprete.length; i++) {
        var postItem = Propriete.fromJson(extractedProprete[i]); 
        loadedPropriete.add(postItem);
      }

     _propriete = loadedPropriete;
      notifyListeners();


    } catch (error) {
      throw error;
    }
  }
}