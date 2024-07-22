import 'package:ecommerce/commons/styles/shadow.dart';
import 'package:ecommerce/commons/widgets/icons/p_circular_icon.dart';
import 'package:ecommerce/commons/widgets/texts/product_title_text.dart';
import 'package:ecommerce/features/shop/controllers/product_controller.dart';
import 'package:ecommerce/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../images/p_rounded_image.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/p_brand_title_text_with_verified_icon.dart';
import '../../texts/product_price_text.dart';

class PProductCardVertical extends StatelessWidget {
  const PProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            product: product,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [PShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(PSizes.productImageRadius),
            color: dark ? PColors.darkerGrey : PColors.white),
        child: Column(
          children: [
            ///thumbnail, wishlist btn,Discount Tag
            PRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(PSizes.sm),
              backgroundColor: dark ? PColors.dark : PColors.light,
              child: Stack(
                children: [
                  ///thumbnail image
                  Center(
                    child: PRoundedImage(
                        imageUrl: product.thumbnail,
                        applyImageRadius: true,
                        isNetworkImage: true),
                  ),

                  ///Sale tag
                  Positioned(
                    top: 12,
                    child: PRoundedContainer(
                      padding: const EdgeInsets.symmetric(
                          horizontal: PSizes.sm, vertical: PSizes.xs),
                      radius: PSizes.sm,
                      backgroundColor: PColors.secondary.withOpacity(0.8),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: PColors.black),
                      ),
                    ),
                  ),

                  ///Favorite Icon Option
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: PCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),

            ///Details
            Padding(
              padding: EdgeInsets.only(left: PSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PProductTitleText(
                      title: product.title,
                      // smallSize: true,
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems / 2,
                    ),
                    PBrandTitleWithVerifiedIcon(title: product.brand!.name),

                    // const Spacer(),

                    //Price
                  ],
                ),
              ),
            ),
            const Spacer(),

            ///Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: PSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      ///Price, show sale price as main price if sales exist
                      Padding(
                        padding: const EdgeInsets.only(left: PSizes.sm),
                        child: PProductPriceText(
                          // isLarge: true,
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
                  ),
                ),

                ///Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                      color: PColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(PSizes.cardRadiusMd),
                          bottomRight:
                              Radius.circular(PSizes.productImageRadius))),
                  child: const SizedBox(
                    height: PSizes.iconLg * 1.2,
                    width: PSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: PColors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
