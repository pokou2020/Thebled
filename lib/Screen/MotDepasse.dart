import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const spinkit = SpinKitThreeBounce(
  color: Colors.green,
  size: 20.0,
);

class Mot_de_passse extends StatefulWidget {
  static const routeName = 'Mot_de_passse';


  @override
  State<Mot_de_passse> createState() => _Mot_de_passseState();
}

class _Mot_de_passseState extends State<Mot_de_passse> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String email = "";
  String password = "";
  String passwordConf = "";
  String numero = "";
  String statu = "A louer";
  String proprietes = "Type de..";
  String proprietesville = "..";
  String notreComm = "Le";
  String montiek = "tier";
  String matricule = "";
  bool _loader = false;
  bool _checkValue = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text(
          'Mot de passe',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
         height: MediaQuery.of(context).size.height,
        child: ListView(
          
          children: [
            
            Form(
              
              key: _formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                //height: 720,
                width: double.infinity,
                color: Colors.green[200],
                child: Column(
              
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     SizedBox(height:100),
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
                             const SizedBox(
                      height: 20,
                    ),
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
                    const SizedBox(
                      height: 5,
                    ),
                      
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Changer mot de passe',
                          style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                        ],
                      ),
                    ),

                     SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                         width: MediaQuery.of(context).size.width/1.1,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) =>
                                    val!.isEmpty ? "Champ Email vide" : null,
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.food_bank,
                                      color: Colors.black87,
                                    ),
                                    hintText: 'Mot de passe actuel')),
                          ), 
                        ],
                      ),
                    ),
                       Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Nouveau mot de passe',
                          style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                             // borderRadius: BorderRadius.circular(30),
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Nouveau mot de passe',
                              ),
                              validator: (val) =>
                                  val!.isEmpty ? "Entrez un nom" : null,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                             // borderRadius: BorderRadius.circular(30),
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirmation mot de passe',
                              ),
                              validator: (val) =>
                                  val!.isEmpty ? "Entrez un nom" : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        //  onTap: !_loader ? _submitForm : () {},
                        child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Center(
                            child: !_loader
                                ? Text(
                                    "Enregistrer",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                : spinkit,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
