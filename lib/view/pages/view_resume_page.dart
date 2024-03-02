import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume_maker_app/controller/provider/resume_provider.dart';
import 'package:resume_maker_app/view/pages/create_resume_page.dart';

class ViewResumePage extends ConsumerWidget {
  final int index;
  const ViewResumePage({super.key, required this.index});

  get icon => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resume = ref.read(resumeProvider)[index];
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          'Your resume',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateResumePage(
                      isEdit: true,
                      resumeIndex: index,
                      resumeModel: ref.read(resumeProvider)[index],
                    ),
                  )),
              icon: const Icon(Icons.edit))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: resume.image == null
                    ? null
                    : kIsWeb
                        ? NetworkImage(resume.image!) as ImageProvider
                        : FileImage(File(resume.image!)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              resume.name,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              resume.jobTitle,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(
              height: 32,
            ),
            ListView.builder(
              itemCount: resume.resumeContents.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(resume.resumeContents[index].title),
                  subtitle: Text(resume.resumeContents[index].content),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
