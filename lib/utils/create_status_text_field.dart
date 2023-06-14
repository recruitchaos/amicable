import 'package:flutter/material.dart';

class CreateStatusTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isObscure;
  final Icon? icon;
  final int? maxlines;
  const CreateStatusTextField({super.key, required this.label, required this.controller, required this.isObscure, this.icon, this.maxlines});

  @override
  State<CreateStatusTextField> createState() => _CreateStatusTextFieldState();
}

class _CreateStatusTextFieldState extends State<CreateStatusTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObscure,
      controller: widget.controller,
      maxLines: widget.maxlines,
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
    );
  }
}