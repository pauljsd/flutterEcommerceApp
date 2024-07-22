import 'package:ecommerce/features/shop/controllers/all_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';
import '../products/product_cards/product_card_vertical.dart';

class PSortableProduct extends StatelessWidget {
  const PSortableProduct({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    ///Initialize controller to manage products sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);

    return Column(
      children: [
        ///DropDown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            //this will sort products based on selected option
            controller.sortProducts(value!);
          },
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),

        /// Product
        Obx(
          () => PGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) =>
                  PProductCardVertical(product: controller.products[index])),
        )
      ],
    );
  }
}
