// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResumeModel _$ResumeModelFromJson(Map<String, dynamic> json) {
  return _ResumeModel.fromJson(json);
}

/// @nodoc
mixin _$ResumeModel {
  String get name => throw _privateConstructorUsedError;
  String get jobTitle => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<ResumeContentsModel> get resumeContents =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResumeModelCopyWith<ResumeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResumeModelCopyWith<$Res> {
  factory $ResumeModelCopyWith(
          ResumeModel value, $Res Function(ResumeModel) then) =
      _$ResumeModelCopyWithImpl<$Res, ResumeModel>;
  @useResult
  $Res call(
      {String name,
      String jobTitle,
      String? image,
      List<ResumeContentsModel> resumeContents});
}

/// @nodoc
class _$ResumeModelCopyWithImpl<$Res, $Val extends ResumeModel>
    implements $ResumeModelCopyWith<$Res> {
  _$ResumeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? jobTitle = null,
    Object? image = freezed,
    Object? resumeContents = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      jobTitle: null == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeContents: null == resumeContents
          ? _value.resumeContents
          : resumeContents // ignore: cast_nullable_to_non_nullable
              as List<ResumeContentsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResumeModelImplCopyWith<$Res>
    implements $ResumeModelCopyWith<$Res> {
  factory _$$ResumeModelImplCopyWith(
          _$ResumeModelImpl value, $Res Function(_$ResumeModelImpl) then) =
      __$$ResumeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String jobTitle,
      String? image,
      List<ResumeContentsModel> resumeContents});
}

/// @nodoc
class __$$ResumeModelImplCopyWithImpl<$Res>
    extends _$ResumeModelCopyWithImpl<$Res, _$ResumeModelImpl>
    implements _$$ResumeModelImplCopyWith<$Res> {
  __$$ResumeModelImplCopyWithImpl(
      _$ResumeModelImpl _value, $Res Function(_$ResumeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? jobTitle = null,
    Object? image = freezed,
    Object? resumeContents = null,
  }) {
    return _then(_$ResumeModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      jobTitle: null == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeContents: null == resumeContents
          ? _value._resumeContents
          : resumeContents // ignore: cast_nullable_to_non_nullable
              as List<ResumeContentsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResumeModelImpl implements _ResumeModel {
  _$ResumeModelImpl(
      {required this.name,
      required this.jobTitle,
      required this.image,
      required final List<ResumeContentsModel> resumeContents})
      : _resumeContents = resumeContents;

  factory _$ResumeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResumeModelImplFromJson(json);

  @override
  final String name;
  @override
  final String jobTitle;
  @override
  final String? image;
  final List<ResumeContentsModel> _resumeContents;
  @override
  List<ResumeContentsModel> get resumeContents {
    if (_resumeContents is EqualUnmodifiableListView) return _resumeContents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resumeContents);
  }

  @override
  String toString() {
    return 'ResumeModel(name: $name, jobTitle: $jobTitle, image: $image, resumeContents: $resumeContents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._resumeContents, _resumeContents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, jobTitle, image,
      const DeepCollectionEquality().hash(_resumeContents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeModelImplCopyWith<_$ResumeModelImpl> get copyWith =>
      __$$ResumeModelImplCopyWithImpl<_$ResumeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResumeModelImplToJson(
      this,
    );
  }
}

abstract class _ResumeModel implements ResumeModel {
  factory _ResumeModel(
          {required final String name,
          required final String jobTitle,
          required final String? image,
          required final List<ResumeContentsModel> resumeContents}) =
      _$ResumeModelImpl;

  factory _ResumeModel.fromJson(Map<String, dynamic> json) =
      _$ResumeModelImpl.fromJson;

  @override
  String get name;
  @override
  String get jobTitle;
  @override
  String? get image;
  @override
  List<ResumeContentsModel> get resumeContents;
  @override
  @JsonKey(ignore: true)
  _$$ResumeModelImplCopyWith<_$ResumeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
