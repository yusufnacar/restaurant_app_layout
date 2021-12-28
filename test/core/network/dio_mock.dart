import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/core/base/model/base_error.dart';
import 'package:restaurant_app/core/base/model/base_model.dart';
import 'package:restaurant_app/core/constants/enums/http_enum.dart';
import 'package:restaurant_app/core/extension/network_extension.dart';
import 'package:restaurant_app/core/init/network/i_core_dio.dart';
import 'package:restaurant_app/core/init/network/i_response_model.dart';

class CoreDioMock with DioMixin implements ICoreDioFull, Dio {
  @override
  final BaseOptions options;

  CoreDioMock(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }
  @override
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      data,
      headers,
      Map<String, dynamic>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    final Response<dynamic> response = await request(path,
        data: data, options: Options(method: type.rawValue));

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError('message'));
    }
  }

  @override
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(String path,
      {HttpTypes? type,
      T? parseModel,
      data,
      Map<String, dynamic>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    final dumyJson = '';
    final response = jsonDecode(dumyJson);
    final model = _responseParser<R, T>(parseModel, response);
    return ResponseModel<R>(data: model);
  }

  R? _responseParser<R, T>(BaseModel? model, dynamic data) {
    if (data is List) {
      return data.map((e) => model!.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model!.fromJson(data as Map<String, dynamic>) as R;
    }
    return data as R?;
  }
}
