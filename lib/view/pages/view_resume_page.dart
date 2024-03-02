import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume_maker_app/controller/provider/resume_provider.dart';

class ViewResumePage extends ConsumerWidget {
  final int index;
  const ViewResumePage({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resume = ref.read(resumeProvider)[index];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your resume'),
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
                radius: 72,
                backgroundImage: resume.image == null
                    ? null
                    : kIsWeb
                        ? NetworkImage(resume.image!) as ImageProvider
                        : FileImage(File(resume.image!)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
