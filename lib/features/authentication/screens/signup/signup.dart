import 'package:ecommerce/commons/widgets/widget_login_signup/form_divider.dart';
import 'package:ecommerce/commons/widgets/widget_login_signup/social_button.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(
                PTexts.signUpTittle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: PSizes.spaceBtwItems),

              ///Form
              const PSignUpForm(),

              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),

              ///Divider
              PFormDivider(dividerText: PTexts.orSignUpWith.capitalize!),

              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),

              ///SocialButton
              const PSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
