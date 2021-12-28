import 'package:flutter/material.dart';
import 'package:restaurant_app/view/components/restaurant_button.dart';

import 'package:restaurant_app/view/home/home_view/model/merchants.dart';

import '../../core/extension/context_extension.dart';

class RestaurantCard extends StatelessWidget {
  final double width;
  final double height;
  final Merchants merchants;
  final VoidCallback? onPressed;
  const RestaurantCard(
      {Key? key,
      required this.width,
      required this.height,
      required this.merchants,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image(
                  fit: BoxFit.fill,
                  height: height * 0.8,

                  width: width,
                  // height: height,
                  image: NetworkImage(merchants.images[0].url!),
                ),
              ),
              RestaurantButton(
                color: context.colors.surface,
                onPressed: onPressed!,
                buttonLabel: "Details",
                width: width * 0.3,
                height: height * 0.125,
              )
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            width: width,
            height: height * 0.2,
            child: Text(
              merchants.name!,
              style: context.textTheme.headline5!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
