import 'package:flutter/material.dart';

import '../../init/navigation/navigation_service.dart';
import '../../init/network/i_core_dio.dart';
import '../../init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;

  ICoreDio? coreDio = NetworkManager.instance!.coreDio;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
