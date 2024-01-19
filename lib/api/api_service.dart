import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/api/request_url.dart';
import 'package:movie_app/models/api_response.dart';

String apiReadAccessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY3ZWRiMTI3Y2Y4MTg1NjBkNTQxODZlZDUxNmY1MCIsInN1YiI6IjY1YTk3OGM2OGQ1MmM5MDEzNzgxODgyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6nzrNrI9RH19dJaI3ec-sTtSfJhxu98UcqKeHfAi1x0';

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
