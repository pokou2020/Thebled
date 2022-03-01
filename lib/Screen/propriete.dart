import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

 

  @override
  void didChangeDependencies() {
    if(_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<ProprieteProvider>(context).fetchAndSetPosts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });

      
    }

    _isInit = false;
    super.didChangeDependencies();
  }
  // Future<void> _pro() async {
  //   bool init = true;
  //   var prov = Provider.of<ProprieteProvider>(context, listen: false);
  //   if (init) {
  //     await prov.getproprieterUser();
  //     setState(() {
  //       init = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final propriete = Provider.of<ProprieteProvider>(context).propriete;
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: 400,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: propriete.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 450,
                          width: 400,
                          color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                color: Colors.green,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text('Superficie:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                    Container(
                                      child: Text(
                                          'propriete.proprietes[index].id',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text('Chambre:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                    Container(
                                      child: Text('4',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      ),
            )
          ],
        ),
      ),
    );
  }
}

class String {}
