import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../components/google_maps.dart';
import '../../../components/restaurant_appbar.dart';
import '../view_model/details_view_model.dart';

class DetailsView extends StatelessWidget {
  final Completer<GoogleMapController> controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, DetailsViewModel viewModel, _) {
      return BaseView<DetailsViewModel>(
          viewModel: viewModel,
          onModelReady: (model) {
            model.setContext(context);
            model.init();
          },
          onDispose: () {
            viewModel.pageController.dispose();
          },
          onPageBuilder: (BuildContext context, viewModel) => Scaffold(
              appBar: const RestaurantAppBar(),
              body: buildLayoutBuilder(viewModel)));
    });
  }

  Widget buildLayoutBuilder(DetailsViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (context.orientation == Orientation.portrait) {
          return buildBody(
              context, viewModel, constraints.maxHeight, constraints.maxWidth);
        } else {
          return buildBody(
              context, viewModel, constraints.maxWidth, constraints.maxHeight);
        }
      },
    );
  }

  Widget buildBody(BuildContext context, DetailsViewModel viewModel,
      double heigth, double width) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ListView(
            physics: ClampingScrollPhysics(),
            children: [
              SizedBox(
                child: buildPageView(viewModel, heigth, width),
                height: heigth * 0.5,
              ),
              buildHeaderTile(context, viewModel, width),
              Divider(),
              buildAddress(context, viewModel, width, heigth),
              Divider(),
              buildGoogleMaps(heigth, width, viewModel),
              Divider(),
              buildPhoneBox(context, heigth, viewModel),
            ],
          ),
          buildBookableResult(context, viewModel, width, heigth)
        ],
      ),
    );
  }

  Container buildPhoneBox(
      BuildContext context, double heigth, DetailsViewModel viewModel) {
    return Container(
      alignment: Alignment.topCenter,
      padding: context.paddingLow,
      height: heigth * 0.2,
      child: Row(
        children: [
          Icon(Icons.phone),
          SizedBox(
            width: context.lowValue,
          ),
          Text(
            viewModel.phone,
            style: context.textTheme.headline6!
                .copyWith(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  Padding buildBookableResult(BuildContext context, DetailsViewModel viewModel,
      double width, double heigth) {
    return Padding(
        padding: context.paddingNormal,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            viewModel.bookable ? "BOOKABLE ✔️" : "NOT AVAILABLE ✖️",
            style: context.textTheme.headline6!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          width: width * 0.4,
          height: heigth * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: viewModel.bookable ? Colors.green : Colors.red,
          ),
        ));
  }

  Padding buildAddress(BuildContext context, DetailsViewModel viewModel,
      double width, double heigth) {
    return Padding(
      padding: context.paddingNormal,
      child: Container(
        child: Text(
          "${viewModel.address.street} - ${viewModel.address.district} - ${viewModel.address.city} - ${viewModel.address.country}  ",
          style: context.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        width: width * 0.7,
        height: heigth * 0.05,
      ),
    );
  }

  Padding buildHeaderTile(
      BuildContext context, DetailsViewModel viewModel, double width) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: ListTile(
        // width: context.width,
        leading: Container(
          width: width * 0.6,
          child: Text(
            viewModel.name,
            style: context.textTheme.headline5!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(context.lowValue),
          decoration: BoxDecoration(
              color: Colors.green[800],
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            "${viewModel.reviewScore} / 6",
            style: context.textTheme.bodyText1!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  GoogleMaps buildGoogleMaps(
      double heigth, double width, DetailsViewModel viewModel) {
    return GoogleMaps(
      mapController: controller,
      heightOfScreen: heigth * 0.2,
      widthOfScreen: width * 0.8,
      markers: viewModel.markers,
      initCameraPosition: LatLng(
          viewModel.coordinates.latitude!, viewModel.coordinates.longitude!),
    );
  }

  PageView buildPageView(
      DetailsViewModel viewModel, double height, double width) {
    return PageView.builder(
      controller: viewModel.pageController,
      itemCount: viewModel.images.length,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: viewModel.pageController,
          builder: (context, child) {
            double value = 0.7;
            if (viewModel.pageController.position.haveDimensions) {
              value = viewModel.pageController.page! - index;
              value = (1 - (value.abs() * 0.25));
            }

            return Center(
              child: SizedBox(
                height: Curves.easeInOut.transform(value) * height * 0.4,
                width: Curves.easeInOut.transform(value) * width * 0.8,
                child: child,
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                viewModel.images[index].url!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
