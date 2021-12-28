import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:restaurant_app/view/home/home_view/model/home_response_model.dart';
import 'package:restaurant_app/view/home/home_view/model/merchants.dart';
import 'package:restaurant_app/view/home/home_view/model/restaurant_request_model.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/app/app_constant.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/network/network_manager.dart';

import '../service/home_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  ScrollController scrollController = ScrollController();
  ObservableList<Merchants> merchants = ObservableList<Merchants>();
  late IHomeService homeService;

  int offset = 0;
  int limit = 100;
  late int index;

  @override
  void setContext(BuildContext? context) => this.context = context;
  @override
  void init() {
    homeService = HomeService(NetworkManager.instance!.coreDio);
    int offset = 0;
    int limit = 100;
    late int index;
    getMerchants();
  }

  @observable
  bool isLoading = false;

  @observable
  HomeResponseModel? response;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getMerchants() async {
    changeLoading();
    response = await homeService.getMerchants(
        RestaurantRequestModel(limit: limit, offset: offset, place: "berlin"));

    if (response!.merchants != null) {
      merchants.addAll(response!.merchants!);
    }
    changeLoading();

    if (merchants.length < 120) {
      limit = 20;
      offset = 120;
      getMerchants();
    }
  }

  void navigateToDetailsPage() {
    navigation.navigateToPage(path: NavigationConstants.DETAILS);
  }
}
