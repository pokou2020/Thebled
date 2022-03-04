// ignore_for_file: empty_catches
import 'package:flutter/material.dart';
import 'package:thebled/Structure/Utilisateur_model.dart';
import 'Utilisateur_service.dart';

class UtilisateurProvider with ChangeNotifier {
  late RegisterResponse _user;
  bool _isAth = true;
  RegisterResponse get user => _user;
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

  Future<void> getProfil({
    name,
    email,
  }) async {
    try {
      if (user != null) {
        // print(user["token"].toString());
        _userProfile = await UserServices.profilUser(
          name: name,
          email: email,
          userToken: user.token,
        );
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
