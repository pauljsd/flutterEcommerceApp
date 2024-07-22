import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/commons/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class PBillingPaymentSection extends StatelessWidget {
  const PBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        PSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            PRoundedContainer(
              width: 60,
              height: 45,
              backgroundColor: dark ? PColors.white : PColors.light,
              padding: const EdgeInsets.all(PSizes.sm),
              child: const Image(
                image: AssetImage(PImages.paypal),
                fit: BoxFit.contain,
              ),
            )
          ],
        )
      ],
    );
  }
}
