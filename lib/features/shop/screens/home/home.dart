import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../commons/widgets/custom_shapes/containers/search_container.dart';
import '../../../../commons/widgets/layouts/grid_layout.dart';
import '../../../../commons/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../commons/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product_controller.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///BLUE BACKGROUND PART
            const PPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///AppBar
                  PHomeAppBar(),

                  SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),

                  /// SearchBar
                  PSearchContainer(
                    text: 'Search in Store ',
                  ),

                  SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: PSizes.defaultSpace),
                    child: Column(
                      children: [
                        //Heading
                        PSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: PSizes.spaceBtwItems,
                        ),
                        //Categories
                        PHomeCategories(),
                        SizedBox(
                          height: PSizes.spaceBtwSections,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            ///BODY
            Padding(
                padding: const EdgeInsets.all(PSizes.defaultSpace),
                child: Column(
                  children: [
                    // PromoSlider
                    const PPromoSlider(),
                    const SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),

                    //Heading
                    PSectionHeading(
                      onPressed: () => Get.to(() => AllProducts(
                            title: 'Popular Products',
                            query: FirebaseFirestore.instance
                                .collection('Products')
                                .where('IsFeatured', isEqualTo: true)
                                .limit(6),
                            futureMethod: controller.fetchAllFeaturedProducts(),
                          )),
                      title: 'Popular Products',
                      showActionButton: true,
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems / 4,
                    ),

                    //Popular Product
                    Obx(() {
                      if (controller.isLoading.value)
                        return PVerticalProductShimmer();

                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                            child: Text(
                                'No Data Data Found baawo, we gather know say products choke for db na bros',
                                style: Theme.of(context).textTheme.bodyMedium));
                      }
                      // {
                      //   controller.featuredProducts.add(ProductModel(
                      //     id: '1',
                      //     title: 'Default Product',
                      //     stock: 10,
                      //     price: 99.99,
                      //     thumbnail:
                      //         'https://media.istockphoto.com/id/1265024528/photo/no-better-adventure-buddy.webp?b=1&s=170667a&w=0&k=20&c=r1gm-6gd6n6qr9yjkVsXf7E0ku2sNfmCAW54kYZSdFQ=',
                      //     productType: ProductType.single.toString(),
                      //     description: 'Default Product Description',
                      //   ));
                      // }

                      return PGridLayout(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (_, index) => PProductCardVertical(
                                product: controller.featuredProducts[index],
                              ));
                    }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
