import 'package:flutter/material.dart';
import 'package:restaurant_app/core/extension/context_extension.dart';

import '../../core/constants/image/image_constants.dart';

class RestaurantAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RestaurantAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        ImageConstants.splashImage,
        alignment: Alignment.topCenter,
        height: kToolbarHeight,
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}
