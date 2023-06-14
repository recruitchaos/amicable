import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isObscure;
  final Icon? icon;
  const CustomTextField({super.key, required this.label, required this.controller, required this.isObscure, this.icon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: widget.isObscure,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.icon,
          label: Text(widget.label),
          contentPadding: EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            gapPadding: 2
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            gapPadding: 2
          )
        ),
      ),
    );
  }
}