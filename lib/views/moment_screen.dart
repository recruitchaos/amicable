import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class MomentScreen extends StatefulWidget {
  const MomentScreen({super.key});

  @override
  State<MomentScreen> createState() => _MomentScreenState();
}

class _MomentScreenState extends State<MomentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              child: Image.asset('assets/newyork.png'),
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(EvaIcons.heartOutline, size: 20,),
                    SizedBox(width: 6,),
                    Text("121"),
                     SizedBox(width: 16,),
                     Icon(EvaIcons.messageCircleOutline, size: 20,),
                     SizedBox(width: 6,),
                    Text("121"),
                    SizedBox(width: 16,),
                    Icon(EvaIcons.shareOutline, size: 20,),
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
            ),
            const SizedBox(height: 16,),
            Container(
              child: Text("new york is awesome"),
            ),
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
              child: Image.asset('assets/vrindavan.png'),
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(EvaIcons.heartOutline, size: 20,),
                    SizedBox(width: 6,),
                    Text("121"),
                     SizedBox(width: 16,),
                     Icon(EvaIcons.messageCircleOutline, size: 20,),
                     SizedBox(width: 6,),
                    Text("121"),
                    SizedBox(width: 16,),
                    Icon(EvaIcons.shareOutline, size: 20,),
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
            ),
            const SizedBox(height: 16,),
            Container(
              child: Text("peace 🕉️"),
            ),
          ]
        ),
      )
    );
  }
}