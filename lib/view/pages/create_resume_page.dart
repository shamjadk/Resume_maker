import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_maker_app/controller/provider/resume_provider.dart';
import 'package:resume_maker_app/core/utils/resume_utils.dart';
import 'package:resume_maker_app/model/resume_contents_model.dart';
import 'package:resume_maker_app/model/resume_model.dart';
import 'package:resume_maker_app/view/widgets/add_content_widget.dart';
import 'package:resume_maker_app/view/widgets/contents_widget.dart';
import 'package:resume_maker_app/view/widgets/text_field_widget.dart';

class CreateResumePage extends HookConsumerWidget {
  final int? resumeIndex;
  final bool isEdit;
  final ResumeModel? resumeModel;
  const CreateResumePage(
      {super.key, this.isEdit = false, this.resumeModel, this.resumeIndex});

  get onPressed => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final jobTitleController = useTextEditingController();

    final contentList = useState<List<ResumeContentsModel>>(
        isEdit ? resumeModel!.resumeContents : []);
    if (isEdit) {
      nameController.text = resumeModel!.name;
      jobTitleController.text = resumeModel!.jobTitle;
    }
    final image =
        useState<File?>(isEdit ? File(resumeModel!.image ?? '') : null);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Text(
            isEdit ? 'Update your resume' : 'Create your resume',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      jobTitleController.text.isEmpty) {
                    ResumeUtils.snackBar(
                        'Name and Job title are required', context);
                  } else {
                    if (isEdit) {
                      ref.read(resumeProvider.notifier).editResume(
                          ResumeModel(
                              name: nameController.text,
                              jobTitle: jobTitleController.text,
                              image: image.value!.path,
                              resumeContents: contentList.value),
                          resumeIndex!);
                      ResumeUtils.snackBar("Updated Resume", context);
                    } else {
                      ref.read(resumeProvider.notifier).createResume(
                          ResumeModel(
                              name: nameController.text,
                              jobTitle: jobTitleController.text,
                              image: image.value?.path,
                              resumeContents: contentList.value));
                      ResumeUtils.snackBar('Saved your resume', context);
                    }
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(
                  Icons.done,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () async {
                      final picker = ImagePicker();
                      if (kIsWeb) {}
                      final pickedImage =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedImage != null) {
                        image.value = File(pickedImage.path);
                      }
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: image.value == null
                          ? null
                          : kIsWeb
                              ? NetworkImage(image.value!.path) as ImageProvider
                              : FileImage(image.value!),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFieldWidget(
                  title: 'Name',
                  controller: nameController,
                  hintText: 'Enter your name',
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldWidget(
                    controller: jobTitleController,
                    title: 'Job title',
                    hintText: 'Enter job title'),
                const SizedBox(
                  height: 32,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  physics: const ClampingScrollPhysics(),
                  itemCount: contentList.value.length,
                  itemBuilder: (context, index) => ContentWidget(
                    index: index,
                    contentTitle: contentList.value[index].title,
                    contents: contentList.value[index].content,
                    deleteContent: () {
                      final contents = contentList.value;
                      contents.removeAt(index);
                      contentList.value = List.from(contents);
                    },
                    moveDown: () {
                      if (index == contentList.value.length - 1) {
                        return;
                      }
                      final sections = contentList.value;
                      final temp = sections[index];
                      sections[index] = sections[index + 1];
                      sections[index + 1] = temp;
                      contentList.value = List.from(sections);
                    },
                    moveUp: () {
                      if (index == 0) {
                        return;
                      }
                      final sections = contentList.value;
                      final temp = sections[index];
                      sections[index] = sections[index - 1];
                      sections[index - 1] = temp;
                      contentList.value = List.from(sections);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 50,
          child: FloatingActionButton.extended(
              elevation: 0,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddContentWidget(
                    onAdd: (title, content) {
                      final sections = contentList.value;
                      sections.add(
                          ResumeContentsModel(title: title, content: content));
                      contentList.value = List.from(sections);
                      Navigator.pop(context);
                    },
                  ),
                );
              },
              label: const Text('Add content')),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
