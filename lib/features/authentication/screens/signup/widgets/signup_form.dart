import 'package:ecommerce/features/authentication/screens/signup/widgets/terms_and_condition_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';

class PSignUpForm extends StatelessWidget {
  const PSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    // final dark = PHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          ///first name and last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                    controller: controller.firstname,
                    validator: (value) =>
                        PValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: PTexts.firstName,
                        prefixIcon: Icon(Iconsax.user))),
              ),
              const SizedBox(
                width: PSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                    controller: controller.lastname,
                    validator: (value) =>
                        PValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: PTexts.lastName,
                        prefixIcon: Icon(Iconsax.user))),
              ),
            ],
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),

          ///username
          TextFormField(
              controller: controller.username,
              validator: (value) =>
                  PValidator.validateEmptyText('Username', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: PTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit))),

          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),

          ///Email
          TextFormField(
              controller: controller.email,
              validator: (value) => PValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: PTexts.email, prefixIcon: Icon(Iconsax.direct))),

          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),

          ///Phone Number
          TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => PValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: PTexts.phoneNo, prefixIcon: Icon(Iconsax.call))),

          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),

          ///Password
          Obx(
            () => TextFormField(
                validator: (value) => PValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: PTexts.password,
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ))),
          ),

          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),

          ///Terms and Condition Check Box
          const PTermsAndConditionCheckBox(),
          const SizedBox(
            height: PSizes.spaceBtwItems,
          ),

          /// Sign up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(PTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
