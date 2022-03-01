// ignore_for_file: empty_catches
import 'package:flutter/material.dart';
import 'Utilisateur_service.dart';

class UtilisateurProvider with ChangeNotifier {
  dynamic _user;
  bool _isAth = true;
  dynamic get user => _user;
  bool get isAuth => _isAth;
  dynamic _userProfile;
  dynamic get userProfile => _userProfile;

  Future<void> resgisterUser(
      {required String name,
      required String email,
      required String password,
      required String numero,
      required String statu,
      required String matricule}) async {
    try {
      _user = await UserServices.register(
          name, email, password, numero, statu, matricule);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginUser({email, password}) async {
    try {
      _user = await UserServices.login(email, password);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProfil({name, email,}) async {
    try {
      _userProfile = await UserServices.profilUser(name, email, );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
