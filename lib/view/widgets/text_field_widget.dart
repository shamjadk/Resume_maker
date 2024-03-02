import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hintText;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.title,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        SizedBox(
          height: 60,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: hintText),
          ),
        ),
      ],
    );
  }
}
