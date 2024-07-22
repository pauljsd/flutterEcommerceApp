import 'package:ecommerce/commons/widgets/success_screen/success_screen.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/appbar/appbar.dart';
import '../../../../commons/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../commons/widgets/product_cart/carts/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              ///Items in Cart
              const PCartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),

              ///Coupon TextField
              const PCouponCode(),

              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),

              ///Billing Section
              PRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(PSizes.md),
                backgroundColor: dark ? PColors.black : PColors.white,
                child: const Column(
                  children: [
                    ///Pricing
                    PBillingAmountSection(),
                    SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),

                    ///Divider
                    Divider(),
                    SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),

                    ///Payment Method
                    PBillingPaymentSection(),
                    SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),

                    ///Address
                    PBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => ScreenSuccess(
              image: PImages.successfulPaymentIcon,
              title: 'Payment Sucessful!',
              subTitle: 'Your Item will be shipped soon',
              onPressed: () => Get.offAll(() => const NavigationMenu()))),
          child: const Text('Check Out \$340'),
        ),
      ),
    );
  }
}
