import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_maker_app/model/resume_contents_model.dart';

part 'resume_model.freezed.dart';
part 'resume_model.g.dart';

@freezed
class ResumeModel with _$ResumeModel {
  factory ResumeModel({
    required String name,
    required String jobTitle,
    required String? image, 
    required List<ResumeContentsModel> resumeContents,
  }) = _ResumeModel;

  factory ResumeModel.fromJson(Map<String, Object?> json) =>
      _$ResumeModelFromJson(json);
}
