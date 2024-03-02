import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_contents_model.freezed.dart';
part 'resume_contents_model.g.dart';

@freezed
class ResumeContentsModel with _$ResumeContentsModel {
  factory ResumeContentsModel({
    required String title,
    required String content,
  }) = _ResumeContentsModel;

  factory ResumeContentsModel.fromJson(Map<String, Object?> json) =>
      _$ResumeContentsModelFromJson(json);
}
