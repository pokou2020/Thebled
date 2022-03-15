// ignore_for_file: equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thebled/Screen/profil.dart';

import 'Screen/Acceuil.dart';
import 'Screen/Connexion.dart';
import 'Screen/First.dart';
import 'Screen/Inscription.dart';
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
        ChangeNotifierProvider.value(value: ProprieteProvider()),
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
             Profil.routeName: (ctx) => Profil(),
             MakeDashboardItems.routeName: (ctx) => const MakeDashboardItems(),
                "dashbord": (context) => MakeDashboardItems(),
        },
      ),
    );
  }
}
