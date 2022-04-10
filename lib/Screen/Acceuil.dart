import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thebled/Screen/Ajouter_Propriete.dart';
import 'package:thebled/Screen/profil.dart';
import 'package:thebled/Structure/Utilisateur_model.dart';
import 'package:thebled/Structure/Utilisateur_provider.dart';
import 'AjouteDeterrain.dart';
import 'MesTerrain.dart';
import 'MotDepasse.dart';
import 'dashbord.dart';
class Acceuil extends StatefulWidget {
  Acceuil({Key? key}) : super(key: key);

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  UtilisateurProvider? utilisateurProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    utilisateurProvider = context.read<UtilisateurProvider>();
    utilisateurProvider!.getProfil(
        email: utilisateurProvider!.user.user!.email,
        name: utilisateurProvider!.user.user!.name);
  }
   Future<void> _refresPropriete(BuildContext context)async{
    await Provider.of<UtilisateurProvider>(context).logOut();
   }
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UtilisateurProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[200],
          title: Text(
            "Acceuil",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
            backgroundColor: Colors.green[200],
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(                  
                            children: [
                        CircleAvatar(maxRadius: 50,),
                         SizedBox(
                    width: 40,
                  ),
                              // Container(
                              //   child: Text(prov.user.user!.name!,
                              //       style: TextStyle(
                              //           fontSize: 15,
                              //           fontWeight: FontWeight.bold,
                              //           color: Colors.white)),
                              // ),
                            ],
                          ),
                                 SizedBox(
                    height: 20,
                  ),
                          Container(
                            child: Text(prov.user.user!.email!,
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.people, color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                         Navigator.of(context).pushNamed(
                                            Profil.routeName);
                          },
                          child: Container(
                            child: Text(
                              "Profils",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.people, color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                         Navigator.of(context).pushNamed(
                                             Mes_terrains.routeName);
                          },
                          child: Container(
                            child: Text(
                              "Mes favoris",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.crop_landscape, color: Colors.white),
                        SizedBox(
                          width: 25,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("propriete");
                          },
                          child: Container(
                            child: Text(
                              "Mes propriété",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: Colors.white),
                        SizedBox(
                          width: 25,
                        ),
                        InkWell(
                               onTap: () {
                         Navigator.of(context).pushNamed(
                                            AjouterProprieter.routeName);
                          },
                          child: Container(
                            child: Text(
                              "Nouvelle propriétés",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                      SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.crop_landscape, color: Colors.white),
                            SizedBox(
                              width: 25,
                            ),
                            InkWell(
                                   onTap: () {
                             Navigator.of(context).pushNamed(
                                                Mes_terrains.routeName);
                              },
                              child: Container(
                                child: Text(
                                  "Mes terrains",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                      SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: Colors.white),
                        SizedBox(
                          width: 25,
                        ),
                        InkWell(
                               onTap: () {
                         Navigator.of(context).pushNamed(
                                            AjouterTerrain.routeName);
                          },
                          child: Container(
                            child: Text(
                              "Nouveau terrain",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                           SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: Colors.white),
                        SizedBox(
                          width: 25,
                        ),
                        InkWell(
                               onTap: () {
                         Navigator.of(context).pushNamed(
                                            Mot_de_passse.routeName);
                          },
                          child: Container(
                            child: Text(
                              "Mot de passe",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.home,
                            color: Colors.white),
                        const SizedBox(
                          width: 25,
                        ),
                        InkWell(
                           onTap: () {
                        Navigator.of(context)
                                .pushReplacementNamed("dashbord");
                          },
                          child: Container(
                            child: Text(
                              "Dashboard",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        body: 
          //onRefresh:()=> _refresPropriete(),RefreshIndicator(
           Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height / 3.7,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                          image:const DecorationImage(
                              image: AssetImage(
                                "images/0b9.jpg",
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red[200]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text('Maison en location',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text('30',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red)),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height / 3.7,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "images/1f0.jpg",
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[200]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text('Maison en location',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text('30',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red)),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height / 3.7,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage(
                                "images/de5jpg.jpg",
                              ),
                              fit: BoxFit.cover),
                          color: Colors.green[200]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text('Maison à louer',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text('15',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red)
                                          ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        
        );
  }
}
