import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class PCouponCode extends StatelessWidget {
  const PCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return PRoundedContainer(
        showBorder: true,
        backgroundColor: dark ? PColors.dark : PColors.white,
        padding: const EdgeInsets.only(
            top: PSizes.sm,
            bottom: PSizes.sm,
            right: PSizes.sm,
            left: PSizes.md),
        child: Row(
          children: [
            ///TextField
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Have a Promo code? Enter here',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? PColors.white.withOpacity(0.5)
                    : PColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: const Text('Apply'),
            )
          ],
        ));
  }
}
