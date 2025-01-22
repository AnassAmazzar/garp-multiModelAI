// import 'package:flutter/material.dart';
// //import 'package:garp/components/CommonScaffold.dart';
// import 'package:garp/services/Auth_service.dart';
// import 'package:garp/components/header/MenuBarWidget.dart';
// import 'package:garp/components/header/NavBarWidget.dart';
// //import 'package:garp/components/TodoList.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     super.key,
//   });

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
  
//   final _formKey = GlobalKey<FormState>();
//   late List<TextField> listTextField;

//   @override
//   void initState() {
//     listTextField=[
//       TextField(
//         controller: nameController,
//         keyboardType: TextInputType.name,
//         decoration: const InputDecoration(
//             hintText: 'Saisir Votre Nom', icon: Icon(Icons.person)),
//       ),
//       TextField(
//         controller: emailController,
//         keyboardType: TextInputType.emailAddress,
//         decoration: const InputDecoration(
//             hintText: 'Saisir Votre mail', icon: Icon(Icons.email_outlined)),
//       ),
//       TextField(
//         controller: passwordController,
//         keyboardType: TextInputType.visiblePassword,
//         obscureText: true,
//         decoration: const InputDecoration(
//             hintText: 'Saisir Votre mot de passe', icon: Icon(Icons.password)),
//       ),
//     ];
//     super.initState();
//     //tabController = TabController(length: contentViews.length, vsync: this);
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   void onCheck() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//         //backgroundColor: Color(0xff1e1e24),
//         appBar: const PreferredSize(preferredSize: Size.fromHeight(60), child: MenuBarWidget(
//           title: "Inscription",
//           centerTitle: true
//         )),
//         endDrawer: const NavBarWidget(),
//         body: Center(
//           child: LayoutBuilder(builder: (context, contraints) {
//         if (contraints.maxWidth > 715) {
//           return desktopView();
//         } else {
//           return mobileView();
//         }
//     })
//         )
//         );
//   }

//   Widget desktopView() {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//           height: 350,
//           width: 500,
//           child: Column(
//             children: [
//               Form(
//                   key: _formKey,
//                   child: Flexible(
//                       child: ListView.builder(
//                           itemCount: listTextField.length,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                                 padding: const EdgeInsets.all(20),
//                                 child: listTextField[index]);
//                           }))),
//               // const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     textStyle: const TextStyle(fontSize: 25),
//                     padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30))),
//                 onPressed: () async {
//                   await AuthService.signUp(email: emailController.text, password: passwordController.text);
//                 },
//                 child: const Text('inscrir'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /*
//   Column(
          
//           children: [
//             //Expanded(child: TodoList(todos: todos)),
//             SizedBox(width: 15,),
//             TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     label: Text("Email Adresse")
//                   ),
//                 ),
//             TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     label: Text("Email Adresse"),
//                     contentPadding: EdgeInsets.all(5)
//                   ),
                  
//                 )
//           ],
            
//         ),
//    */
//   // Widget desktopView() {
//   //   return Column(
//   //     mainAxisAlignment: MainAxisAlignment.start,
//   //     crossAxisAlignment: CrossAxisAlignment.end,
//   //     children: [
//   //       CustomTobBar(controller: tabController,tabs:
//   //         contentViews.map((e) => e.content).toList(),
//   //       ),
//   //       Container(
//   //         height: 400,
//   //         child: TabBarView(controller: tabController,
//   //         children:
//   //           contentViews.map((e)=> e.content).toList()
//   //         ),
//   //       )
//   //     ],
//   //   );
//   // }
//   Widget mobileView() {
//     return Container();
//   }
// }

// /**
// //int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       //_counter++;
//     });
//   }
//  * 
// appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       drawer: const Navbar(),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//  */
