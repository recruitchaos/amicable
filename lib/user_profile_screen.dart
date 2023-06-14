import 'package:amicable/appwrite/auth.dart';
import 'package:amicable/controller/status_provider.dart';
import 'package:amicable/login_screen.dart';
import 'package:amicable/shared.dart';
import 'package:amicable/status_screen.dart';
import 'package:amicable/utils/current_user_status.dart';
import 'package:amicable/utils/status.dart';
import 'package:appwrite/appwrite.dart';
import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http_parser/http_parser.dart';

import 'moment_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  String? username;
  String? name;

  signOut() {
    final AuthAPI appwrite = context.read<AuthAPI>();
    appwrite.signOut();
  }

  initializeUserDetails() async {
    final AuthAPI appwrite = context.read<AuthAPI>();
    username = appwrite.userID;
    name = appwrite.name;
    print(username);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeUserDetails();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      EvaIcons.arrowBack,
                      size: 26,
                    )),
                Text(
                  '$username',
                  style: TextStyle(fontSize: 26),
                ),
                GestureDetector(
                    onTap: () {
                      signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Icon(
                      EvaIcons.logOut,
                      size: 26,
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                
              },
              child: CircleAvatar(
                radius: 60,
                // backgroundImage: _file != null ? FileImage(File(_file!.path)) : null,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$name',
              style: TextStyle(fontSize: 20),
            ),
            
          ],
        ),
      ),
    )
        // ],
        // ),
        );
  }
 
}
