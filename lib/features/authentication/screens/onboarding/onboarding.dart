import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        body: Stack(
      children: [
        ///Horinzonatal Scrollable Page
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBoardingPage(
              image: PImages.onBoardingImage1,
              title: PTexts.onBoardingTitle1,
              subTitle: PTexts.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: PImages.onBoardingImage2,
              title: PTexts.onBoardingTitle2,
              subTitle: PTexts.onBoardingSubTitle2,
            ),
            OnBoardingPage(
              image: PImages.onBoardingImage3,
              title: PTexts.onBoardingTitle3,
              subTitle: PTexts.onBoardingSubTitle3,
            ),
          ],
        ),

        ///Skip Button
        const OnBoardingSkip(),

        ///Dot Navigation SmoothPageIndicator
        const OnBoardingDotNavigation(),

        ///Circular Button
        const OnBoardingNextButton()
      ],
    ));
  }
}

// class OnBoardingNextButton extends StatelessWidget {
//   const OnBoardingNextButton({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = PHelperFunctions.isDarkMode(context);
//     return Positioned(
//         right: PSizes.defaultSpace,
//         bottom: PDeviceUtils.getBottomNavigationBarHeight(),
//         child: ElevatedButton(
//           onPressed: () {},
//           style: ElevatedButton.styleFrom(
//               shape: const CircleBorder(),
//               backgroundColor: dark ? PColors.primary : Colors.black),
//           child: const Icon(Iconsax.arrow_right_3),
//         ));
//   }
// }

// class OnBoardingDotNavigation extends StatelessWidget {
//   const OnBoardingDotNavigation({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = PHelperFunctions.isDarkMode(context);
//
//     return Positioned(
//       bottom: PDeviceUtils.getBottomNavigationBarHeight() + 25,
//       left: PSizes.defaultSpace,
//       child: SmoothPageIndicator(
//         controller: PageController(),
//         count: 3,
//         effect: ExpandingDotsEffect(
//             activeDotColor: dark ? PColors.light : PColors.dark, dotHeight: 6),
//       ),
//     );
//   }
// }

// class OnBoardingSkip extends StatelessWidget {
//   const OnBoardingSkip({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         top: PDeviceUtils.getAppBarHeight(),
//         right: PSizes.defaultSpace,
//         child: TextButton(onPressed: () {}, child: Text('Skip')));
//   }
// }

// class OnBoardingPage extends StatelessWidget {
//   const OnBoardingPage({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.subTitle,
//   });
//
//   final String image, title, subTitle;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(PSizes.defaultSpace),
//       child: Column(
//         children: [
//           Image(
//               width: PHelperFunctions.screenWidth() * 0.8,
//               height: PHelperFunctions.screenHeight() * 0.6,
//               image: AssetImage(image)),
//           Text(
//             title,
//             style: Theme.of(context).textTheme.headlineMedium,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(
//             height: PSizes.spaceBtwItems,
//           ),
//           Text(
//             subTitle,
//             style: Theme.of(context).textTheme.bodyMedium,
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
