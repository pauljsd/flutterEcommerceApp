import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/p_circular_image.dart';
import '../texts/p_brand_title_text_with_verified_icon.dart';

class PBrandCard extends StatelessWidget {
  const PBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      //Container Design
      child: PRoundedContainer(
        padding: const EdgeInsets.all(PSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///Icon
            Flexible(
              child: PCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: PHelperFunctions.isDarkMode(context)
                    ? PColors.white
                    : PColors.black,
              ),
            ),
            const SizedBox(height: PSizes.spaceBtwItems / 1.5),

            ///Text
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PBrandTitleWithVerifiedIcon(
                  title: brand.name,
                  brandTextSize: TextSizes.large,
                ),
                Text(
                  '${brand.productCount ?? 0} products',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
