import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume_maker_app/controller/provider/resume_provider.dart';
import 'package:resume_maker_app/view/pages/create_resume_page.dart';
import 'package:resume_maker_app/view/pages/view_resume_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerWidget {
  final ValueNotifier themeNotifier;
  const HomePage({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final resume = ref.watch(resumeProvider)[index];

            return Card(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewResumePage(index: index),
                    )),
                leading: CircleAvatar(
                  backgroundImage: resume.image == null
                      ? null
                      : kIsWeb
                          ? NetworkImage(resume.image!) as ImageProvider
                          : FileImage(File(resume.image!)),
                  child: resume.image == null ? const Icon(Icons.person) : null,
                ),
                title: Text(
                  resume.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                subtitle: Text(resume.jobTitle),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Do you want to delete this resume?',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('No')),
                          TextButton(
                              onPressed: () {
                                ref
                                    .read(resumeProvider.notifier)
                                    .removeResume(index);
                              },
                              child: const Text('Yes')),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: ref.watch(resumeProvider).length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateResumePage(),
            )),
      ),
    );
  }
}
