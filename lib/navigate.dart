import 'package:amicable/controller/status_provider.dart';
import 'package:amicable/moment_screen.dart';
import 'package:amicable/status_screen.dart';
import 'package:amicable/user_profile_screen.dart';
import 'package:amicable/utils/container_button.dart';
import 'package:amicable/utils/create_status_text_field.dart';
import 'package:amicable/utils/custom_text_form_field.dart';
import 'package:appwrite/appwrite.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import 'appwrite/appwrite_constants.dart';
import 'appwrite/auth.dart';

class Navigate extends StatefulWidget {
  const Navigate({super.key});

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final TextEditingController statusController = TextEditingController();

  int? noOfStatus;

  Client client = Client();

  late final Databases databases;

  String? username;
  String? name;

  initializeUserDetails() async {
    final AuthAPI appwrite = context.read<AuthAPI>();
    username = appwrite.userID;
    name = appwrite.name;
    print(username);
  }

  String databaseId = '64876a181ab843913baa';
  String collectionId = '64895bfddf276bd5d24a';

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    client
          .setEndpoint(endpoint)
          .setProject(projectID)
          .setSelfSigned();
    databases = Databases(client);
    initializeUserDetails();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    StatusProvider provider = Provider.of<StatusProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                    child: CircleAvatar()),
                Text(
                  "Amicable",
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                    onTap: () {
                      if (tabController.index == 1) {
                        print('on status');
                        showModalBottomSheet(
                          context: context,
                          useSafeArea: true,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Create Status", style: TextStyle(fontSize: 20),),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  provider.createStatus(statusController.text, 0, '$name');
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Status uploaded!')));
                                                },
                                                child: Icon(EvaIcons.checkmarkCircle, color: Colors.deepPurple,)),
                                              SizedBox(width: 12,),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Icon(EvaIcons.closeCircleOutline)),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                        child: CreateStatusTextField(label: 'Write your status here', controller: statusController, isObscure: false, maxlines: 2,),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        print("on moments");
                      }
                    },
                    child: Icon(Ionicons.add_circle_outline)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(248, 248, 248, 1),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Color(0xff8d8d8d),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(5)),
                      indicatorWeight: 2,
                      controller: tabController,
                      tabs: [
                        Tab(
                          text: "Moment",
                        ),
                        Tab(
                          text: "Status",
                        )
                      ]),
                )
              ]),
            ),
            Expanded(
                child: TabBarView(
                    controller: tabController,
                    children: [MomentScreen(), StatusScreen()]))
          ],
        ),
      )),
    );
  }
}
