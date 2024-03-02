import 'dart:convert';
import 'dart:developer';

import 'package:resume_maker_app/model/resume_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'resume_provider.g.dart';

@riverpod
class Resume extends _$Resume {
  @override
  List<ResumeModel> build() {
    SharedPreferences.getInstance().then((sharedPrefs) {
      final keys = sharedPrefs.getKeys();
      final resumeList = <ResumeModel>[];

      for (final key in keys) {
        try {
          resumeList.add(
              ResumeModel.fromJson(jsonDecode(sharedPrefs.getString(key)!)));
        } catch (e) {
          log('Cannot get resume with key : $key');
        }
      }

      state = resumeList;
    });

    return [];
  }

  /// Create resume
  void createResume(ResumeModel resumeModel) async {
    (await SharedPreferences.getInstance())
        .setString(resumeModel.name, jsonEncode(resumeModel.toJson()));
    state = [...state, resumeModel];
  }

  /// Edit resumeModel
  void editResume(ResumeModel resumeModel, int index) async {
    final sharedPrefs = await SharedPreferences.getInstance();

    sharedPrefs.remove(state[index].name);
    sharedPrefs.setString(resumeModel.name, jsonEncode(resumeModel.toJson()));

    final updatedResumeList = [...state];
    updatedResumeList[index] = resumeModel;

    state = updatedResumeList;
  }

  /// remove the resume
  void removeResume(int index) async {
    (await SharedPreferences.getInstance()).remove(state[index].name);
    state = [...state]..removeAt(index);
  }
}