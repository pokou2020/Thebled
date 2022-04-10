import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:thebled/Structure/Utilisateur_provider.dart';
import 'package:thebled/Structure/proprieteModel.dart';

const spinkit = SpinKitThreeBounce(
  color: Colors.green,
  size: 20.0,
);

class AjouterProprieter extends StatefulWidget {
  static const routeName = 'Ajouter_Propriete';
  const AjouterProprieter({Key? key}) : super(key: key);

  @override
  State<AjouterProprieter> createState() => _AjouterProprieterState();
}

class _AjouterProprieterState extends State<AjouterProprieter> {
  final _formKey = GlobalKey<FormState>();
    var _editPropriete = ProprieteModel(
    id: '',
    loyer: '',
    status: '',
    superficie: '',
    cuisine: '',
    chambre: '',
    douche: '',
    garage: '',
    ville: '',
    commune: '',
    quartier: '',
    images: '',
    lat: '',
    lon: '',
    description: '', 
  );
  final _superficieFocusNode = FocusNode();
  final _cuisineFocusNode = FocusNode();
  final _chambreFocusNode = FocusNode();
  final _saleDebainFocusNode = FocusNode();
  final _garageFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  String statu = "A louer";
  String proprietes = "Type de..";
  final _superficieController = TextEditingController();
  final _cuisineController = TextEditingController();
  final _chambreController = TextEditingController();
  final _saleDebainController = TextEditingController();
  final _garageController = TextEditingController();
  String proprietesville = "..";
  String notreComm = "Le";
  String montiek = "tier";
  final _imageUrlController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _loader = false;
  bool _checkValue = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _superficieController.dispose();
    _cuisineController.dispose();
    _chambreController.dispose();
    _saleDebainController.dispose();
    _garageController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _savePropriete() {
    final isValid = _formKey.currentState?.validate();
    if (isValid!) {
      return;
    }
    _formKey.currentState?.save();
    Provider.of<UtilisateurProvider>(context, listen: false).addProprietr(_editPropriete);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text(
          'Ajouter une Proprietes',
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
                                    prefixIcon: Icon(Icons.home,
                                        color: Colors.black87)),
                                hint: Text("A louer",
                                    style: TextStyle(fontSize: 10)),
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

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    contentPadding: EdgeInsets.all(3),
                                    prefixIcon: Icon(Icons.home,
                                        color: Colors.black87)),
                                hint: Text("Type de..",
                                    style: TextStyle(fontSize: 8)),
                                isDense: true,
                                isExpanded: true,
                                iconSize: 40,
                                value: proprietes,
                                onChanged: (String? newvalue) {
                                  setState(() {
                                    statu = newvalue!;
                                  });
                                },
                                items: <String>[
                                  'Type de..',
                                  'Maison',
                                  'Bureau',
                                  'Magasin',
                                  'Immeuble',
                                  'Terrain',
                                  'Villa',
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
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                                focusNode: _superficieFocusNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_cuisineFocusNode);
                                },
                                 validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                    onSaved: (value) {
                  _editPropriete = ProprieteModel(
                    status: _editPropriete.status,
                    loyer: _editPropriete.loyer,
                    superficie: value,
                    cuisine: _editPropriete.cuisine,
                    chambre: _editPropriete.chambre,
                    douche: _editPropriete.douche,
                    garage: _editPropriete.garage,
                    ville: _editPropriete.ville,
                    commune: _editPropriete.commune,
                    quartier: _editPropriete.quartier,
                    images: _editPropriete.images,
                    lat: _editPropriete.lat,
                    lon: _editPropriete.lon,
                    description: _editPropriete.description,
                    id: _editPropriete.id, 
                  );
                },
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                                keyboardType: TextInputType.url,
                                textInputAction: TextInputAction.done,
                                controller: _superficieController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.terrain,
                                      color: Colors.black87,
                                    ),
                                    labelText: "Superficie")),
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
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                                focusNode: _cuisineFocusNode,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(_chambreFocusNode);
                                },
                                                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                    onSaved: (value) {
                  _editPropriete = ProprieteModel(
                    status: _editPropriete.status,
                    loyer: _editPropriete.loyer,
                    superficie: _editPropriete.superficie,
                    cuisine: value,
                    chambre: _editPropriete.chambre,
                    douche: _editPropriete.douche,
                    garage: _editPropriete.garage,
                    ville: _editPropriete.ville,
                    commune: _editPropriete.commune,
                    quartier: _editPropriete.quartier,
                    images: _editPropriete.images,
                    lat: _editPropriete.lat,
                    lon: _editPropriete.lon,
                    description: _editPropriete.description,
                    id: _editPropriete.id, 
                  );
                },
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                                keyboardType: TextInputType.url,
                                textInputAction: TextInputAction.done,
                                controller: _cuisineController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.food_bank,
                                      color: Colors.black87,
                                    ),
                                    labelText: "Cuisine")),
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
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                                focusNode: _chambreFocusNode,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(_saleDebainFocusNode);
                                },
                                                                   validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                    onSaved: (value) {
                  _editPropriete = ProprieteModel(
                    status: _editPropriete.status,
                    loyer: _editPropriete.loyer,
                    superficie: _editPropriete.superficie,
                    cuisine: _editPropriete.cuisine,
                    chambre: value,
                    douche: _editPropriete.douche,
                    garage: _editPropriete.garage,
                    ville: _editPropriete.ville,
                    commune: _editPropriete.commune,
                    quartier: _editPropriete.quartier,
                    images: _editPropriete.images,
                    lat: _editPropriete.lat,
                    lon: _editPropriete.lon,
                    description: _editPropriete.description,
                    id: _editPropriete.id, 
                  );
                },
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                                keyboardType: TextInputType.url,
                                textInputAction: TextInputAction.done,
                                controller: _chambreController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.bed_rounded,
                                      color: Colors.black87,
                                    ),
                                    labelText: "Chambre")),
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
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                                focusNode: _saleDebainFocusNode,
                                                                                            validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                    onSaved: (value) {
                  _editPropriete = ProprieteModel(
                    status: _editPropriete.status,
                    loyer: _editPropriete.loyer,
                    superficie: _editPropriete.superficie,
                    cuisine: _editPropriete.cuisine,
                    chambre: _editPropriete.chambre,
                    douche: value,
                    garage: _editPropriete.garage,
                    ville: _editPropriete.ville,
                    commune: _editPropriete.commune,
                    quartier: _editPropriete.quartier,
                    images: _editPropriete.images,
                    lat: _editPropriete.lat,
                    lon: _editPropriete.lon,
                    description: _editPropriete.description,
                    id: _editPropriete.id, 
                  );
                },
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                                keyboardType: TextInputType.url,
                                textInputAction: TextInputAction.done,
                                controller: _saleDebainController,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(_garageFocusNode);
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.bathroom,
                                      color: Colors.black87,
                                    ),
                                    labelText: "Sale de bain")),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                                focusNode: _garageFocusNode,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(_garageFocusNode);
                                },
                                                                                                         validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                    onSaved: (value) {
                  _editPropriete = ProprieteModel(
                    status: _editPropriete.status,
                    loyer: _editPropriete.loyer,
                    superficie: _editPropriete.superficie,
                    cuisine: _editPropriete.cuisine,
                    chambre: _editPropriete.chambre,
                    douche: _editPropriete.douche,
                    garage: value,
                    ville: _editPropriete.ville,
                    commune: _editPropriete.commune,
                    quartier: _editPropriete.quartier,
                    images: _editPropriete.images,
                    lat: _editPropriete.lat,
                    lon: _editPropriete.lon,
                    description: _editPropriete.description,
                    id: _editPropriete.id, 
                  );
                },
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                                keyboardType: TextInputType.url,
                                textInputAction: TextInputAction.done,
                                controller: _garageController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.garage,
                                      color: Colors.black87,
                                    ),
                                    labelText: "Garage")),
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
                        SizedBox(width: 5),
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
                                  prefixIcon: Icon(Icons.location_city,
                                      color: Colors.black87)),
                              hint:
                                  Text("tier", style: TextStyle(fontSize: 10)),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: _imageUrlController.text.isEmpty
                              ? Text('Entrez url')
                              : FittedBox(
                                  child: Image.network(
                                  _imageUrlController.text,
                                  fit: BoxFit.cover,
                                )),
                        ),
                        Expanded(
                          child: TextFormField(
                              focusNode: _imageUrlFocusNode,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_imageUrlFocusNode);
                              },
                                                                                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                    onSaved: (value) {
                  _editPropriete = ProprieteModel(
                    status: _editPropriete.status,
                    loyer: _editPropriete.loyer,
                    superficie: _editPropriete.superficie,
                    cuisine: _editPropriete.cuisine,
                    chambre: _editPropriete.chambre,
                    douche: _editPropriete.douche,
                    garage: _editPropriete.garage,
                    ville: _editPropriete.ville,
                    commune: _editPropriete.commune,
                    quartier: _editPropriete.quartier,
                    images: value,
                    lat: _editPropriete.lat,
                    lon: _editPropriete.lon,
                    description: _editPropriete.description,
                    id: _editPropriete.id, 
                  );
                },
                              style: const TextStyle(
                                color: Colors.black87,
                              ),
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              controller: _imageUrlController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.picture_as_pdf_outlined,
                                    color: Colors.black87,
                                  ),
                                  labelText: "Image URL")),
                        ),
                      ],
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
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                                focusNode: _descriptionFocusNode,
                                
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(_imageUrlFocusNode);
                                },
                                                                                          validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                    onSaved: (value) {
                  _editPropriete = ProprieteModel(
                    status: _editPropriete.status,
                    loyer: _editPropriete.loyer,
                    superficie: _editPropriete.superficie,
                    cuisine: _editPropriete.cuisine,
                    chambre: _editPropriete.chambre,
                    douche: _editPropriete.douche,
                    garage: _editPropriete.garage,
                    ville: _editPropriete.ville,
                    commune: _editPropriete.commune,
                    quartier: _editPropriete.quartier,
                    images:_editPropriete.images,
                    lat: _editPropriete.lat,
                    lon: _editPropriete.lon,
                    description: value,
                    id: null, 
                  );
                },
                                maxLines: 3,
                                keyboardType: TextInputType.multiline,
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.edit,
                                      color: Colors.black87,
                                    ),
                                    hintText: 'Description')),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: 250,
                          child: FlatButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed("accueil");
                              },
                              child: Text("J' ai deja un compte",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ))),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: !_loader ? _savePropriete : () {},
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
