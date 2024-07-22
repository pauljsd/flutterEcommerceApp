import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class PCircularIcon extends StatelessWidget {
  //A custom circular widget with Background Color
  //Properties are:
  //1. Container [width], [height], [backgrondColor]
  //2. Icon [size], [color], [onPressed]

  const PCircularIcon(
      {super.key,
      required this.icon,
      this.width,
      this.height,
      this.size = PSizes.lg,
      this.onPressed,
      this.color,
      this.backgroundColor});

  final double? width, height, size;
  final IconData icon;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor != null
              ? backgroundColor!
              : PHelperFunctions.isDarkMode(context)
                  ? PColors.black.withOpacity(0.9)
                  : PColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
