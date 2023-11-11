import 'package:dio/dio.dart';

import '../Utils/constants.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;
  final dynamic frmData;

  ApiRequest({
    required this.url,
    this.data,
    this.frmData,
  });

  Dio _dio() {
    // Put your authorization token if required
    return Dio(
      BaseOptions(
        headers: {
          // 'Authorization': 'Bearer ${Constant.adminToken}', //$adminToken',
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        baseUrl: Constant.baseUrl,
      ),
    );
  }

  Future<void> get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    await _dio().get(url, queryParameters: data).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  Future<void> post({
    required Function() beforeSend,
    required Function(dynamic frmData) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    print(frmData);
    print(url);
    _dio().post(url, data: frmData).then((res) {
      print(res);
      onSuccess(res.data);
    }).catchError((error) {
      print(error);
      onError(error);
    });
  }
}
