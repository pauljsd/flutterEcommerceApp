import 'package:ecommerce/commons/widgets/shimmers/shimmer.dart';
import 'package:ecommerce/features/shop/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../commons/widgets/appbar/appbar.dart';
import '../../../../../commons/widgets/product_cart/carts/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/controllers/user_controller.dart';

class PHomeAppBar extends StatelessWidget {
  const PHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return PAppBar(
      title: Column(
        children: [
          Row(
            children: [
              Text(
                PTexts.homeAppbarTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: PColors.grey),
              ),
              Obx(() {
                if (controller.profileLoading.value) {
                  //Display a shimmer Loader while user profile is being loaded
                  return const PShimmerEffect(width: 80, height: 15);
                } else {
                  return Text(
                    controller.user.value.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: PColors.white),
                  );
                }
              }),
            ],
          ),
        ],
      ),
      actions: [
        PCartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()),
          iconColor: PColors.white,
        )
      ],
    );
  }
}
