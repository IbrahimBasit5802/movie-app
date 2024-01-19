import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/api/request_url.dart';
import 'package:movie_app/models/api_response.dart';

String apiReadAccessToken = dotenv.env['API_READ_ACCESS_TOKEN']!;

class ApiService {
  static Future<ApiResponse?> executeRequest(
    List<String> searchQuery,
    EndPoint endPoint, {
    dynamic data,
  }) async {
    ApiResponse? response;
    Dio dio = Dio();

    Response result;

    try {
      dio.options.headers['Authorization'] = 'Bearer $apiReadAccessToken';
      result = await dio.get(
        baseUrl([...searchQuery], endPoint),
      );
      response = ApiResponse(
        status: result.statusCode,
        body: result.data,
        url: baseUrl([...searchQuery], endPoint),
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }

    return response;
  }
}
