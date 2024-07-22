import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../images/p_rounded_image.dart';
import '../../texts/p_brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class PCartItem extends StatelessWidget {
  const PCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PRoundedImage(
          imageUrl: PImages.productImage13,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(PSizes.sm),
          backgroundColor: PHelperFunctions.isDarkMode(context)
              ? PColors.darkerGrey
              : PColors.light,
        ),
        const SizedBox(
          width: PSizes.spaceBtwItems,
        ),

        ///Title, Price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                  child:
                      PProductTitleText(title: 'Black Sport Shoe', maxLine: 1)),

              ///Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Red ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'UK 08 ',
                    style: Theme.of(context).textTheme.bodyMedium),
              ]))
            ],
          ),
        ),
      ],
    );
  }
}
