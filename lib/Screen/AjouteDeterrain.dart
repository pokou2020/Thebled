import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const spinkit = SpinKitThreeBounce(
  color: Colors.green,
  size: 20.0,
);

class AjouterTerrain extends StatefulWidget {
  static const routeName = 'AjouterTerrain';


  @override
  State<AjouterTerrain> createState() => _AjouterTerrainState();
}

class _AjouterTerrainState extends State<AjouterTerrain> {
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
          'Ajouter un terrain',
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
               
                //height: 720,
                width: double.infinity,
                color: Colors.green[200],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                       const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Information Basique',
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 170,
                            decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: DropdownButtonFormField(
                                decoration: InputDecoration(      
                                                   
                                    filled: true,
                                    contentPadding: EdgeInsets.all(3),
                                    prefixIcon:
                                        Icon(Icons.home, color: Colors.black87)),
                                hint:
                                    Text("A louer", style: TextStyle(fontSize: 10)),
                                isDense: true,
                                isExpanded: true,
                                iconSize: 30,
                                value: statu,
                                onChanged: (String? newvalue) {
                                  setState(() {
                                    statu = newvalue!;
                                  });
                                },
                                items: <String>[
                                  'A louer',
                                  'En vente',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value,
                                  );
                                }).toList()),
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
                                hintText: 'Loyer en Fr',
                              ),
                              validator: (val) =>
                                  val!.isEmpty ? "Entrez un nom" : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                         Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Situation',
                          style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 112,
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(30),
                             color: Colors.white),
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: EdgeInsets.all(3),
                                  prefixIcon: Icon(Icons.location_city,
                                      color: Colors.black87)),
                              hint: Text("..", style: TextStyle(fontSize: 8)),
                              isDense: true,
                              isExpanded: true,
                              iconSize: 40,
                              value: proprietesville,
                              onChanged: (String? newvalue) {
                                setState(() {
                                  proprietesville = newvalue!;
                                });
                              },
                              items: <String>[
                                '..',
                                'Dimbokrp',
                                'Abidjan',
                                'Bassam',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList()),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 40,
                          width: 112,
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: EdgeInsets.all(3),
                                  prefixIcon: Icon(Icons.location_city,
                                      color: Colors.black87)),
                              hint: Text("Le", style: TextStyle(fontSize: 8)),
                              isDense: true,
                              isExpanded: true,
                              iconSize: 40,
                              value: notreComm,
                              onChanged: (String? newvalue) {
                                setState(() {
                                  notreComm = newvalue!;
                                });
                              },
                              items: <String>[
                                'Le',
                                'Port-Bouet',
                                'Koumassi',
                                'Marcory',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList()),
                        ),
                        SizedBox(width:5),
                           Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: EdgeInsets.all(3),
                                  prefixIcon:
                                      Icon(Icons.location_city, color: Colors.black87)),
                              hint: Text("tier",
                              style: TextStyle(
                                fontSize: 10
                              )
                              ),
                              isDense: true,
                              isExpanded: true,
                              iconSize: 30,
                              value: montiek,
                              onChanged: (String? newvalue) {
                                setState(() {
                                  montiek = newvalue!;
                                });
                              },
                              items: <String>[
                                "tier",
                                'Ocean',
                                'petit bassam',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList()),
                        ),
                      ],
                    ),
                    
                          SizedBox(
                      height: 20,
                    ),
                         Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Galerie',
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
                         mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: 250,
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: TextFormField(
                                validator: (val) =>
                                    val!.isEmpty ? "Champ Agent vide" : null,
                                onChanged: (val) => matricule = val,
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.picture_as_pdf_outlined,
                                      color: Colors.black87,
                                    ),
                                    hintText: "Photo")),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Localisation',
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
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                      ),
                    ),
                      
                          SizedBox(
                      height: 20,
                    ),
                         Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Description',
                          style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                        ],
                      ),
                    ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                  height: 80,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(30),
                                      color: Colors.white),
                                  child: TextFormField(
                                      validator: (val) =>
                                          val!.isEmpty ? "Champ Agent vide" : null,
                                      onChanged: (val) => matricule = val,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                      ),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.edit,
                                            color: Colors.black87,
                                          ),
                                          )),
                                ),
                          ),
                        ],
                      ),
                            SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                            Container(
                              height:15,
                              width:15,
                              color:Colors.white
                            ),
                                   SizedBox(
                      width: 5,
                    ),
                             Container(
                               height: 15,
                               width: MediaQuery.of(context).size.width/1.2,
                              child: Text("Je consens à ce que ce site Web stocke les  .", 
                              
                              style: TextStyle(
                                 color:Colors.white
                              ),),
                             
                            )
                      ],
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
                                    "Ajouter",
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
