// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResumeModelImpl _$$ResumeModelImplFromJson(Map<String, dynamic> json) =>
    _$ResumeModelImpl(
      name: json['name'] as String,
      jobTitle: json['jobTitle'] as String,
      image: json['image'] as String?,
      resumeContents: (json['resumeContents'] as List<dynamic>)
          .map((e) => ResumeContentsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResumeModelImplToJson(_$ResumeModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'jobTitle': instance.jobTitle,
      'image': instance.image,
      'resumeContents': instance.resumeContents,
    };
