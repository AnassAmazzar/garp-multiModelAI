import 'package:flutter/material.dart';
import 'package:garp/services/Auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _MySignUp();
}

class _MySignUp extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late List<TextField> listTextField;

  @override
  void initState() {
    listTextField = [
      TextField(
        controller: nameController,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
            hintText: 'Saisir Votre Nom', icon: Icon(Icons.person)),
      ),
      TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Saisir Votre mail', icon: Icon(Icons.email_outlined)),
      ),
      TextField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Saisir Votre mot de passe', icon: Icon(Icons.password)),
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, contraints) {
        if (contraints.maxWidth > 715) {
          return Center(child: desktopView());
        } else {
          return mobileView();
        }
      }),
    );
  }

  Widget desktopView() {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          height: 400,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              //height: 350,
              //width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Sign Up Form",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 53, 138, 180),
                    ),
                    ),
                  Form(
                      key: _formKey,
                      child: Flexible(
                          child: ListView.builder(
                              itemCount: listTextField.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: listTextField[index]);
                              }))),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 25),
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () async {
                      await AuthService.signUp(
                          email: emailController.text,
                          password: passwordController.text);
                          //FirebaseDa
                          Navigator.pushNamed(context, "");
                    },
                    child: const Text('sign up'),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "/login");
                    },
                    child: const Text("Already have an account ? Please log in here.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 57, 38, 13)
                    ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget mobileView() {
    return Container();
  }
}
