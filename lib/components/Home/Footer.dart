import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            '© 2024 TonSite.com - Tous droits réservés',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Facebook', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Twitter', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Instagram', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
