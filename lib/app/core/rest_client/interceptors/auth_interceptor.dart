import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  void onResquest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('access_token');
    options.headers['Authorization'] = 'Bearer $accessToken';

    print(accessToken);

    handler.next(options);
  }

  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final sp = await SharedPreferences.getInstance();
      sp.clear();
    } else {
      handler.next(err);
    }
  }
}
