import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:garp/pages/home.dart' as home;
import 'package:garp/components/Home.dart';
import 'package:garp/components/VocalAsistant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:garp/components/header/AppRouter.dart';
import 'package:garp/components/login/LoginWidget.dart';
import 'package:garp/components/signup/SignUp.dart';
import 'package:garp/firebase_options.dart';
//import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  final User? userConnected=FirebaseAuth.instance.currentUser;
  //   final GoRoute _goRoute = GoRoute(
  //   routes: [
  //     GoRoute(path: "/", builder: (context, state) => const MyHomePage()),
  //     GoRoute(path: "/vocal-asistant", builder: (context, state) => const VocalAsistant()),
  //   ], path: '/'
  // );
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      // routes: {
      //   '': (context) => const LoginWidget(),
      //   '/home': (context) => const MyHomePage(),
      //   '/login': (context) => const LoginWidget(),
      //   '/register': (context) => const SignUp(),
      //   '/vocalasistant': (context) => const VocalAsistant(),
      // },
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot){
          // if(snapshot.connectionState==ConnectionState.waiting){
          //   return LoadingScreen();
          // }
          if(!snapshot.hasData){
            return const LoginWidget();
          }
          
          return const MyHomePage();
        }
        ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 14, 32, 102)),
        useMaterial3: true,
      ),
      //home: const Navigator(),
    );
  }
}




