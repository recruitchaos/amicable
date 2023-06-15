import 'package:amicable/utils/status.dart';
import 'package:flutter/material.dart';

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