import 'package:amicable/appwrite/auth.dart';
import 'package:amicable/controller/status_provider.dart';
import 'package:amicable/utils/status.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {

  String? contentStatus;


  @override
  Widget build(BuildContext context) {
    return Status();
  }
}
