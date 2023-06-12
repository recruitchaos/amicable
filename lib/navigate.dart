import 'package:amicable/moment_screen.dart';
import 'package:amicable/status_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Navigate extends StatefulWidget {
  const Navigate({super.key});

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(),
                  Text("Amicable", textAlign: TextAlign.center,),
                  Row(
                    children: [
                      Icon(EvaIcons.globe),
                      SizedBox(width: 10,),
                      Icon(EvaIcons.paperPlaneOutline)
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(248, 248, 248, 1),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Color(0xff8d8d8d),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(5)
                      ),
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
                  children: [
                MomentScreen(),
                StatusScreen()
              ]))
            ],
          ),
        )
        ),
    );
  }
}