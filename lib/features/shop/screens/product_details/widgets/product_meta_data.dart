import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/commons/widgets/images/p_circular_image.dart';
import 'package:ecommerce/commons/widgets/texts/p_brand_title_text_with_verified_icon.dart';
import 'package:ecommerce/commons/widgets/texts/product_price_text.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../commons/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product_controller.dart';
// import 'lib/features/shop/models/product_model.dart';

class PProductMetaData extends StatelessWidget {
  const PProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = PHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price and Sale Price
        Row(
          children: [
            ///SaleTag
            PRoundedContainer(
              radius: PSizes.sm,
              backgroundColor: PColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: PSizes.sm, vertical: PSizes.xs),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: PColors.black),
              ),
            ),
            const SizedBox(
              width: PSizes.spaceBtwItems,
            ),

            ///Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              SizedBox(
                width: PSizes.spaceBtwItems,
              ),
            PProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 1.5,
        ),

        ///Title
        PProductTitleText(
          title: product.title,
        ),

        const SizedBox(
          height: PSizes.spaceBtwItems / 1.5,
        ),

        ///Stock Status
        Row(
          children: [
            const PProductTitleText(title: 'Status'),
            SizedBox(width: PSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),

        const SizedBox(
          height: PSizes.spaceBtwItems / 1.5,
        ),

        ///Brand
        Row(
          children: [
            PCircularImage(
              width: 32,
              height: 32,
              image: PImages.jewelryIcon,
              overlayColor: darkMode ? PColors.white : PColors.black,
            ),
            PBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
