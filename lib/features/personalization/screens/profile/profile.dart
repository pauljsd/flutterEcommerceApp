import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/images/p_circular_image.dart';
import 'package:ecommerce/commons/widgets/shimmers/shimmer.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const PAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: Column(
          children: [
            ///Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
                    final networkImage = controller.user.value.profilePicture;
                    final image =
                        networkImage.isNotEmpty ? networkImage : PImages.user;
                    return controller.imageUploading.value
                        ? const PShimmerEffect(
                            width: 80,
                            height: 80,
                            radius: 80,
                          )
                        : PCircularImage(
                            image: image,
                            width: 80,
                            height: 80,
                            isNetworkImage: networkImage.isNotEmpty,
                          );
                  }),
                  TextButton(
                    child: const Text('Change Profile Picture'),
                    onPressed: () => controller.uploadUserProfilePicture(),
                  )
                ],
              ),
            ),

            ///Details
            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),
            const Divider(),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),

            ///Heading Profile Information
            const PSectionHeading(
              title: 'Profile Information',
              showActionButton: false,
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),

            PProfileMenu(
              onPressed: () => Get.to(() => const ChangeName()),
              title: 'Name:',
              value: controller.user.value.fullName,
            ),
            PProfileMenu(
              onPressed: () {},
              title: 'Username:',
              value: controller.user.value.username,
            ),

            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),
            const Divider(),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),

            ///Heading Personal Information
            const PSectionHeading(
              title: 'Personal Information',
              showActionButton: false,
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),
            PProfileMenu(
              onPressed: () {},
              title: 'UserID:',
              value: controller.user.value.id,
              icon: Iconsax.copy,
            ),
            PProfileMenu(
              onPressed: () {},
              title: 'Email:',
              value: controller.user.value.email,
            ),
            PProfileMenu(
              onPressed: () {},
              title: 'Phone Number:',
              value: controller.user.value.phoneNumber,
            ),
            PProfileMenu(
              onPressed: () {},
              title: 'Gender:',
              value: 'Sigma Male',
            ),
            PProfileMenu(
              onPressed: () {},
              title: 'Date of Birth:',
              value: '16-06-199*',
            ),
            const Divider(),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),

            Center(
              child: TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text('Close Account',
                    style: TextStyle(color: Colors.red)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
