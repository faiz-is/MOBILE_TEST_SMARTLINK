import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sample/src/models/requests/api_requests.dart';
import '../../config/endpoint.dart';
part 'api.g.dart';

@RestApi(baseUrl: Endpoint.api)
abstract class ApiSource {
  factory ApiSource(Dio dio, {String baseUrl}) = _ApiSource;

//Post request to server
  @POST(Endpoint.service)
  Future service(@Body() ServiceRequests serviceRequests);
}
