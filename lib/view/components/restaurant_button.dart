import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';

class RestaurantButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonLabel;
  final double width;
  final double height;
  final Color color;

  const RestaurantButton(
      {Key? key,
      required this.onPressed,
      required this.buttonLabel,
      required this.width,
      required this.height,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, right: 10.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(Size(width, height)),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => color),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            autofocus: true,
            clipBehavior: Clip.none,
            child: Text(
              buttonLabel,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            onPressed: onPressed),
      ),
    );
  }
}
