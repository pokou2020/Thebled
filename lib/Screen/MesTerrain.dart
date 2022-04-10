import 'package:flutter/material.dart';

class Mes_terrains extends StatelessWidget {
  static const routeName = 'Mes_terrains';
  const Mes_terrains({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text(
          'Mes terrain',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
    );
  }
}