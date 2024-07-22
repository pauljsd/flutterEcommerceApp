import 'package:ecommerce/commons/widgets/images/p_circular_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class PVerticalImageText extends StatelessWidget {
  const PVerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.textColor = PColors.white,
    this.isNetworkImage = true,
    this.backgroundColor,
  });

  final Color textColor;
  final String image, title;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: PSizes.spaceBtwItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///circular icon
            PCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: PSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: PHelperFunctions.isDarkMode(context)
                  ? PColors.light
                  : PColors.dark,
            ),
            const SizedBox(height: PSizes.spaceBtwItems / 2),

            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
