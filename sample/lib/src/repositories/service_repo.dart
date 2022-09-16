import 'package:dio/dio.dart';
import 'package:sample/src/models/repo/repo_model.dart';
import 'package:sample/src/models/requests/api_requests.dart';
import 'package:sample/src/providers/api/api.dart';

class ServiceRepo {
  final dio = Dio();
  
// get all data from api
  Future<RepoModels> getService(String auth) async {
    try {
      dio.options.contentType = "application/x-www-form-urlencoded";
      return await ApiSource(dio).service(ServiceRequests(jwt: auth)).then((rampage) => RepoModels(status: true, data: rampage));
    } on DioError catch (e) {
      return RepoModels(status: false, message: e.response.toString());
    }
  }
}
