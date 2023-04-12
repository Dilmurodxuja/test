import 'package:devtestapp/core/api/api_base.dart';
import 'package:devtestapp/core/api/complaint_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

void setup(){
  var token = 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODE4NTQzOTgsInVzZXJfaWQiOjN9.t0KC0iFwjCDnOUdYNVSJ2DR5_qWkiwLIUfmXHkWB4WmC6TKykFtC2maofn2msynosFiDRzRNfoc2OlQBxrU77A';

  di.registerSingleton(ApiBase(
    Dio(
      BaseOptions(
        baseUrl: 'http://89.108.103.40/',
        connectTimeout: const Duration(seconds: 60),
        headers: {
          'Authorization': 'Bearer $token',
          'id': '100'
        },
      ),
    ),
  ));
  di.registerSingleton(ComplaintApi(di.get()));
}