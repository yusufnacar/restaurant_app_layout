import 'package:dio/dio.dart';

import 'core_dio.dart';
import 'i_core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDio? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: '');
    coreDio = CoreDio(baseOptions);
  }
}
