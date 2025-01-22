// import 'package:flutter/material.dart';

// class CommonScaffold extends StatelessWidget {
//   final Widget body;
//   final String title;
//   final Widget? floatingActionButton;

//   const CommonScaffold({
//     super.key,
//     required this.body,
//     this.title = '', 
//     this.floatingActionButton,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         centerTitle: true,
//         backgroundColor: Colors.grey[200],
//       ),
//       endDrawer: Drawer(
//         child: ListView(
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.lightBlue
//               ), child: null,
//             ),
//             ListTile(
//               leading: const Icon(Icons.home),
//               title: const Text('Home'),
//               onTap: () {Navigator.pushNamed(context, '/');},
//             ),
//             ListTile(
//               leading: const Icon(Icons.assistant),
//               title: const Text('Vocal Assistant'),
//               onTap: () {Navigator.pushNamed(context, '/vocalasistant');},
//             ),
//             const ListTile(),
//           ]
//         ),
//       ),
//       body:  body,
//       floatingActionButton: floatingActionButton,
//     );
//   }
// }