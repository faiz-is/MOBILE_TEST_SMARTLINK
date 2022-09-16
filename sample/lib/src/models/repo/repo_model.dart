import 'package:json_annotation/json_annotation.dart';
part 'repo_model.g.dart';

@JsonSerializable()
class RepoModels {
  bool status;
  final List data;
  final String message;

  RepoModels({required this.status, this.data = const [], this.message = ''});

  factory RepoModels.fromJson(Map<String, dynamic> json) => _$RepoModelsFromJson(json);
  Map<String, dynamic> toJson() => _$RepoModelsToJson(this);
}
