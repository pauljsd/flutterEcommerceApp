import 'package:flutter/material.dart';

import '../../../../../commons/widgets/product_cart/carts/add_remove_button.dart';
import '../../../../../commons/widgets/product_cart/carts/cart_item.dart';
import '../../../../../commons/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class PCartItems extends StatelessWidget {
  const PCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: PSizes.spaceBtwSections,
      ),
      itemCount: 3,
      itemBuilder: (_, index) => Column(
        children: [
          ///Image
          const PCartItem(),
          if (showAddRemoveButton)
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),

                    ///Add Remove Button
                    PQuantityWithAddRemoveButton(),
                  ],
                ),
                PProductPriceText(price: '234'),
              ],
            ),
        ],
      ),
    );
  }
}
