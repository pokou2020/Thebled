import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:thebled/Screen/errordialog_widget.dart';
import 'package:thebled/Structure/Utilisateur_provider.dart';

import 'Acceuil.dart';

const spinkit = SpinKitThreeBounce(
  color: Colors.green,
  size: 20.0,
);

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String email = "";
  String password = "";
  bool _loader = false;
  bool _checkValue = false;

  Future<void> _saveLogin() async {
    bool vld = _formKey.currentState!.validate();
    var prov = Provider.of<UtilisateurProvider>(context, listen: false);
    if (vld) {
      setState(() {
        _loader = true;
      });
      await prov.loginUser(
        email: email,
        password: password,
      );
      if (prov.user["message"] != null) {
        showErrorDialog(context,
            label: "ERREUR", msg: "Adresse Email ou mot de passe incorrect");
        setState(() {
          _loader = false;
        });
      } else {
        Navigator.of(context).pushReplacementNamed("accueil");
        setState(() {
          _loader = false;
        });
      }
    } else {
      _loader = false;
    }
  }

  //   void showToast(String msg, {int duration, int gravity}) {
  //   Toast.show(msg, context,
  //       duration: duration, gravity: gravity, backgroundColor: Colors.red);
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = EdgeInsets.symmetric(
      vertical: size.longestSide * 0.02,
      horizontal: 16.0,
    );
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.green[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/Bled_Logo.png"))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text("Bled",
                          style: TextStyle(
                            fontSize: 30,
                          )),
                      const Text("L'Appcation qui vous libere",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          )),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                child: Text("Connexion",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) =>
                        val!.isEmpty ? "Champ Email vide" : null,
                    onChanged: (val) => email = val,
                    onFieldSubmitted: (val) => _saveLogin(),
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black87,
                        ),
                        hintText: 'Email')),
              ),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 5,
              ),

              Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: TextFormField(
                    validator: (val) =>
                        val!.length < 8 ? "Mot de pass trop court" : null,
                    onChanged: (val) => password = val,
                    obscureText: !_showPassword,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                            icon: _showPassword
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            }),
                        hintText: 'Password')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 250,
                    child: FlatButton(
                        onPressed: () => print('Mot de passe oublier'),
                        child: Text('Mot de passe oublier',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ))),
                  )
                ],
              ),
              InkWell(
                onTap: !_loader ? _saveLogin : () {},
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Center(
                    child: !_loader
                        ? Text(
                            "Se Connecter",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        : spinkit,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 250,
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('Inscription');
                        },
                        child: Text("S' inscrire",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ))),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
