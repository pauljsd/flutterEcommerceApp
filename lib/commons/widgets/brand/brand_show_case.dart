import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class PBrandShowcase extends StatelessWidget {
  const PBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return PRoundedContainer(
      padding: const EdgeInsets.all(PSizes.md),
      showBorder: true,
      borderColor: PColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: PSizes.spaceBtwItems),
      child: Column(
        children: [
          ///Brands with Column count
          PBrandCard(
            showBorder: false,
            brand: BrandModel.empty(),
          ),
          const SizedBox(
            height: PSizes.spaceBtwItems,
          ),

          ///Brandds Top 3 Product Image
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
        child: PRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(PSizes.md),
      margin: const EdgeInsets.only(right: PSizes.md),
      backgroundColor: PHelperFunctions.isDarkMode(context)
          ? PColors.darkGrey
          : PColors.light,
      child: Image(
        fit: BoxFit.contain,
        image: AssetImage(image),
      ),
    ));
  }
}
