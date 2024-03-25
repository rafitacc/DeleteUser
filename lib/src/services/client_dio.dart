// ignore_for_file: always_specify_types, avoid_dynamic_calls, public_member_api_docs, sort_constructors_first, unnecessary_null_comparison, deprecated_member_use, avoid_print, unused_element

import 'package:delete_user_web/src/utils/connections.dart';
import 'package:delete_user_web/src/utils/snackbars.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PharmaClient {
  late Dio _client;

  PharmaClient() {
    _client = Dio();
    _client.options.baseUrl = dotenv.get('API_URL');
    _client.interceptors.add(_interceptor());
  }

  Interceptor _interceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        //    final authF = AuthServiceF();
        //todo: verifying token
        // if (authF.isExpiredToken()) {
        //   await authF.backgroundLogin();
        // }
        // final storage = getx.Get.find<StorageService>();
        // final token = storage.appdata.read('token');

        // print(token);
        // if (token != null) {
        options.headers.addAll({'idtoken': 'Bearer '});
        // }
        return handler.next(options);
      },
      onError: (DioError error, ErrorInterceptorHandler _) async {
        print(error.response);
        if (error.response?.statusCode == 403 ||
            error.response?.statusCode == 401) {
          print('Error de token');
          //    final authF = AuthServiceF();
          // authF.backgroundLogin();
        }
        return _.reject(error);
      },
    );
  }

  // void _lockDio() {
  //   _client.lock();
  //   _client.interceptors.responseLock.lock();
  //   _client.interceptors.errorLock.lock();
  // }

  // void _unlockDio() {
  //   _client.unlock();
  //   _client.interceptors.responseLock.unlock();
  //   _client.interceptors.errorLock.unlock();
  // }

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    final bool hasInternet = await ConnectionHelper.hasInternet();

    if (!hasInternet) {
      SnackBars.snackbar(
        title: 'Error de red',
        message: '¡Sin conexión a Internet!',
        duration: 3,
      );
    }

    return _client.get(url, queryParameters: queryParameters);
  }

  Future<Response> patch(String url, dynamic body, {Options? options}) async {
    final bool hasInternet = await ConnectionHelper.hasInternet();
    if (!hasInternet) {
      SnackBars.snackbar(
        title: 'Error de red',
        message: '¡Sin conexión a Internet!',
        duration: 3,
      );
    }
    return _client.patch(url, data: body, options: options);
  }

  Future<Response> post(String url, dynamic body, {Options? options}) async {
    final bool hasInternet = await ConnectionHelper.hasInternet();
    if (!hasInternet) {
      SnackBars.snackbar(
        title: 'Error de red',
        message: '¡Sin conexión a Internet!',
        duration: 3,
      );
    }

    return _client.post(url, data: body, options: options);
  }

  Future<Response> put(String url, dynamic body) async {
    final bool hasInternet = await ConnectionHelper.hasInternet();

    if (!hasInternet) {
      SnackBars.snackbar(
        title: 'Error de red',
        message: '¡Sin conexión a Internet!',
        duration: 3,
      );
    }

    return _client.put(url, data: body);
  }

  Future<Response> delete(String url, dynamic body) async {
    final bool hasInternet = await ConnectionHelper.hasInternet();

    if (!hasInternet) {
      SnackBars.snackbar(
        title: 'Error de red',
        message: '¡Sin conexión a Internet!',
        duration: 3,
      );
    }

    return _client.delete(url, data: "");
  }
}
