import 'package:flutter/material.dart';

class ResumeUtils {
  static void snackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }

  static void deleteDialog(BuildContext context, VoidCallback onPressed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Do you want to delete this?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('No')),
          TextButton(onPressed: onPressed, child: const Text('Yes')),
        ],
      ),
    );
  }
}
