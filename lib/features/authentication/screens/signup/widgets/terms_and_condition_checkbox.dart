import 'package:ecommerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class PTermsAndConditionCheckBox extends StatelessWidget {
  const PTermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = PHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${PTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${PTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? PColors.white : PColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? PColors.white : PColors.primary)),
          TextSpan(
              text: '${PTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${PTexts.termOfUse} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? PColors.white : PColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? PColors.white : PColors.primary)),
        ]))
      ],
    );
  }
}
