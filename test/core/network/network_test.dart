import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/core/constants/enums/http_enum.dart';
import 'package:restaurant_app/core/init/network/i_core_dio.dart';
import 'package:restaurant_app/view/home/home_view/model/home_response_model.dart';
import 'package:restaurant_app/view/home/home_view/model/restaurant_request_model.dart';

import 'dio_mock.dart';

main() {
  late ICoreDioFull service;
  setUp(() {
    service = CoreDioMock(BaseOptions(baseUrl: ''));
  });
  test('CoreDio List', () async {
    final data = await service.send<HomeResponseModel, HomeResponseModel>(
        "/merchants",
        type: HttpTypes.GET,
        queryParameters:
            RestaurantRequestModel(limit: 100, offset: 0, place: "berlin")
                .toJson(),
        parseModel: HomeResponseModel());

    expect(data.data, isNotNull);
  });
}
