import 'package:flutter/material.dart';
import 'package:garp/components/Home/FeaturesSection.dart';
import 'package:garp/components/Home/Footer.dart';
import 'package:garp/components/Home/HeroSection.dart';
import 'package:garp/components/Home/TestimonialsSection.dart';
import 'package:garp/components/signup/SignUp.dart';
import 'package:garp/services/Auth_service.dart';
import 'package:garp/components/header/MenuBarWidget.dart';
import 'package:garp/components/header/NavBarWidget.dart';
//import 'package:garp/components/TodoList.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  void onCheck() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    return Scaffold(
        //backgroundColor: Color(0xff1e1e24),
        appBar: const PreferredSize(preferredSize: Size.fromHeight(60), child: MenuBarWidget(
          title: "Home",
          centerTitle: true,
        )),
        endDrawer: const NavBarWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(),
              FeaturesSection(),
              const SizedBox(height: 50),
              Footer(),
            ],
          ),
        )

        );
  }
}
