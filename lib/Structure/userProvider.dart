// import 'dart:convert';
// import "package:http/http.dart" as http;
// import 'package:flutter/material.dart';

// class UserProvider extends ChangeNotifier {
//   late Map _user;
//   Map get user => _user;
//   Future signIn({String username, String password}) async {
//     const url = 'Mets ton url ici';

//     try {
//       final response = await http.get(Uri.parse(url));
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         _reponse = jsonDecode(response.body);
//       } else {}
//       notifyListeners();
//     } catch (error) {
//       print(error);
//     }
//   }
// }
