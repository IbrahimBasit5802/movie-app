import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/api/request_url.dart';
import 'package:movie_app/models/api_response.dart';

String apiReadAccessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY3ZWRiMTI3Y2Y4MTg1NjBkNTQxODZlZDUxNmY1MCIsInN1YiI6IjY1YTk3OGM2OGQ1MmM5MDEzNzgxODgyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6nzrNrI9RH19dJaI3ec-sTtSfJhxu98UcqKeHfAi1x0';

enum RequestType {
  GET,
  POST,
}

class ApiService {
  static Future<ApiResponse?> executeRequest(
    List<String> searchQuery,
    RequestType requestType,
    EndPoint endPoint, {
    dynamic data,
  }) async {
    ApiResponse? response;
    Dio dio = Dio();

    Response result;

    try {
      switch (requestType) {
        case RequestType.GET:
          dio.options.headers['Authorization'] = 'Bearer $apiReadAccessToken';
          result = await dio.get(
            baseUrl([...searchQuery], endPoint),
          );
          response = ApiResponse(
            status: result.statusCode,
            body: result.data,
            url: baseUrl([...searchQuery], endPoint),
          );

          break;
        case RequestType.POST:
          result = await dio.post(baseUrl([...searchQuery], endPoint),
              data: jsonEncode(data));
          response = ApiResponse(
            status: result.statusCode,
            body: result.data,
            url: baseUrl([...searchQuery], endPoint).toString(),
          );
          break;
        default:
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }

    return response;
  }
}
