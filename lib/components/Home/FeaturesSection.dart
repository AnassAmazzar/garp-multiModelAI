import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  final List<Map<String, String>> features = [
  {
    'title': 'Classification d\'images (ANN)',
    'description': 'Utilisez les réseaux de neurones artificiels pour classer vos images avec précision.',
  },
  {
    'title': 'Classification d\'images (CNN)',
    'description': 'Exploitez la puissance des réseaux convolutifs pour analyser et catégoriser des images complexes.',
  },
  {
    'title': 'Prédiction des prix (RNN)',
    'description': 'Prévoyez les tendances des prix en utilisant les réseaux récurrents.',
  },
  {
    'title': 'Chat Bot',
    'description': 'Interagissez avec un chatbot intelligent conçu pour répondre à vos besoins.',
  },
];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nos Fonctionnalités',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Nombre de colonnes
              childAspectRatio: 3 / 2, // Proportion des cartes
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: features.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final feature = features[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.featured_play_list, size: 40, color: Colors.blue),
                      SizedBox(height: 10),
                      Text(
                        feature['title']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        feature['description']!,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
