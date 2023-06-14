import 'package:amicable/appwrite/auth.dart';
import 'package:amicable/login_screen.dart';
import 'package:amicable/shared.dart';
import 'package:amicable/utils/container_button.dart';
import 'package:amicable/utils/custom_text_form_field.dart';
import 'package:appwrite/appwrite.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import 'appwrite/appwrite_constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

   TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  Client client = Client();

  late final Databases databases;

  String databaseId = '64876a181ab843913baa';
  String collectionId = '64895bfddf276bd5d24a';

  

  createAccount() async {
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
      await appwrite.createUser(
        email: emailController.text,
        password: passwordController.text,
        userID: usernameController.text,
        name: nameController.text,
      );
      Navigator.pop(context);
      const snackbar = SnackBar(content: Text('Account created!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      await UserSavedData.saveEmail(emailController.text);
      await UserSavedData.saveUserID(usernameController.text);
      final data = await databases.createDocument(collectionId: collectionId, databaseId: databaseId, documentId: ID.unique(), data: {
        'UserID' : usernameController.text,
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    } on AppwriteException catch (e) {
      Navigator.pop(context);
      showAlert(title: 'Account creation failed', text: e.message.toString());
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client
          .setEndpoint(endpoint)
          .setProject(projectID)
          .setSelfSigned();
    databases = Databases(client);
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
                  CustomTextField(label: 'Name', controller: nameController, icon: Icon(Ionicons.person_outline), isObscure: false,),
                  SizedBox(height: 20,),
                  CustomTextField(label: 'Username', controller: usernameController, isObscure: false, icon: Icon(Ionicons.person)),
                  SizedBox(height: 20,),
                  CustomTextField(label: 'Email', controller: emailController, isObscure: false, icon: Icon(EvaIcons.emailOutline)),
                   SizedBox(height: 20,),
                   CustomTextField(label: 'Password', controller: passwordController, icon: Icon(Icons.password_outlined), isObscure: true,),
                  
                   Spacer(),
                   ContainerButton(onTap: () { createAccount(); }, text: 'Sign Up',),
                   SizedBox(height: 16,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already signed up? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Text("Login!", style: TextStyle(color: Colors.deepPurple),))
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