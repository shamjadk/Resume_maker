import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_maker_app/controller/provider/resume_provider.dart';
import 'package:resume_maker_app/core/utils/snack_bar_utils.dart';
import 'package:resume_maker_app/model/resume_contents_model.dart';
import 'package:resume_maker_app/model/resume_model.dart';
import 'package:resume_maker_app/view/widgets/text_field_widget.dart';

class CreateResumePage extends HookConsumerWidget {
  final bool isEdit;
  final ResumeModel? resumeModel;
  const CreateResumePage({super.key, this.isEdit = false, this.resumeModel});

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
                    SnackBarUtils.snackBar(
                        'Name and Job title are required', context);
                  } else {
                    ref.read(resumeProvider.notifier).createResume(ResumeModel(
                        name: nameController.text,
                        jobTitle: jobTitleController.text,
                        image: image.value?.path,
                        resumeContents: contentList.value));
                    SnackBarUtils.snackBar('Saved your resume', context);
                  }
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.done,
                  color: Theme.of(context).primaryColor,
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
                SizedBox(
                  height: 16,
                ),
                TextFieldWidget(
                    controller: jobTitleController,
                    title: 'Job title',
                    hintText: 'Enter job title')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
