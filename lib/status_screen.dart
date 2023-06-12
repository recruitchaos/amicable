import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text("Name"),
                ],
              ),
              Row(
                children: [Icon(Icons.more_horiz)],
              )
            ],
          ),
          const SizedBox(height: 16,),
          Container(
            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(EvaIcons.heartOutline),
                  SizedBox(width: 6,),
                  Text("121"),
                   SizedBox(width: 16,),
                   Icon(EvaIcons.messageCircleOutline),
                   SizedBox(width: 6,),
                  Text("121"),
                  SizedBox(width: 16,),
                  Icon(EvaIcons.repeatOutline, size: 20,),
                  SizedBox(width: 6,),
                  Text("121"),
                ],
              ),
              Row(
                children: [
                  Icon(EvaIcons.starOutline, size: 20,),
                  SizedBox(width: 6,),
                  Text("121"),
                ],
              ),
              
            ],
          )
        ],
      ),
    );
  }
}
