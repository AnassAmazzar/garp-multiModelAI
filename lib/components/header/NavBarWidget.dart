import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garp/services/Auth_service.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.lightBlue),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage("https://picsum.photos/200/300"),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    email!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  )
                ],
              ),
              // UserAccountsDrawerHeader(
              //   accountName: Text("accountName"),
              //   accountEmail: Text("accountEmail"),
              //   currentAccountPicture: CircleAvatar(
              //     backgroundImage:
              //         NetworkImage("https://picsum.photos/200/300"),
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.transparent
              //   )
              // )
            ],
          )
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        ExpansionTile(
          title: const Text('Classification image'),
          leading: const Icon(Icons.image),
          children: [
            ListTile(
              leading: const Icon(Icons.apple),
              title: const Text('ANN'),
              onTap: () {
                Navigator.pushNamed(context, '/classification-images/ann');
              },
            ),
            ListTile(
              leading: const Icon(Icons.collections_sharp),
              title: const Text('CNN'),
              onTap: () {
                Navigator.pushNamed(context, '/classification-images/cnn');
              },
            ),
          ],
        ),
        ListTile(
          leading: const Icon(Icons.attach_money),
          title: const Text('RNN'),
          onTap: () {
            Navigator.pushNamed(context, '/stock-price');
          },
        ),
        ListTile(
          leading: const Icon(Icons.assistant),
          title: const Text('Vocal Assistant'),
          onTap: () {
            Navigator.pushNamed(context, '/vocalasistant');
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: const Text('Sign out'),
          onTap: () async{
            await AuthService.signOut();
            Navigator.pushNamed(context, '/login');
          },
        )
      ]),
    );
  }
}
