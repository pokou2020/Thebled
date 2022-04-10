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

  UtilisateurProvider? utilisateurProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    utilisateurProvider = context.read<UtilisateurProvider>();
    print(utilisateurProvider);
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
                        itemBuilder: (ctx, index) => Container(
                          child: Column(
                            children: [
                                    Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                   color: Colors.red,
                   height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 1,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.pink,
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 1,
                          child:Center(child: Text("${index + 1}")),
                          ),

                          Row(
                            children: [
                                Container(
                                child: Text("Superficie",
                                style:TextStyle(
                                  fontSize:16,
                                  fontWeight: FontWeight.bold
                                )
                                ),
                              ),
                              SizedBox(width:10),
                              Container(
                                child: Text("${proprietedata.proprieteList["proprietes"][index]["superficie"]}",
                                   style:TextStyle(
                                  fontSize:16,
                                  fontWeight: FontWeight.bold
                                )
                                ),
                              ),
                            ],
                          )
                    ],
                  ),
                ),
              ),
                              // ListTile(
                              //   leading: CircleAvatar(
                              //     child: Text("${i + 1}"),
                              //   ),
                              //   title: Text("chambre"),
                              //   subtitle: Text("superficie"),
                              // ),
                            ],
                          ),
                        ),
             ));
            }
          }
        },
      ),
    );
  }
}
