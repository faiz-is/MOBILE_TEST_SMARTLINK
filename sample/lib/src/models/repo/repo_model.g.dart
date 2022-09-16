// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoModels _$RepoModelsFromJson(Map<String, dynamic> json) => RepoModels(
      status: json['status'] as bool,
      data: json['data'] as List<dynamic>? ?? const [],
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$RepoModelsToJson(RepoModels instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
