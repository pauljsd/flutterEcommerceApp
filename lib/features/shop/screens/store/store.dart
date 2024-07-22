import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/commons/widgets/product_cart/carts/cart_menu_icon.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/brands_controller.dart';
import 'package:ecommerce/features/shop/controllers/category_controller.dart';
import 'package:ecommerce/features/shop/screens/brand/all_brands.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/appbar/tabbar.dart';
import '../../../../commons/widgets/brand/brand_card.dart';
import '../../../../commons/widgets/custom_shapes/containers/search_container.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../brand/brand_products.dart';
import '../brand/brand_shimmer.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandsController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: PAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [PCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: PHelperFunctions.isDarkMode(context)
                    ? PColors.black
                    : PColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(PSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ///SearchBar
                      const SizedBox(
                        height: PSizes.spaceBtwItems,
                      ),
                      const PSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: PSizes.spaceBtwItems,
                      ),

                      ///Featured Brand
                      PSectionHeading(
                        title: 'Feature Brands',
                        showActionButton: true,
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),

                      const SizedBox(height: PSizes.spaceBtwItems / 1.5),

                      ///BrandGrid
                      Obx(() {
                        if (brandController.isLoading.value)
                          return PBrandsShimmer();

                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: Colors.white),
                            ),
                          );
                        }
                        return PGridLayout(
                            mainAxisExtent: 80,
                            itemCount: brandController.featuredBrands.length,
                            itemBuilder: (_, index) {
                              final brand =
                                  brandController.featuredBrands[index];
                              return PBrandCard(
                                showBorder: true,
                                brand: brand,
                                onTap: () =>
                                    Get.to(() => BrandProducts(brand: brand)),
                              );
                            });
                      })
                    ],
                  ),
                ),

                //Tabs
                bottom: PTabBar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              )
            ];
          },

          ///body
          body: TabBarView(
              children: categories
                  .map((category) => PCategoryTab(category: category))
                  .toList()),
        ),
      ),
    );
  }
}
