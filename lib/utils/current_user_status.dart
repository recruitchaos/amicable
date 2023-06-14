import 'package:amicable/controller/status_provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentUserStatus extends StatefulWidget {
  const CurrentUserStatus({super.key});

  @override
  State<CurrentUserStatus> createState() => _CurrentUserStatusState();
}

class _CurrentUserStatusState extends State<CurrentUserStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, StatusProvider provider, child) { 
          return ListView.builder(
            itemCount: provider.userData.length,
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
                      Text(provider.userData[index].data['Name']),
                    ],
                  ),
                  Row(
                    children: [Icon(Icons.more_horiz)],
                  )
                ],
              ),
              const SizedBox(height: 16,),
              Container(
                child: Text(provider.userData[index].data['Content']),
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