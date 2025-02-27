import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/bottom_add_to_widget.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const PBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Product Image Slider
            PProductImageSlider(
              product: product,
            ),

            ///Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: PSizes.defaultSpace,
                left: PSizes.defaultSpace,
                bottom: PSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  ///Rating & Share Button
                  const PRatingAndShare(),

                  ///Price, Title, Stock and Brand
                  PProductMetaData(product: product),

                  ///Attributes
                  if (product.productType == ProductType.variable.toString())
                    PProductAttributes(
                      product: product,
                    ),
                  if (product.productType == ProductType.variable.toString())
                    SizedBox(
                      height: PSizes.spaceBtwSections,
                    ),

                  ///Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Check Out')),
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),

                  ///Description
                  const PSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    product.description ?? 'Babuu description',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More ',
                    trimExpandedText: ' Less ',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),

                  ///Review
                  const Divider(),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PSectionHeading(
                        title: 'Reviews',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewScreen()),
                          icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
