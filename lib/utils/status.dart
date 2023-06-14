import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/status_provider.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, StatusProvider provider, child) { 
          return ListView.builder(
            itemCount: provider.status.length,
            itemBuilder: (context, index){
              return Column(
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
                      Text(provider.status[index].data['Name']),
                    ],
                  ),
                  Row(
                    children: [Icon(Icons.more_horiz)],
                  )
                ],
              ),
              const SizedBox(height: 16,),
              Container(
                child: Text(provider.status[index].data['Content']),
              ),
              const SizedBox(height: 20,),
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
              ),
              const SizedBox(height: 20,),
              
            ],
                  );
            },
          );
         
  }),
    );
  }
}