import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/core/extension/context_extension.dart';

class GoogleMaps extends StatelessWidget {
  // final Function? onMapCreated;
  final double? heightOfScreen;
  final double? widthOfScreen;
  final LatLng? initCameraPosition;
  final Set<Marker>? markers;
  final Completer<GoogleMapController> mapController;

  const GoogleMaps({
    Key? key,
    this.heightOfScreen,
    this.widthOfScreen,
    this.initCameraPosition,
    required this.mapController,
    this.markers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      width: widthOfScreen,
      height: heightOfScreen,
      child: GoogleMap(
        markers: markers!,
        myLocationButtonEnabled: false,
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: initCameraPosition!,
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController.complete(controller);
        },
      ),
    );
  }
}
