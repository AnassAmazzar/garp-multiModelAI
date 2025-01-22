import 'package:flutter/material.dart';
import 'package:garp/services/Auth_service.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late List<TextField> listTextField;

  @override
  void initState() {
    listTextField = [
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, contraints) {
        if (contraints.maxWidth > 715) {
          return desktopView();
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
          height: 350,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              //height: 350,
              //width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Sign In Form",
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
                      await AuthService.signIn(
                          email: emailController.text,
                          password: passwordController.text);
                          Navigator.pushNamed(context, '');
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "/register");
                    },
                    child: const Text("Don’t have an account yet? Sign up now!",
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