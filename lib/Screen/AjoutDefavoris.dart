import 'package:flutter/material.dart';

class Ajout_favoris extends StatelessWidget {
   static const routeName = 'Ajout_favoris';
  const Ajout_favoris({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text(
          'Favoris',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
    );
  }
}