import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:resume_maker_app/core/utils/resume_utils.dart';

class AddContentWidget extends HookWidget {
  final void Function(String title, String content) onAdd;
  const AddContentWidget({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final contentController = useTextEditingController();
    return AlertDialog(
      title: const Text("Add a new section"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 60,
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter title',
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contentController,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Enter content',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (titleController.text.isEmpty ||
                contentController.text.isEmpty) {
              ResumeUtils.snackBar('Empty input', context);
            } else {
              onAdd(titleController.text, contentController.text);
            }
          },
          child: const Text("Add"),
        )
      ],
    );
  }
}
