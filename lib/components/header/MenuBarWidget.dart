import 'package:flutter/material.dart';

class MenuBarWidget extends StatelessWidget {
  final String title;
  final bool centerTitle;

  const MenuBarWidget({
    required this.title,
    required this.centerTitle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
      centerTitle: centerTitle,
      backgroundColor: const Color.fromARGB(255, 53, 138, 180),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}