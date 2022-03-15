import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thebled/Screen/dashbord.dart';
import 'package:thebled/Structure/Utilisateur_provider.dart';

class Profil extends StatefulWidget {
   static const routeName = 'profil';
  Profil({Key? key}) : super(key: key);
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
     Future<void> _logOut() async {
    await Provider.of<UtilisateurProvider>(context, listen: false).logOut();
    Navigator.popAndPushNamed(context, '/');
  }
    UtilisateurProvider? utilisateurProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    utilisateurProvider = context.read<UtilisateurProvider>();
    utilisateurProvider!.getProfil(
        email: utilisateurProvider!.user.user!.email,
        name: utilisateurProvider!.user.user!.name,
         numero: utilisateurProvider!.user.user!.numero
        );
  }
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UtilisateurProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green,
          width: MediaQuery.of(context).size.width,
          height: 850,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Mon Profil",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(),
                  ],
                ),
                CircleAvatar(
                    radius: 50,
                    ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Information generale',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ),
               // MakeDashboardItems(),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 400,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff191919),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(8, 6),
                        blurRadius: 8,
                        color: Color(0xff191919).withOpacity(0.8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.person,
                              color: Color.fromRGBO(230, 30, 36, 1),
                            ),
                            onPressed: () {},
                          ),
                            Text(
                                'Dashbord',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nom & Prénom',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                prov.user.user!.name!,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.location_on,
                              color: Color.fromRGBO(230, 30, 36, 1),
                            ),
                            onPressed: () {},
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pays',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Côte d'ivoire",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          )        
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.phone,
                              color: Color.fromRGBO(230, 30, 36, 1),
                            ),
                            onPressed: () {},
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                prov.user.user!.numero!,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                      
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.email,
                              color: Color.fromRGBO(230, 30, 36, 1),
                            ),
                            onPressed: () {},
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                prov.user.user!.email!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Cocody,Abidjan,Cote d'ivoire",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),                    
                        ],
                      ),
                      Row(
                        children: [
                       
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            
                              Center(
                                  child: InkWell(
                                      onTap: _logOut,
                                      child: Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.red),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Se deconnecter",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

