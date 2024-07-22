import 'package:ecommerce/commons/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce/commons/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/features/personalization/screens/address/address.dart';
import 'package:ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../commons/widgets/appbar/appbar.dart';
import '../../../../commons/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/screens/order/order.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            PPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///AppBar
                  const PAppBar(
                    title: Text('Account'),
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),

                  ///UserProfile Card
                  PUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(PSizes.defaultSpace),
              child: Column(
                children: [
                  ///Account Settings
                  const PSectionHeading(title: 'Account Settings'),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  PSettingsMenuTile(
                      onTap: () => Get.to(() => const UserAddressScreen()),
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subTitle: 'Set shopping delivery address'),
                  const PSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My cart',
                      subTitle: 'Add, remove products and move to checkout'),
                  PSettingsMenuTile(
                      onTap: () => Get.to(() => const OrderScreen()),
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In Progress and Completed Orders'),
                  const PSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account'),
                  const PSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all discounted coupons'),
                  const PSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'My Notifications',
                      subTitle: 'Set any type of notification message'),
                  const PSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts'),

                  ///App Settings
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                  const PSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  const PSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Database'),
                  PSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'GeoLocation',
                    subTitle: 'Set Recommendation based on Location',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  PSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subTitle: 'Search Result is safe for all ages',
                      trailing: Switch(value: false, onChanged: (value) {})),
                  PSettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subTitle: 'Set Image Quality to be seen',
                      trailing: Switch(value: false, onChanged: (value) {})),

                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      child: const Text('Log Out'),
                    ),
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections * 2.5,
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
