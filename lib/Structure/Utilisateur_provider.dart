import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'Utilisateur_model.dart';
import 'package:provider/provider.dart';

import 'Utilisateur_service.dart';

class UtilisateurProvider with ChangeNotifier {
  late Utilisateur _users;
  bool _isAth = true;
  Utilisateur get user => _users;
  bool get isAuth => _isAth;

  Future<void> resgisterUser(
      {
     
      required String name,
      required String email,
      required String password,
      required String numero,
      required String statu,
      required String matricule}) async {
    try {
      _users = await UserServices.register(
       name, email, password, numero, statu, matricule);
      notifyListeners();
    } catch (e) {
       
    }
  }

  Future<void> loginUser({email, password}) async {
    
      _users = await UserServices.login(email, password);

      notifyListeners();
  }

  // Future<void> saveLocal() async {
  //   await UserServices.saveLocalData(_user);
  // }

  // Future<void> loginUser({int id, String username, String password}) async {
  //   try {
  //     _user = await UserServices.login(id, username, password);

  //     notifyListeners();
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<void> logOut() async {
  //   await UserServices.clearUserinfo();
  //   _isAth = false;
  //   notifyListeners();
  // }

//mise a jour du username
  // Future<void> updateUser(String username) async {
  //   _user = await UserServices.updateInfoUser(username, _user.id);
  //   print("////////////papa $_user//////////////");
  //   notifyListeners();
  // }

  //mise a jour du password
  // Future<void> updatePassword(
  //     String username, String ancien_password, String nouveau_password) async {
  //   try {
  //     await UserServices.updatePassworduser(
  //       username,
  //       ancien_password,
  //       nouveau_password,
  //     );
  //   } catch (e) {
  //     throw (e);
  //   }
  // }

}
