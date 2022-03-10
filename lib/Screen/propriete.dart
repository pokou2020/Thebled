import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thebled/Structure/Utilisateur_provider.dart';
import 'package:thebled/Structure/propriete_provider.dart';

class Propriete extends StatefulWidget {
  const Propriete({Key? key}) : super(key: key);

  @override
  State<Propriete> createState() => _ProprieteState();

  static fromJson(extractedProprete) {}
}

class _ProprieteState extends State<Propriete> {
  var _isInit = true;
  var _isLoading = false;

  UtilisateurProvider? utilisateurProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    utilisateurProvider = context.read<UtilisateurProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text(
          'Mes Proprietes',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: utilisateurProvider!.getPropriete(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              //...
              //do error handling stuff
              return Center(
                child: Text('An error occurred'),
              );
            } else {
              return Consumer<UtilisateurProvider>(
                  builder: (ctx, proprietedata, child) => ListView.builder(
                        itemCount: proprietedata.proprietes.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            child: Text("${i + 1}"),
                          ),
                          title: Text("chambre"),
                          subtitle: Text("superficie"),
                        ),
                      ));
            }
          }
        },
      ),
    );
  }
}
