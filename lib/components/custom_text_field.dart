import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF6a7b8c)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        prefixIcon: icon,
      ),
    );
  }
}
