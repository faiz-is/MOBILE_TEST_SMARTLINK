import 'package:json_annotation/json_annotation.dart';
part 'api_requests.g.dart';

//register Request
@JsonSerializable()
class ServiceRequests {
  final String jwt;

  ServiceRequests({required this.jwt});

  factory ServiceRequests.fromJson(Map<String, dynamic> json) => _$ServiceRequestsFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceRequestsToJson(this);
}
