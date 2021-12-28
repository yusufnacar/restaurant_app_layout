import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:mockito/mockito.dart';
import 'package:restaurant_app/view/home/home_view/view_model/home_view_model.dart';

class HomeBuildContext extends Mock implements BuildContext {}

class HomeMockViewModel extends Mock implements HomeViewModel {
  @override
  bool isLoading = false;
}
