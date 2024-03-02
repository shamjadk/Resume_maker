import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  final ValueNotifier themeNotifier;
  const HomePage({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    void switchTheme() async {
      themeNotifier.value = !themeNotifier.value;
      (await SharedPreferences.getInstance())
          .setBool('theme', themeNotifier.value);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resume Maker',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: switchTheme,
              icon: Icon(
                  themeNotifier.value ? Icons.light_mode : Icons.dark_mode))
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: ),
    );
  }
}
