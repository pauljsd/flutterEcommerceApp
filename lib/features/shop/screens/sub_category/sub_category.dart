import 'package:ecommerce/commons/images/p_rounded_image.dart';
import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/products/product_cards/product_card_horinzontal.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PAppBar(
        title: Text('Sport'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              const PRoundedImage(
                width: double.infinity,
                imageUrl: PImages.promoBanner1,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              ///Sub Category
              Column(
                children: [
                  ///Heading
                  PSectionHeading(
                    title: 'Sport Shirt',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections / 2,
                  ),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: PSizes.spaceBtwItems,
                            ),
                        itemBuilder: (context, index) =>
                            const PProductCartHorinzontal()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
