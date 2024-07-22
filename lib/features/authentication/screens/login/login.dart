import 'package:ecommerce/commons/styles/spacing_styles.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/widget_login_signup/form_divider.dart';
import '../../../../commons/widgets/widget_login_signup/social_button.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: PSpacingStyle.paddingWithAppBarHeight,
      child: Column(
        children: [
          ///Logo, title and SubTitle
          PLoginHeader(dark: dark),

          ///Form
          const PLoginForm(),

          ///Divider
          PFormDivider(
            dividerText: PTexts.orSignInWith.capitalize!,
          ),
          const SizedBox(
            height: PSizes.spaceBtwSections,
          ),

          ///Footer
          const PSocialButton()
        ],
      ),
    )));
  }
}

// class PSocialButton extends StatelessWidget {
//   const PSocialButton({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: PColors.grey),
//               borderRadius: BorderRadius.circular(100)),
//           child: IconButton(
//             onPressed: () {},
//             icon: const Image(
//               width: PSizes.iconMd,
//               height: PSizes.iconMd,
//               image: AssetImage(PImages.google),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: PSizes.spaceBtwItems,
//         ),
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: PColors.grey),
//               borderRadius: BorderRadius.circular(100)),
//           child: IconButton(
//             onPressed: () {},
//             icon: const Image(
//               width: PSizes.iconMd,
//               height: PSizes.iconMd,
//               image: AssetImage(PImages.facebook),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// class PFormDivider extends StatelessWidget {
//   const PFormDivider({
//     super.key,
//     required this.dividerText,
//   });
//
//   final String dividerText;
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = PHelperFunctions.isDarkMode(context);
//
//     return Row(
//       children: [
//         Flexible(
//             child: Divider(
//           color: dark ? PColors.darkGrey : PColors.grey,
//           thickness: 0.5,
//           indent: 60,
//           endIndent: 5,
//         )),
//         Text(
//           dividerText,
//           style: Theme.of(context).textTheme.labelMedium,
//         ),
//         Flexible(
//             child: Divider(
//           color: dark ? PColors.darkGrey : PColors.grey,
//           thickness: 0.5,
//           indent: 5,
//           endIndent: 60,
//         )),
//       ],
//     );
//   }
// }

// class PLoginHeader extends StatelessWidget {
//   const PLoginHeader({
//     super.key,
//     required this.dark,
//   });
//
//   final bool dark;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image(
//             image: AssetImage(
//                 dark ? PImages.lightAppLogo : PImages.darkAppLogo)),
//         Text(
//           PTexts.loginTitle,
//           style: Theme.of(context).textTheme.headlineMedium,
//         ),
//         const SizedBox(height: PSizes.sm),
//         Text(
//           PTexts.loginSubTitle,
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//       ],
//     );
//   }
// }

// class PLoginForm extends StatelessWidget {
//   const PLoginForm({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         child: Padding(
//       padding: EdgeInsets.symmetric(vertical: PSizes.spaceBtwSections),
//       child: Column(
//         children: [
//           ///Email
//           TextFormField(
//               decoration: const InputDecoration(
//                   prefixIcon: Icon(Iconsax.direct_right),
//                   labelText: PTexts.email)),
//           const SizedBox(
//             height: PSizes.spaceBtwInputFields,
//           ),
//
//           ///Password
//           TextFormField(
//               decoration: const InputDecoration(
//                   prefixIcon: Icon(Iconsax.password_check),
//                   labelText: PTexts.password,
//                   suffixIcon: Icon(Iconsax.eye_slash))),
//           const SizedBox(height: PSizes.spaceBtwInputFields / 2),
//
//           ///RememberMe and Forget Password
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ///Remember Me
//               Row(
//                 children: [
//                   Checkbox(value: true, onChanged: (value) {}),
//                   Text(PTexts.rememberMe)
//                 ],
//               ),
//
//               ///Forget Password
//               TextButton(
//                 onPressed: () {},
//                 child: const Text(PTexts.forgetPassword),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: PSizes.spaceBtwSections,
//           ),
//
//           ///Sign In Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//                 onPressed: () {}, child: const Text(PTexts.signIn)),
//           ),
//           const SizedBox(
//             height: PSizes.spaceBtwItems,
//           ),
//
//           ///Create Account Button
//           SizedBox(
//             width: double.infinity,
//             child: OutlinedButton(
//                 onPressed: () {}, child: const Text(PTexts.createAccount)),
//           ),
//         ],
//       ),
//     ));
//   }
// }
