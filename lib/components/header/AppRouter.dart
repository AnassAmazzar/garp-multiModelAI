import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garp/components/Home.dart';
import 'package:garp/components/VocalAsistant.dart';
import 'package:garp/components/classification/ArtificielNetwork.dart';
import 'package:garp/components/classification/ConvolutionNetwork.dart';
import 'package:garp/components/login/LoginWidget.dart';
import 'package:garp/components/signup/SignUp.dart';
import 'package:garp/components/stock-price/StockPrice.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final user = FirebaseAuth.instance.currentUser;


    // Vérifier si l'utilisateur est connecté
    // Routes accessibles sans connexion
    // Rediriger vers login si non connecté
    if(user == null) {
      switch (settings.name) {
        // case '/':
        //   return MaterialPageRoute(builder: (_) => const LoginWidget());
        case '/login':
          return MaterialPageRoute(builder: (_) => const LoginWidget());
        case '/register':
          return MaterialPageRoute(builder: (_) => const SignUp());
      }
    }

    if(user != null){
      switch (settings.name) {
          case '':
            return MaterialPageRoute(builder: (_) => const MyHomePage());
          case '/home':
            return MaterialPageRoute(builder: (_) => const MyHomePage());
          case '/vocalasistant':
            return MaterialPageRoute(builder: (_) => const VocalAsistant());
          case '/classification-images/ann':
            return MaterialPageRoute(builder: (_) => const ArtificielNetwork());
          case '/classification-images/cnn':
            return MaterialPageRoute(builder: (_) => const ConvolutionNetwork());
          case '/stock-price':
            return MaterialPageRoute(builder: (_) => const StockPrice());
          default:
            return MaterialPageRoute(
              builder: (_) => const Scaffold(
                body: Center(child: Text('Route non trouvée')),
              ),
            );
      }
    }

    return MaterialPageRoute(builder: (_) => const LoginWidget());
  }
}