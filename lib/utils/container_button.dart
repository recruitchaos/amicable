import 'package:flutter/material.dart';

class ContainerButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  const ContainerButton({super.key, required this.onTap, required this.text});

  @override
  State<ContainerButton> createState() => _ContainerButtonState();
}

class _ContainerButtonState extends State<ContainerButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 26), textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}