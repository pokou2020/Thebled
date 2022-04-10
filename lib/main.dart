// ignore_for_file: equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thebled/Screen/profil.dart';
import 'package:thebled/Structure/propriete_service.dart';

import 'Screen/Acceuil.dart';
import 'Screen/AjoutDefavoris.dart';
import 'Screen/AjouteDeterrain.dart';
import 'Screen/Ajouter_Propriete.dart';
import 'Screen/Connexion.dart';
import 'Screen/First.dart';
import 'Screen/Inscription.dart';
import 'Screen/MesTerrain.dart';
import 'Screen/MotDepasse.dart';
import 'Screen/dashbord.dart';
import 'Screen/propriete.dart';
import 'Structure/Utilisateur_provider.dart';
import 'Structure/propriete_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UtilisateurProvider()),
        ChangeNotifierProvider.value(value: ProprieteServices()),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const First(),
        routes: {
          "Connexion": (context) => const Connexion(),
          "Inscription": (context) => const Inscription(),
          "accueil": (context) => Acceuil(),
           "propriete": (context) => Propriete(),
            "First": (context) => First(),
            Ajout_favoris.routeName: (ctx) => Ajout_favoris(),
            Mes_terrains.routeName: (ctx) => Mes_terrains(),
            AjouterTerrain.routeName: (ctx) => AjouterTerrain(),
             Profil.routeName: (ctx) => Profil(),
               AjouterProprieter.routeName: (ctx) => AjouterProprieter(),
             MakeDashboardItems.routeName: (ctx) => const MakeDashboardItems(),
                "dashbord": (context) => MakeDashboardItems(),
                Mot_de_passse.routeName:(ctx)=> Mot_de_passse(),

                

        },
      ),
    );
  }
}
