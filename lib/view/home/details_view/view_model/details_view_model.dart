import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../home_view/model/address.dart';
import '../../home_view/model/coordinates.dart';
import '../../home_view/model/images.dart';
import '../../home_view/view_model/home_view_model.dart';

part 'details_view_model.g.dart';

class DetailsViewModel = _DetailsViewModelBase with _$DetailsViewModel;

abstract class _DetailsViewModelBase with Store, BaseViewModel {
  late String name;
  late bool bookable;
  late List<Images> images;
  late Coordinates coordinates;
  late Address address;
  late String reviewScore;
  late PageController pageController;
  late double value;
  late int charID;
  late String phone;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    pageController = PageController(initialPage: 1, viewportFraction: 0.75);
    getMerchantsInfo();
  }

  @observable
  Set<Marker> markers = {};

  @action
  void mapMarker() {
    markers.add(Marker(
      markerId: MarkerId('<MARKER_ID>'),
      position: LatLng(coordinates.latitude!, coordinates.longitude!),
      draggable: false,
    ));
  }

  void getMerchantsInfo() {
    var provider = Provider.of<HomeViewModel>(context!, listen: true);
    var merchant = provider.merchants[provider.index];
    name = merchant.name!;
    images = merchant.images;
    bookable = merchant.bookable!;
    coordinates = merchant.location!.coordinates!;
    address = merchant.location!.address!;
    reviewScore = merchant.reviewScore!;
    phone = merchant.phoneNumber!;

    mapMarker();
  }
}
