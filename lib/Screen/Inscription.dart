import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:thebled/Screen/errordialog_widget.dart';
import 'package:thebled/Structure/Utilisateur_provider.dart';

import 'Acceuil.dart';

const spinkit = SpinKitThreeBounce(
  color: Colors.green,
  size: 20.0,
);

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String password = "";
  String passwordConf = "";
  String numero = "";
  String statu = "En tant que...";
  String matricule = "";
  bool _loader = false;
  bool _checkValue = false;

  Future<void> _submitForm() async {
    bool vld = _formKey.currentState!.validate();
    var prov = Provider.of<UtilisateurProvider>(context, listen: false);
    if (vld) {
      setState(() {
        _loader = true;
      });
      await prov.resgisterUser(
        name: name,
        email: email,
        password: password,
        numero: numero,
        statu: statu,
        matricule: matricule,
      );
      if (prov.user.message != null) {
        showErrorDialog(context,
            label: "ERREUR",
            msg: "Un utilisateur possede deja le mail ou le numero");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              //height: 720,
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
                    child: Text("Inscription",
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
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.people,
                            color: Colors.black87,
                          ),
                          hintText: 'Nom et Prenom',
                        ),
                        validator: (val) =>
                            val!.isEmpty ? "Entrez un nom" : null,
                        onChanged: (val) => name = val),
                  ),
                  const SizedBox(
                    height: 20,
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
                        obscureText: true,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock_clock_sharp,
                              color: Colors.black87,
                            ),
                            hintText: 'Password')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: TextFormField(
                        validator: (val) => passwordConf != password
                            ? "Mot de pass different"
                            : null,
                        onChanged: (val) => passwordConf = val,
                        obscureText: true,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock_clock_sharp,
                              color: Colors.black87,
                            ),
                            hintText: 'Confirmation')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? "Champ Numero vide" : null,
                        onChanged: (val) => numero = val,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.contact_page,
                              color: Colors.black,
                            ),
                            hintText: 'Numero')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    // height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.all(3),
                            prefixIcon:
                                Icon(Icons.people, color: Colors.black87)),
                        hint: Text("En tant que..."),
                        isDense: true,
                        isExpanded: true,
                        iconSize: 40,
                        value: statu,
                        onChanged: (String? newvalue) {
                          setState(() {
                            statu = newvalue!;
                          });
                        },
                        items: <String>[
                          'En tant que...',
                          'Utilisateur',
                          'Agent',
                          'Agence'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? "Champ Agent vide" : null,
                        onChanged: (val) => matricule = val,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person_pin,
                              color: Colors.black87,
                            ),
                            hintText: "Matricul de l'agent")),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 250,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed("accueil");
                            },
                            child: Text("J' ai deja un compte",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ))),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: !_loader ? _submitForm : () {},
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// DropdownButtonHideUnderline(
//                       child: DropdownButton<String>(
//                     hint: Text("Utilisateur"),
//                     elevation: 4,
//                     isDense: true,
//                     isExpanded: true,
//                     iconSize: 60,
//                     value: droval,
//                     items: <String>['Utilisateur, Agent'].map((e) => null),
//                   ))
