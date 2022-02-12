// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String _selectedPicGroup;

//   static const _picGroup = [
//     'Group A',
//     'Group B',
//     'Group C',
//     'Group D',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 78,
//               child: DropdownButtonFormField(
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   filled: true,
//                   fillColor: Colors.grey[300],
//                 ),
//                 hint: Text('Please select group'),
//                 isExpanded: true,
//                 isDense: true,
//                 value: _selectedPicGroup,
//                 selectedItemBuilder: (BuildContext context) {
//                   return _picGroup.map<Widget>((String item) {
//                     print("$item");
//                     return DropdownMenuItem(value: item, child: Text(item));
//                   }).toList();
//                 },
//                 items: _picGroup.map((item) {
//                   if (item == _selectedPicGroup) {
//                     return DropdownMenuItem(
//                       value: item,
//                       child: Container(
//                           height: 48.0,
//                           width: double.infinity,
//                           color: Colors.grey,
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               item,
//                             ),
//                           )),
//                     );
//                   } else {
//                     return DropdownMenuItem(
//                       value: item,
//                       child: Text(item),
//                     );
//                   }
//                 }).toList(),
//                 validator: (value) =>
//                     value?.isEmpty ?? true ? 'Cannot Empty' : null,
//                 onChanged: (selectedItem) => setState(
//                   () {
//                     _selectedPicGroup = selectedItem;
//                   },
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }