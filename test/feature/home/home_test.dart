import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/core/init/network/network_manager.dart';
import 'package:restaurant_app/view/home/home_view/model/restaurant_request_model.dart';
import 'package:restaurant_app/view/home/home_view/service/home_service.dart';

import 'home_mockito.dart';

void main() {
  IHomeService? homeService;
  BuildContext? context;

  late HomeMockViewModel homeMockViewModel;
  setUp(() {
    homeService = HomeService(NetworkManager.instance!.coreDio);
    context = HomeBuildContext();

    homeMockViewModel = HomeMockViewModel();
    homeMockViewModel.setContext(context);
    homeMockViewModel.init();
  });
  test('Fetch Merchants', () async {
    final response = await homeService?.getMerchants(
        RestaurantRequestModel(limit: 100, offset: 0, place: "berlin"));

    expect(response!.merchants, isNotNull);
  });

  test('Fetch count', () async {
    final response = await homeService?.getMerchants(
        RestaurantRequestModel(limit: 100, offset: 0, place: "berlin"));

    expect(response!.merchants!.length, isPositive);
  });

  test('Context Test', () async {
    verify(homeMockViewModel.setContext(context));
  });

  test('Loading Test', () {
    homeMockViewModel.changeLoading();
    expect(homeMockViewModel.isLoading, true);
  });
}
