import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,  // Choisir la couleur de fond
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 546),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Bienvenue sur notre site',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Votre solution pour apprendre facilement.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Commencer'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
