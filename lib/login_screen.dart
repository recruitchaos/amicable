import 'package:amicable/appwrite/auth.dart';
import 'package:amicable/navigate.dart';
import 'package:amicable/sign_up_screen.dart';
import 'package:amicable/utils/container_button.dart';
import 'package:amicable/utils/custom_text_form_field.dart';
import 'package:appwrite/appwrite.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircularProgressIndicator(),
                ]),
          );
        });

    try {
      final AuthAPI appwrite = context.read<AuthAPI>();
      await appwrite.createEmailSession(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Navigate()));
    } on AppwriteException catch (e) {
      Navigator.pop(context);
      showAlert(title: 'Login failed', text: e.message.toString());
    }
  }

  showAlert({required String title, required String text}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }

  signInWithProvider(String provider) {
    try {
      context.read<AuthAPI>().signInWithProvider(provider: provider);
    } on AppwriteException catch (e) {
      showAlert(title: 'Login failed', text: e.message.toString());
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20,),
                  Text("Amicable", style: TextStyle(fontSize: 40),),
                  SizedBox(height: 40,),
                  CustomTextField(label: 'Email', controller: emailController, icon: Icon(EvaIcons.emailOutline), isObscure: false,),
                  SizedBox(height: 20,),
                   CustomTextField(label: 'Password', controller: passwordController, icon: Icon(Icons.password_outlined), isObscure: true,),
                  
                   Spacer(),
                   ContainerButton(onTap: () { signIn(); }, text: 'Login',),
                   SizedBox(height: 16,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New to Amicable? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                        },
                        child: Text("Sign up!", style: TextStyle(color: Colors.deepPurple),))
                    ],
                   )
                ],
              ),
            )
          ],
        )
        ),
    );
  }
}