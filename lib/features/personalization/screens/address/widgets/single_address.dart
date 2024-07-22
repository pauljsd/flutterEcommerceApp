import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class PSingleAddress extends StatelessWidget {
  const PSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return PRoundedContainer(
      padding: const EdgeInsets.all(PSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? PColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? PColors.darkerGrey
              : PColors.grey,
      margin: const EdgeInsets.only(bottom: PSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? PColors.dark
                      : PColors.light
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Paul Atolagbe',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: PSizes.sm / 2,
              ),
              const Text(
                '(+234) 8154505895',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: PSizes.sm / 2,
              ),
              const Text(
                '30 Ireku Street, Oworo, Lagos',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              const SizedBox(
                height: PSizes.sm / 2,
              )
            ],
          )
        ],
      ),
    );
  }
}
