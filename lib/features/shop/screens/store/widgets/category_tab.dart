import 'package:ecommerce/commons/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../commons/widgets/brand/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/category_model.dart';

class PCategoryTab extends StatelessWidget {
  const PCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
              padding: const EdgeInsets.all(PSizes.defaultSpace),
              child: Column(
                children: [
                  //Brands
                  const PBrandShowcase(
                    images: [
                      PImages.productImage3,
                      PImages.productImage2,
                      PImages.productImage1
                    ],
                  ),
                  const PBrandShowcase(
                    images: [
                      PImages.productImage3,
                      PImages.productImage2,
                      PImages.productImage1
                    ],
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),

                  ///Products
                  PSectionHeading(
                    title: 'You might like',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  PGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => PProductCardVertical(
                            product: ProductModel.empty(),
                          )),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                ],
              )),
        ]);
  }
}
