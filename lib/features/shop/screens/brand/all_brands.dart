import 'package:ecommerce/commons/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/appbar/appbar.dart';
import '../../../../commons/widgets/brand/brand_card.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/brands_controller.dart';
import 'brand_products.dart';
import 'brand_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandsController.instance;

    return Scaffold(
      appBar: const PAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              ///heading
              const PSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),

              ///Brand
              Obx(() {
                if (brandController.isLoading.value) return PBrandsShimmer();

                if (brandController.allBrands.isEmpty) {
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
                    itemCount: brandController.allBrands.length,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];
                      return PBrandCard(
                        showBorder: true,
                        brand: brand,
                        onTap: () => Get.to(() => BrandProducts(
                              brand: brand,
                            )),
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
