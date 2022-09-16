import 'package:json_annotation/json_annotation.dart';
part 'firebase_models.g.dart';

//Save Data To Firebase
@JsonSerializable()
class SaveDataFirebase {
  final String username;
  final String total;
  final String keterangan;
  final String createdDate;
  final String latestDate;
  final List data;

  SaveDataFirebase({
    required this.username,
    required this.total,
    required this.keterangan,
    required this.createdDate,
    required this.latestDate,
    required this.data,
  });

  factory SaveDataFirebase.fromJson(Map<String, dynamic> json) => _$SaveDataFirebaseFromJson(json);
  Map<String, dynamic> toJson() => _$SaveDataFirebaseToJson(this);
}

//Get Data TRansaction from firebase
@JsonSerializable()
class GetDataFirebase {
  final String username;
  final String total;
  final String keterangan;
  final DateTime createdDate;
  final DateTime latestDate;
  final List data;

  GetDataFirebase({
    required this.username,
    required this.total,
    required this.keterangan,
    required this.createdDate,
    required this.latestDate,
    required this.data,
  });

  factory GetDataFirebase.fromJson(Map<String, dynamic> json) => _$GetDataFirebaseFromJson(json);
  Map<String, dynamic> toJson() => _$GetDataFirebaseToJson(this);
}