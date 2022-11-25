import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dioHelper;

  static void getDio() {
    dioHelper = Dio(
      BaseOptions(
          baseUrl: 'https://v3.football.api-sports.io/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            "x-rapidapi-host": "v3.football.api-sports.io",
            "x-rapidapi-key": "1c1dc6711528a7d0c8a2edf68353aa59"
          }),
    );
  }

  static Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    dioHelper.options.headers = {
      'Content-Type': 'application/json',
      "x-rapidapi-host": "v3.football.api-sports.io",
      "x-rapidapi-key": "1c1dc6711528a7d0c8a2edf68353aa59"
    };
    return await dioHelper.get(endpoint, queryParameters: query);
  }
}
