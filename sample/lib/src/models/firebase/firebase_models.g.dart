// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveDataFirebase _$SaveDataFirebaseFromJson(Map<String, dynamic> json) =>
    SaveDataFirebase(
      username: json['username'] as String,
      total: json['total'] as String,
      keterangan: json['keterangan'] as String,
      createdDate:  json['createdDate'] as String,
      latestDate: json['latestDate'] as String,
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$SaveDataFirebaseToJson(SaveDataFirebase instance) =>
    <String, dynamic>{
      'username': instance.username,
      'total': instance.total,
      'keterangan': instance.keterangan,
      'createdDate': instance.createdDate,
      'latestDate': instance.latestDate,
      'data': instance.data,
    };

GetDataFirebase _$GetDataFirebaseFromJson(Map<String, dynamic> json) =>
    GetDataFirebase(
      username: json['username'] as String,
      total: json['total'] as String,
      keterangan: json['keterangan'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      latestDate: DateTime.parse(json['latestDate'] as String),
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$GetDataFirebaseToJson(GetDataFirebase instance) =>
    <String, dynamic>{
      'username': instance.username,
      'total': instance.total,
      'keterangan': instance.keterangan,
      'createdDate': instance.createdDate.toIso8601String(),
      'latestDate': instance.latestDate.toIso8601String(),
      'data': instance.data,
    };
