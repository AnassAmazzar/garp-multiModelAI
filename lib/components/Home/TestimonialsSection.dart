import 'package:flutter/material.dart';

class TestimonialsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Témoignages',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              TestimonialCard(
                name: 'Utilisateur 1',
                testimony: 'Ce site m\'a vraiment aidé à progresser!',
              ),
              TestimonialCard(
                name: 'Utilisateur 2',
                testimony: 'Une expérience d\'apprentissage incroyable.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final String name;
  final String testimony;

  TestimonialCard({required this.name, required this.testimony});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(testimony),
          ],
        ),
      ),
    );
  }
}
