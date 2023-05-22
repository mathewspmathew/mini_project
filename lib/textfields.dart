import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController mycontroller;
  final String mylabel;
  final myicon;

  const MyTextField({
    super.key,
    required this.mycontroller,
    required this.mylabel,
    this.myicon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: mycontroller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintText: mylabel,
      ),
    );
  }
}
